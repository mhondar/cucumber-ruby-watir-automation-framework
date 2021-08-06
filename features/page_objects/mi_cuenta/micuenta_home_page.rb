require './features/tools/Tools.rb'
require 'net/http'
require 'net/https'
require 'uri'

class MiCuentaHomePage
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/mi_cuenta/micuenta_home_selectors.json"))
        
        # barra izquierda
            @title_categoriaCliente = $driver.element(xpath: @selectors["barra_izquierda"]["categoria_cliente"])
            @title_rpuntos = $driver.element(xpath: @selectors["barra_izquierda"]["rpuntos"])
            @btn_micuenta = $driver.element(xpath: @selectors["barra_izquierda"]["btn_micuenta"])
            @btn_misdatos = $driver.element(xpath: @selectors["barra_izquierda"]["btn_misdatos"])
            @btn_mispuntos = $driver.element(xpath: @selectors["barra_izquierda"]["btn_mispuntos"])
            @btn_miscompras = $driver.element(xpath: @selectors["barra_izquierda"]["btn_miscompras"])
            @btn_beneficios = $driver.element(xpath: @selectors["barra_izquierda"]["btn_beneficios"])
            @btn_canjes_realizados = $driver.element(xpath: @selectors["barra_izquierda"]["btn_canjes_realizados"])
            @btn_cerrarsesion= $driver.element(xpath: @selectors["barra_izquierda"]["btn_cerrar_sesion"])
            @btn_direcciones= $driver.element(xpath: @selectors["barra_izquierda"]["btn_direcciones"])
            @btn_solicitudes = $driver.element(xpath: @selectors["barra_izquierda"]["btn_solicitudes_atencion"])
            @sin_rpuntos = $driver.element(xpath: @selectors["barra_izquierda"]["sin_rpuntos"])


        # menu superior
            @menu_iconoripley = $driver.element(xpath: @selectors["menu_superior"]["menu_iconoripley"])
            @menu_ripleycom = $driver.element(xpath: @selectors["menu_superior"]["menu_ripleycom"])
    end

    def esperar_end_loading
        timeout = 0
        while(!@loading_screen.present? && (timeout < 60))
            sleep 2
            timeout += 1
        end
    end

    def validar_rpuntos
            datos = JSON.parse(File.read("./features/data/usuarios_mi_cuenta.json"))
            rut = (datos[$categoria]["rut"])

            rut.slice!(rut.length-1,rut.length)

            uri = URI("https://ejmi.fa.us6.oraclecloud.com/crmRestApi/resources/11.13.18.05/loyMembers/CL01" + rut + "?onlyData=true&fields=MemberNumber,NDoc_sinDV_Cust_c,TipoDocumento_Cust_c,ContactFirstName,ContactLastName,MemberName,LoyProgramName,StatusCode,Points,StartDate,TierCreatedBy_Cust_c,TierStartDt_Cust_c")

            Net::HTTP.start(uri.host, uri.port,
            :use_ssl => uri.scheme == 'https', 
            :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
                request = Net::HTTP::Get.new uri.request_uri
                request.basic_auth 'loyalty.integrator', 'L0yalt1_1nt_2019'
                response = http.request request # Net::HTTPResponse object
                result = JSON.parse(response.body)
                
                puts "API: los rpuntos del cliente son #{result["Points"]}" 
                $tools.esperar_elemento(@title_rpuntos)
                rpuntospage = @title_rpuntos.text.delete(".").delete(" ")
                puts "Pagina: los rpuntos del cliente son #{rpuntospage}"
                if rpuntospage == result["Points"]
                    puts "Rpuntos Correctos #{rpuntospage}"
                else
                    $tools.fallo("Rpuntos incorrectos deben der #{result["Points"]} y se muestran #{rpuntospage}")
                end
            end        
    end

    def validar_cantidad_rpuntos(puntos)        
        if (!@title_rpuntos.present?)
            $tools.esperar_elemento(@sin_rpuntos)
            puts "Cliente sin Ripley Puntos acumulaods"
        else                   
# //ver si aplica esta seccion ya que este metodo solo se llama cuando cliente tiene 0 rpuntos

        $tools.esperar_elemento(@title_rpuntos)
        rpuntospage = @title_rpuntos.text.delete(".").to_i
        puts "Pagina: los rpuntos del cliente son #{rpuntospage}"
            if rpuntospage == puntos
                puts "Rpuntos Correctos #{rpuntospage}"
            else
                $tools.fallo("Rpuntos incorrectos deben der #{puntos} y se muestran #{rpuntospage}")
            end
        end
    end

    def validar_categoria_cliente
        puts "La categoria es #{$categoria}"
        sin_categoria = "Sin CategorÍA"
        if $categoria != sin_categoria
            begin
                $tools.esperar_elemento(@title_categoriaCliente)
                puts "Se muestra categoria del cliente"
            rescue
                $tools.fallo("Error al mostrar categoria del cliente")
            end
            if (@title_categoriaCliente.text == $categoria)
                puts "Categoría del cliente correcta #{@title_categoriaCliente.text}"
            else
                $tools.fallo("Error en Categoría del cliente mostrada debe ser #{$categoria} y se muestra #{@title_categoriaCliente.text}")
            end
        else
            puts "Producto sin categoría"
        end

    end

    def validar_categoria_cliente_set(categoria)
        sleep 2
        # $tools.esperar_elemento(@title_categoriaCliente)
        if (!@title_categoriaCliente.present?)
            puts "Cliente no tiene Categoría"
        elsif (@title_categoriaCliente.text == categoria)
            puts "Categoría del cliente correcta #{@title_categoriaCliente.text}"
        else
            $tools.fallo("Error en Categoría del cliente mostrada debe ser #{categoria} y se muestra #{@title_categoriaCliente.text}")
        end
    end
    
    def click_menu_lateral(menu) 
        sleep 3
        case menu
        when "Mi Cuenta"
            $tools.click(@btn_micuenta)
        when "Direcciones"
            $tools.click(@btn_direcciones)
        when "Solicitudes de atencion"
            $tools.click(@btn_solicitudes)
        when "Mis Datos"
            $tools.click(@btn_misdatos)
        when "Mis Compras"
            $tools.click(@btn_miscompras)
        when "Mis Ripley Puntos Go"
            $tools.click(@btn_mispuntos)
        when "Beneficios"
            $tools.click(@btn_beneficios)
        when "Canjes realizados"
            $tools.click(@btn_canjes_realizados)
        when "Cerrar Sesión"
            $tools.click(@btn_cerrarsesion)
        else
            $tools.fallo("Opción de menú no mapeada")
        end
    end

    def click_menu_superior(menu)
        sleep 2
       
        case menu
        when "Ripley.com"
            $tools.click(@menu_ripleycom)
        when "Banco Ripley"
            
        when "Ripley Puntos Go"
            
        when "Seguros Ripley"

        when "Clubes Ripley"

        when "Icono Ripley"
            $tools.click(@menu_iconoripley)
        end
    end

end

