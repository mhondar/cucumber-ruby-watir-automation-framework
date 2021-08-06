require './features/tools/Tools.rb'

class MiCuentaRpuntos
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/mi_cuenta/micuenta_misrpuntos_selectors.json"))
        @datos = JSON.parse(File.read("./features/data/usuarios_mi_cuenta.json"))
        # barra izquierda
        @btn_revisarBeneficios = $driver.element(xpath: @selectors["revisarBeneficios"])
        @btn_terminosYcondiciones = $driver.element(xpath: @selectors["terminosycondiciones"])
        @cantidadrpuntos = $driver.element(xpath: @selectors["cantidadrpuntos"])
        @btn_canjear = $driver.element(xpath: @selectors["btn_canjear"])
        @carrucel_canje_giftcard = $driver.element(xpath: @selectors["carrucel_canje_giftcard"])
        @beneficios = $driver.element(xpath: @selectors["beneficios"])
        @canjes_realizados = $driver.element(xpath: @selectors["canjes_realizados"])
        @list_canjes = $driver.elements(xpath: @selectors["list_canjes"])
        @list_categorias_canje = $driver.elements(xpath: @selectors["list_categorias_canje"])
        @categ_canje_giftcard_selected = $driver.element(xpath: @selectors["categ_canje_giftcard_selected"])
        @right_arrow = $driver.element(css: @selectors["right_arrow"])
        @list_products_giftcard = $driver.elements(xpath: @selectors["list_products_giftcard"])
        @right_arrow_products = $driver.element(xpath: @selectors["right_arrow_products"])
        @valor_giftcard_selected = $driver.element(xpath: @selectors["valor_giftcard_selected"])
        @btn_canjear_product_disabled = $driver.element(xpath: @selectors["btn_canjear_product_disabled"])
        @btn_canjear_product_enabled = $driver.element(xpath: @selectors["btn_canjear_product_enabled"])
        @tit_page_puntos_go = $driver.element(xpath: @selectors["titulo_page_ripley_puntos_go"])
        @sin_rpuntos = $driver.element(xpath: @selectors["sin_rpuntos"])
    end

    def verificar_pagina
        begin
            $tools.esperar_elemento(@tit_page_puntos_go)
        rescue
            $tools.fallo("Problemas al cargar pagina de Mis Ripley Puntos")
        end
    end

    def verificar_puntos_go
        $tools.esperar_elemento(@cantidadrpuntos)

        rpuntos_page = $driver.element(xpath: '//p[contains(text(),"Hasta la fecha has acumulado:")]/parent::div/div/p').text.delete(".")

        puts "Pagina: los rpuntos del cliente son #{rpuntos_page}"
        puntos_api = get_puntos_go
        if rpuntos_page == puntos_api
            puts "Rpuntos Correctos #{rpuntos_page}"
        else
            $tools.fallo("Rpuntos incorrectos deben der #{puntos_api} y se muestran #{rpuntos_page}")
        end
    end

    def verificar_cant_puntos_go(puntos)
        if (!@cantidadrpuntos.present?)
            $tools.esperar_elemento(@sin_rpuntos)
            puts "Cliente sin Ripley Puntos acumulados"
        else
