class PaymentsOld
    def initialize 
        selectors = JSON.parse(File.read("./features/selectors/selectors_old/payment_selectors_old.json"))
        @pagar = $driver.element(xpath: selectors["btn_pagar"])
        @numero_tarjeta = $driver.element(xpath: selectors["text_numero_tarjeta"])
        @fechaexpiracion = $driver.element(xpath: selectors["text_fecha_exp"])
        @opciondni = $driver.element(xpath: selectors["opt_dni"])
        @cvv = $driver.element(xpath: selectors["text_cod_seguridad"])
        @tipoDocumento = $driver.element(xpath: selectors["cmb_tipo_docu"])
        @numeroDocumento = $driver.element(xpath: selectors["text_num_documento"])
        @validarIngresoDatos= $driver.element(xpath: selectors["chk_ingreso_datos"])
    end

    def  verifico_pagina_pago
        begin
            $tools.esperar_elemento(@validarIngresoDatos)
            puts "Pagina de Confirmacion visible"
        rescue
            $tools.fallo("Problemas al cargar pagina de pago")
        end
    end
    
    def ingreso_datos_medio_pago (medio)
        sleep 1
        #
        #_2
        datos_pago = JSON.parse(File.read("./features/data/medios_pago.json"))
        $mediopago.set_tarjeta(datos_pago[$ambiente][medio]["numero"])
        case medio
        when "tarjeta_ripley"
            @numero_tarjeta.wait_until(&:present?)
            $tools.insertar_texto(@numero_tarjeta, datos_pago[$ambiente][medio]["numero"])
            sleep 1
            $tools.insertar_texto(@fechaexpiracion, datos_pago[$ambiente][medio]["fchexp"])
            sleep 1
            $tools.insertar_texto(@cvv, datos_pago[$ambiente][medio]["cvv"])
            sleep 1
            $tools.click(@tipoDocumento)
            sleep 1
            $tools.click(@opciondni)
            sleep 1
            $tools.insertar_texto(@numeroDocumento, datos_pago[$ambiente][medio]["rut"])
            sleep 1
            #$tools.click(@pagar)
        # when "tarjeta_credito","tarjeta_credito_rechazar"
        #     $tools.esperar_elemento @numero_tarjeta_credito 
        #     $tools.insertar_texto(@numero_tarjeta_credito, datos_pago[$ambiente][medio]["numero"])
        #     sleep 1
        #     $tools.insertar_texto(@fecha_expiracion, datos_pago[$ambiente][medio]["expiracion"])
        #     sleep 1           
        #     $tools.insertar_texto(@cod_seg, datos_pago[$ambiente][medio]["cvv"])
        #     sleep 1           
        #     $tools.click(@btn_aceptar)             
        #     sleep 1 
        # when "tarjeta_debito"
        #     @select_banco.wait_until(&:present?)
        #     $tools.click(@select_banco)
        #     $driver.send_keys :down
        #     $driver.send_keys :down
        #     $driver.send_keys :enter
        #     $tools.insertar_texto(@numero_tarjeta_deb, datos_pago[$ambiente][medio]["numero"])
        #     $tools.click(@btn_continuar)
        #     @tb_rut.wait_until(&:present?)
        #     $tools.insertar_texto(@tb_rut, datos_pago[$ambiente][medio]["rut_tarjeta"]) 
        #     $tools.insertar_texto(@tb_clave, datos_pago[$ambiente][medio]["clave_tarjeta"]) 
        #     $tools.click(@tb_aceptar)
        #     sleep 1
            
        #     $tools.click(@tb_continuar)
        # when "gifcard_empresas"
        #     @numero_gifcard.wait_until(&:present?)
        #     $tools.insertar_texto(@numero_gifcard, datos_pago[$ambiente][medio]["numero"])
        #     $tools.insertar_texto(@clave, datos_pago[$ambiente][medio]["clave"])
        #     $tools.click(@btn_validar)
            # FALTA VALIDAR
        end
    end 
end