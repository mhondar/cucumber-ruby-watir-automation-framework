class TransbankPage

    def initialize
        # datos de tarjeta credito transbank
        @selectors = JSON.parse(File.read("./features/selectors/transbank_selectors.json"))
        @valor_a_pagar = $driver.element(xpath: @selectors["datos_pago"]["tarjeta_credito_transbank"]["valor_a_pagar"])
        @numero_tarjeta_cred = $driver.text_field(id: @selectors["datos_pago"]["tarjeta_credito_transbank"]["numero_tarjeta"])
        @mes_venc = $driver.text_field(id: @selectors["datos_pago"]["tarjeta_credito_transbank"]["mes_venc"])
        @annio_venc = $driver.text_field(id: @selectors["datos_pago"]["tarjeta_credito_transbank"]["annio_venc"])
        @mesannio_venc = $driver.text_field(id: @selectors["datos_pago"]["tarjeta_credito_transbank"]["mesannio_venc"])
        @cod_seguridad = $driver.text_field(id: @selectors["datos_pago"]["tarjeta_credito_transbank"]["cod_seguridad"])
        @btn_continuar = $driver.button(xpath: @selectors["datos_pago"]["tarjeta_credito_transbank"]["btn_continuar"])
        @btn_pagar = $driver.button(xpath: @selectors["datos_pago"]["tarjeta_debito"]["btn_pagar"])
        @cuotas_cred = $driver.select_list(xpath: @selectors["datos_pago"]["tarjeta_credito_transbank"]["cuotas"])
        @tb_rut = $driver.frame(name:"transicion").element(id: @selectors["datos_pago"]["tarjeta_credito_transbank"]["tb_rut"])
        @tb_clave = $driver.frame(name:"transicion").element(id: @selectors["datos_pago"]["tarjeta_credito_transbank"]["tb_clave"])
        @tb_aceptar = $driver.frame(name:"transicion").element(xpath: @selectors["datos_pago"]["tarjeta_credito_transbank"]["tb_aceptar"])
        @tb_continuar = $driver.frame(name:"transicion").element(xpath: @selectors["datos_pago"]["tarjeta_credito_transbank"]["tb_continuar"])
        # datos tarjeta debito
        @select_banco = $driver.button(xpath: @selectors["datos_pago"]["tarjeta_debito"]["select_banco"])
        @test_banco = $driver.element(xpath: @selectors["datos_pago"]["tarjeta_debito"]["test_banco"])
        @numero_tarjeta_deb = $driver.text_field(xpath: @selectors["datos_pago"]["tarjeta_debito"]["numero_tarjeta"])

        @mensaje_validacion = $driver.element(xpath: @selectors["mensaje_validacion"])
        @msg_continuar = $driver.element(xpath: @selectors["msg_continuar"])

    end

    def validar_mensaje_validacion_webpay
        begin 
            $tools.esperar_elemento(@mensaje_validacion)
        rescue
            $tools.fallo("No se muestra mensaje de Alerta indicando que se Validará el medio de pago con Webpay")
        end
    end

    def click_continuar_mensaje_validacion
        $tools.click @msg_continuar
    end

    def validar_pasarela_webpay
        begin
            @select_banco.wait_until(&:present?)
        rescue 
            $tools.fallo "No se muestra la pasarela de pago de WebPay"
        end
    end

    def validar_pasarela_transbank
        begin
            @numero_tarjeta_cred.wait_until(&:present?)
        rescue 
            $tools.fallo "No se muestra la pasarela de pago de Transbank"
        end
    end

    def ingreso_datos_medio_pago_transbank(medio)
        sleep 3
        datos_pago = JSON.parse(File.read("./features/data/medios_pago.json"))
        case medio

        when "tarjeta_credito", "tarjeta_credito_rechazar"
            @numero_tarjeta_cred.wait_until(&:present?)
            $tools.insertar_texto(@numero_tarjeta_cred, datos_pago[$ambiente][medio]["numero"]) 
            #$tools.insertar_texto(@mes_venc, datos_pago[$ambiente][medio]["mes"])
            #$tools.insertar_texto(@annio_venc, datos_pago[$ambiente][medio]["anio"])
            $tools.insertar_texto(@mesannio_venc, datos_pago[$ambiente][medio]["expiracion"])
            $tools.insertar_texto(@cod_seguridad, datos_pago[$ambiente][medio]["cvv"])
            $tools.click(@btn_continuar)
            
            #$tools.seleccionar_random_select_opcion(@cuotas_cred)
            #$tools.click(@btn_continuar)
            
            sleep 3
            @tb_rut.wait_until(&:present?)
            $tools.insertar_texto(@tb_rut, datos_pago[$ambiente][medio]["rut_tarjeta"]) 
            $tools.insertar_texto(@tb_clave, datos_pago[$ambiente][medio]["clave_tarjeta"]) 
            $tools.click(@tb_aceptar)
            sleep 1
            $tools.click(@tb_continuar)

        when "tarjeta_debito"
            @select_banco.wait_until(&:present?)
            sleep 2
            $tools.click(@select_banco)
            #$driver.send_keys :down
            #$driver.send_keys :down
            #$driver.send_keys :enter

            $tools.esperar_elemento(@test_banco)
            $tools.click(@test_banco)    
            $tools.insertar_texto(@numero_tarjeta_deb, datos_pago[$ambiente][medio]["numero"])
            $driver.send_keys :tab
            sleep 1
            $tools.click(@btn_pagar)
            sleep 2
            @tb_rut.wait_until(&:present?)
            $tools.insertar_texto(@tb_rut, datos_pago[$ambiente][medio]["rut_tarjeta_formato"]) 
            $tools.insertar_texto(@tb_clave, datos_pago[$ambiente][medio]["clave_tarjeta"]) 
            sleep 1
            $tools.click(@tb_aceptar)
            sleep 1
            $tools.click(@tb_continuar)
        end
    end

    def ingreso_datos_tarjeta_credito_con_cuotas(medio, cuotas)
        sleep 3
        datos_pago = JSON.parse(File.read("./features/data/medios_pago.json"))
        case medio
        when "tarjeta_credito", "tarjeta_credito_rechazar"
            puts "No se ingresan los datos ya que esta "
            @numero_tarjeta_cred.wait_until(&:present?)
            $tools.insertar_texto(@numero_tarjeta_cred, datos_pago[$ambiente][medio]["numero"]) 
            $tools.seleccionar_opcion(@mes_venc, datos_pago[$ambiente][medio]["mes"])
            $tools.seleccionar_opcion(@annio_venc, datos_pago[$ambiente][medio]["anio"])
            $tools.insertar_texto(@cod_seguridad, datos_pago[$ambiente][medio]["cvv"])
            $tools.click(@btn_continuar)
            $tools.seleccionar_value(@cuotas_cred, cuotas)
            $tools.click(@btn_continuar)
            @tb_rut.wait_until(&:present?)
            $tools.insertar_texto(@tb_rut, datos_pago[$ambiente][medio]["rut_tarjeta"]) 
            $tools.insertar_texto(@tb_clave, datos_pago[$ambiente][medio]["clave_tarjeta"]) 
            $tools.click(@tb_aceptar)
            sleep 1
            $tools.click(@tb_continuar)
        end
    end

end