# //ver si aplica esta seccion ya que este metodo solo se llama cuando cliente tiene 0 rpuntos
            $tools.esperar_elemento(@cantidadrpuntos)
            rpuntospage = @cantidadrpuntos.text.delete(".").to_i
            if rpuntospage == puntos
                puts "Rpuntos Correctos #{rpuntospage}"
            else
                $tools.fallo("Rpuntos incorrectos deben der #{puntos} y se muestran #{rpuntospage}")
            end
        end
    end

    def get_puntos_go
        rut = (@datos[$categoria]["rut"])
        rut.slice!(rut.length-1,rut.length)

        uri = URI("https://ejmi.fa.us6.oraclecloud.com/crmRestApi/resources/11.13.18.05/loyMembers/CL01" + rut)
        Net::HTTP.start(uri.host, uri.port,
        :use_ssl => uri.scheme == 'https', 
        :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

            request = Net::HTTP::Get.new uri.request_uri
            request.basic_auth 'loyalty.integrator', 'L0yalt1_1nt_2019'

            response = http.request request # Net::HTTPResponse object

            result = JSON.parse(response.body)
            puts "API: los rpuntos del cliente son #{result["Points"]}" 

            return result["Points"]
        end
    end

    def buscar_categoria_canje(categoria)
        cant = @list_categorias_canje.count
        puts "Se muestran #{cant} categorias para canjear"
        count = 1
        case categoria
        when "Gift Card"
            until ((@categ_canje_giftcard_selected.present? == true) || (count > cant))  do
                $tools.click(@right_arrow)
                count += 1
                sleep 1
            end
            if @categ_canje_giftcard_selected.present?
                puts "#{categoria} seleccionada"
            end
        else
            $tools.fallo("Categoría de Canje no mapeado")
        end
        
    end

    def click_canjear
        $tools.click(@btn_canjear)
    end

    def validar_productos_habilitados_canje
        begin
            $tools.esperar_elemento(@carrucel_canje_giftcard)
        rescue
            $tools.fallo("No se muestra el carrucel de opciones para canjear")
        end

        cant_products = @list_products_giftcard.count
        puts "Existen #{cant_products} productos listados"
        puntos_disponibles = get_puntos_go.to_i
        puts "Puntos Go del Cliente: #{puntos_disponibles}"
        count = 1
        until (count > cant_products) do
            validar_boton_canjear(puntos_disponibles)
            $tools.click(@right_arrow_products)
            sleep 2
            count += 1
        end
        puts "Se revisaron #{count} productos y se visualizan acorde a los puntos disponibles correctamente"
    end

    def validar_boton_canjear(puntos_disponibles)
        $tools.esperar_elemento(@valor_giftcard_selected)
        text_valor_gift_card = @valor_giftcard_selected.text
        array = text_valor_gift_card.split(" ")
        valor = array[0].delete(".").to_i
        puts "El valor de la Gift Card es #{valor}"
        if valor <= puntos_disponibles
            begin
                $tools.esperar_elemento(@btn_canjear_product_enabled)
                puts "Boton Canjear Habilitado"
            rescue 
                $tools.fallo("No se habilita el botón canjear teniendo en cuenta que los puntos disponibles son #{puntos_disponibles} y el valor de la Gift Card es #{valor}")     
            end
        elsif valor > puntos_disponibles
            begin
                $tools.esperar_elemento(@btn_canjear_product_disabled)
                puts "Boton Canjear Deshabilitado"
            rescue 
                $tools.fallo("No se inhabilita el botón canjear teniendo en cuenta que los puntos disponibles son #{puntos_disponibles} y el valor de la Gift Card es #{valor}")     
            end
        else
            $tools.fallo("Comparación de Puntos CV Valor de Canje incorrecto")
        end
    end

    def click_RevisarBeneficios
        $tools.click(@btn_revisarBeneficios)
    end

    def click_terminos_y_condiciones
        $tools.click(@btn_terminosYcondiciones)
    end

    def validar_terminos_y_condiciones
        $tools.realiza_cambio_foco_pestana
        sleep 2
        # $driver.windows[1].use          
        if $driver.url == "https://www.bancoripley.cl/pdf/terminosycondiciones-rpuntos2021.pdf" 
            puts "Se muestra PDF de terminos y condiciones"
        else
            $tools.fallo("No se muestra los terminos y condiciones")  
        end
    end

    def validar_beneficios
        begin
            $tools.esperar_elemento(@beneficios)
        rescue
            $tools.fallo("No se muestran los beneficios")
        end
    end

    def validar_canjes_realizados
        begin
            $tools.esperar_elemento(@canjes_realizados)
            puts "Se muestran #{@list_canjes.count} productos canjeados"
        rescue
            $tools.fallo("No se muestran los canjes realizados")
        end
    end
    
end