class PagoPageold
    def initialize
        selectors = JSON.parse(File.read("./features/selectors/selectors_old/pago_selectors_old.json"))
        @seccion_metodo_pago = $driver.element(xpath: selectors["seccion_metodo_pago"])
        @btn_continuar = $driver.element(xpath: selectors["button_continuar"])
        @btn_Tarjeta_Ripley = $driver.element(xpath: selectors["select_tarjeta_ripley"])
        @seleccionaFactura= $driver.element(xpath: selectors["SeleccionarFactura"]) 
        @RutFactura= $driver.element(xpath: selectors["RutFactura"]) 
        @RazonSocialFactura= $driver.element(xpath: selectors["RazonSocialFactura"]) 
        @ContinuarFactura= $driver.element(xpath: selectors["ContinuarFactura"]) 
        @loading_screen =$driver.element(xpath: selectors["loading"])
        @SeleccionarBoleta =$driver.element(xpath: selectors["SeleccionarBoleta"])
        
    end

    def seleccionar_comprobante(comprobante)
        esperar_end_loading 

        if comprobante == "Factura"
            $tools.esperar_elemento(@seleccionaFactura)
            $tools.click(@seleccionaFactura)
        else
            $tools.esperar_elemento(@SeleccionarBoleta)
            $tools.click(@SeleccionarBoleta)
        end   
        esperar_end_loading  
    end
    
    def completo_datos_factura
        $tools.esperar_elemento(@RutFactura)
        medio = "tarjeta_ripley"
        credenciales = JSON.parse(File.read("./features/data/medios_pago.json"))
        $mediopago = MedioPago.new(medio, credenciales[$ambiente][medio]["rut"], credenciales[$ambiente][medio]["numero"])
        $log.set_rut(credenciales[$ambiente][medio]["rut"])
        #$tools.insertar_texto(@RutFactura, credenciales[$ambiente][medio]["rut"])
        $tools.insertar_texto(@RutFactura, "10164090588")
        $tools.insertar_texto(@RazonSocialFactura, "Razon Social prueba")
        $tools.click(@ContinuarFactura)
    end

    def verifico_pagina_pago
        count = 0
        begin
            $tools.esperar_elemento(@seccion_metodo_pago)
        rescue
            if count < 3
                $driver.refresh
                count += 1
            else
                $tools.fallo("Pagina de pago no disponible")
            end
        end
    end

    def click_continuar
        sleep 5
        $tools.click(@btn_continuar)
    end

    def click_tarjeta_Ripley
        sleep 5
        $tools.click(@btn_Tarjeta_Ripley)
        sleep 10
    end

    def esperar_end_loading
        timeout = 0
        while(@loading_screen.present? && (timeout < 60))
            sleep 2
            timeout += 1
        end
    end   

end        
