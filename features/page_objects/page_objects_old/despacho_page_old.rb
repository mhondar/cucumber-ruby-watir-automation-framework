class DespachoPageOld
    def initialize
        selectors = JSON.parse(File.read("./features/selectors/selectors_old/despacho_selectors_old.json"))
        @opcion_entrega = $driver.element(xpath: selectors["text_fecha_Entrega"])
        @continuar= $driver.element(xpath: selectors["btn_continuar_compra"])        
        @direccion_invitado=$driver.element(xpath: selectors["direccion_invitado"])
        @departamento_invitado=$driver.element(xpath: selectors["departamento_invitado"])
        @provincia_invitado=$driver.element(xpath: selectors["provincia_invitado"])
        @distrito_invitado=$driver.element(xpath: selectors["distrito_invitado"])
        @crear_direccion_invitado =$driver.element(xpath: selectors["crear_direccion"])
        @telefono=$driver.element(xpath: selectors["telefono"])
        @confirmar_continuar =$driver.element(xpath: selectors["confirmarycontinuar"])
        @loading_screen =$driver.element(xpath: selectors["loading"])
    end

    def click_continuar
        esperar_end_loading
        $tools.esperar_elemento(@continuar)
        $tools.click(@continuar)
    end

    def verifico_pagina_despacho
        begin
            $tools.esperar_elemento ("//section[@id=\"shipping-method\"]")
        rescue 
            $tools.fallo("No se muestra pantalla de Bienvenida")
        end
    end

    def seleccionar_tipo_despacho_old(despacho)
        
        if despacho == "A domicilio"
            #idTipoDespacho= "RET_TIENDA_DD" 
            idTipoDespacho="Despacho a domicilio"
        else    
            #idTipoDespacho= "RET_TIENDA_RT"
            idTipoDespacho="Retiro en tienda"
        end

        sleep 10
        $driver.element(xpath: '//section[@id="shipping-method"]').wait_until(&:present?) 
        esperar_end_loading       
        #tipo_despacho = $driver.element(xpath: '//a[@id= "' + idTipoDespacho + '"]/div/div/span'   )       
        tipo_despacho = $driver.element(xpath: '//label[contains(text(), "' + idTipoDespacho + '")]') 
        puts idTipoDespacho
        $tools.click(tipo_despacho)
        esperar_end_loading
        sleep 5

        if despacho == "A domicilio"
            $tools.esperar_elemento(@opcion_entrega)    
        end     



        #  case despacho

        #  when "Retiro en tienda"
        #     $tools.click(@continuar)
        #     $tools.esperar_elemento(@confirmarycotinuar)
        #     $tools.click(@confirmarycotinuar)
            
        #  when "A domicilio"
        #     $tools.esperar_elemento(@opcion_entrega)
        #    # $tools.click(@continuar)
        #  end         

    end

    def crear_direccion_invitado
        sleep 1
        $tools.insertar_texto(@direccion_invitado, "Direccion Prueba")
        sleep 1
        $tools.click(@departamento_invitado)
        sleep 1
        $tools.click(@provincia_invitado)
        sleep 1
        $tools.click(@distrito_invitado)
        sleep 1
        $tools.insertar_texto(@telefono, "999999999")
        sleep 1
        $tools.click(@crear_direccion_invitado)
        sleep 2
        esperar_end_loading

    end

    def seleccionar_tienda(retiro)
        case retiro
        when "Disponible"
            esperar_end_loading
            tienda_seleccionada = $driver.element(xpath: '//li[@class="tiendas_id"]/div[3]')            
            $tools.click(tienda_seleccionada)
            esperar_end_loading
            sleep 3
        when "1 de 2 disponibles"
            $tools.seleccionar_value(@select_zona, "20")
            tienda_seleccionada = $driver.element(xpath: '//div[starts-with(@class, "PhysicalStores_row")]//div[starts-with(@class, "PhysicalStores_availableColumn")]//div[starts-with(@class, "PhysicalStores_someAvailable")]/parent::div/parent::div/following-sibling::div/button')
            $tools.click(tienda_seleccionada)
            esperar_end_loading
        end
    end


    def seleccionar_tienda_criterio(criterio)
        puts "A"
        case criterio
        when "Disponible" 
            puts "B"
            clase = 'PhysicalStores_availableColumn'
        when "Pendientes Disponibles" 
            clase = 'PhysicalStores_someAvailable'
        end
        cant = $driver.elements(xpath: '//div[starts-with(@class, "PhysicalStores_row")]//div[starts-with(@class, "' + clase + '")]').count
        puts "Cantidad es: #{cant}"
        puts "C"
        numero = 1
        tienda = $driver.element(xpath: '//div[starts-with(@class, "PhysicalStores_row")][' + numero.to_s + ']//div[starts-with(@class, "' + clase + '")]/following-sibling::div')
        @sucursal = $driver.element(xpath: '//div[starts-with(@class, "PhysicalStores_row")][' + numero.to_s + ']//div[starts-with(@class, "' + clase + '")]/preceding-sibling::div//h4').text
        puts "Seleccionada #{@sucursal}"
        $tools.click tienda
        puts "D"
        esperar_end_loading
        alert_error = $driver.element(xpath: '//div[starts-with(@class, "alert_error")]')
        while numero <= cant
            puts "E"
            if alert_error.present?
                puts "F"
                puts alert_error.text
                $tools.click @selecionar_otra_tienda
                numero += 1
                esperar_end_loading
                tienda = $driver.element(xpath: '//div[starts-with(@class, "PhysicalStores_row")][' + numero.to_s + ']//div[starts-with(@class, "' + clase + '")]/following-sibling::div')
                @sucursal = $driver.element(xpath: '//div[starts-with(@class, "PhysicalStores_row")][' + numero.to_s + ']//div[starts-with(@class, "' + clase + '")]/preceding-sibling::div//h4').text
                puts "Seleccionada #{@sucursal}"
                $tools.click tienda
                esperar_end_loading
            else
                break
            end
        end
        if numero > cant 
            puts "G"
            $tools.fallo 'Ninguna Tienda estaba disponible para ser seleccionada'
        end
    end

    def indicar_quien_retira(retiro)
        esperar_end_loading
        #quien_retira = $driver.element(xpath: '//p[contains(text(), "' + retiro + '")]/parent::label')
        #$tools.click(quien_retira)
        if retiro == "Un tercero"
            persona = Persona.new
            datos_persona = persona.generar_persona
            $tools.insertar_texto(@rut_tercero, datos_persona["rut"])
            $tools.insertar_texto(@nombre_tercero, (datos_persona["rut"] + " " +  datos_persona["apellido"]))
            $tools.clear_and_inserta_texto(@celular, datos_persona["celular"])
        end
        #$tools.clear_and_inserta_texto(@celular, "944590547")
        $tools.click(@confirmar_continuar)
    end

    def esperar_end_loading
        timeout = 0
        while(@loading_screen.present? && (timeout < 60))
            sleep 2
            timeout += 1
        end
    end



end    