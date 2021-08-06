class PagoPage
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/pago_selectors.json"))
        case $mobile
        when true 
            @btn_continuar = $driver.element(xpath: @selectors["mobile"]["btn_continuar"])
        else
            @btn_continuar = $driver.element(xpath: @selectors["side_bar"]["btn_continuar"])
        end
        @loading_screen = $driver.element(xpath: @selectors["loading_screen"])
        @loading_screen_2 = $driver.element(xpath: @selectors["loading_screen_2"])
        @pagos_section = $driver.element(xpath: @selectors["pagos_section"])
        @subtotal = $driver.element(xpath: @selectors["side_bar"]["subtotal"])
        @despacho = $driver.element(xpath: @selectors["side_bar"]["despacho"])
        @descuentos = $driver.element(xpath: @selectors["side_bar"]["descuentos"])
        @valor_descuento = $driver.element(xpath: @selectors["side_bar"]["valor_descuento"])
        @descuento_gold = $driver.element(xpath: @selectors["side_bar"]["descuento_gold"])
        @valor_descuento_gold = $driver.element(xpath: @selectors["side_bar"]["valor_descuento_gold"])
        @total_tarjeta_ripley = $driver.element(xpath: @selectors["side_bar"]["total_tarjeta_ripley"])
        @total_normal = $driver.element(xpath: @selectors["side_bar"]["total_normal"])
        @btn_modificar_compra = $driver.element(xpath: @selectors["side_bar"]["btn_modificar_compra"])
        @btn_agregar_mas_productos = $driver.element(xpath: @selectors["side_bar"]["btn_agregar_mas_productos"])
        # datos de tarjeta ripley
        @numero_tarjeta = $driver.element(id: @selectors["datos_pago"]["tarjeta_ripley"]["numero_tarjeta"])
        @mes = $driver.select_list(id: @selectors["datos_pago"]["tarjeta_ripley"]["mes"])
        @anio = $driver.select_list(xpath: @selectors["datos_pago"]["tarjeta_ripley"]["anio"])
        @cvv = $driver.text_field(xpath: @selectors["datos_pago"]["tarjeta_ripley"]["cvv"])
        @aceptar = $driver.button(xpath: @selectors["datos_pago"]["tarjeta_ripley"]["aceptar"])
        @diferido = $driver.select_list(xpath: @selectors["datos_pago"]["tarjeta_ripley"]["diferido"])
        @cuotas = $driver.select_list(xpath: @selectors["datos_pago"]["tarjeta_ripley"]["cuotas"])
        # datos de tarjeta credito ripley
        @numero_tarjeta_credito = $driver.text_field(id: @selectors["datos_pago"]["tarjeta_credito_ripley"]["numero_tarjeta_credito"])
        @fecha_expiracion = $driver.text_field(id: @selectors["datos_pago"]["tarjeta_credito_ripley"]["fecha_expiracion"])
        # @mes_vencimiento = $driver.select_list(id: @selectors["datos_pago"]["tarjeta_credito_ripley"]["mes_vencimiento"])
        # @annio_vencimiento = $driver.select_list(xpath: @selectors["datos_pago"]["tarjeta_credito_ripley"]["annio_vencimiento"])
        @cod_seg = $driver.text_field(name: @selectors["datos_pago"]["tarjeta_credito_ripley"]["cod_seg"])
        @recordar_tarjeta = $driver.element(xpath: @selectors["datos_pago"]["tarjeta_credito_ripley"]["recordar_tarjeta"])
        @btn_aceptar= $driver.button(xpath: @selectors["datos_pago"]["tarjeta_credito_ripley"]["btn_aceptar"])
        @cuotas_credito = $driver.select_list(xpath: @selectors["datos_pago"]["tarjeta_credito_ripley"]["cuotas_credito"])
        # datos giftcard
        @numero_gifcard = $driver.text_field(xpath: @selectors["datos_pago"]["gifcard_empresas"]["numero"])
        @clave = $driver.text_field(xpath: @selectors["datos_pago"]["gifcard_empresas"]["clave"])
        @btn_validar = $driver.button(xpath: @selectors["datos_pago"]["gifcard_empresas"]["btn_validar"])
        @btn_usar_giftcard = $driver.button(xpath: @selectors["datos_pago"]["gifcard_empresas"]["btn_usar_giftcard"])
        # registrar factura
        @fact_rut = $driver.text_field(xpath: @selectors["add_factura"]["rut"])
        @fact_nombre = $driver.element(xpath: @selectors["add_factura"]["nombre"])
        @fact_giro = $driver.element(xpath: @selectors["add_factura"]["giro"])
        @direccion = $driver.text_field(xpath: @selectors["add_factura"]["direccion"])
        # @fact_calle = $driver.text_field(xpath: @selectors["add_factura"]["calle"])
        # @fact_numero = $driver.text_field(xpath: @selectors["add_factura"]["numero"])
        @fact_departamento = $driver.text_field(xpath: @selectors["add_factura"]["departamento"])
        # @fact_region = $driver.select_list(xpath: @selectors["add_factura"]["region"])
        # @fact_comuna = $driver.select_list(xpath: @selectors["add_factura"]["comuna"])
        # @fact_codigo_telefono = $driver.select_list(xpath: @selectors["add_factura"]["codigo_telefono"])
        @fact_telefono = $driver.text_field(xpath: @selectors["add_factura"]["telefono"])
        @fact_btn_continuar = $driver.button(xpath: @selectors["add_factura"]["btn_continuar"])
        @fact_btn_cerrar= $driver.button(xpath: @selectors["add_factura"]["btn_cerrar"])
        # @fact_btn_modificar = $driver.button(xpath: @selectors["doc_tributario"]["btn_modificar_factura"])
        # @fact_btn_guardar = $driver.button(xpath: @selectors["doc_tributario"]["btn_guardar"])
        #miga de pan
        @miga_despacho = $driver.element(xpath: @selectors["miga_pan"]["despacho"])
    end

    def esperar_end_loading
        @selectors = JSON.parse(File.read("./features/selectors/pago_selectors.json"))
        @loading_screen = $driver.element(xpath: @selectors["loading_screen"])
        timeout = 0
        while(@loading_screen.present? && (timeout < 60))
            puts "end loading 1"
            sleep 2
            timeout  += 1
        end
    end

    def esperar_end_loading_2
        @selectors = JSON.parse(File.read("./features/selectors/pago_selectors.json"))
        @loading_screen_2 = $driver.element(xpath: @selectors["loading_screen_2"])
        timeout = 0
        while(@loading_screen_2.present? && (timeout < 60))
            puts "end loading 1"
            sleep 2
            timeout  += 1
        end

    end

    def verifico_pagina_pago
        count = 0
        begin
            esperar_end_loading
            esperar_end_loading
            $tools.esperar_elemento(@pagos_section)
        rescue
            if count < 3
                $driver.refresh
                count += 1
                retry
            else
                $tools.fallo("Pagina de pago no disponible")
            end
        end
    end

    def verifico_consistencia_precios
        esperar_end_loading
        despacho_prod = $producto.get_data["despacho_domicilio"]
        despacho_chek = @despacho.text
        verifico_data_sidebar(despacho_prod, despacho_chek)

        subtotal_prod = $producto.get_data["precio_internet"]
        subtotal_chek = @subtotal.text
        verifico_data_sidebar(subtotal_prod, subtotal_chek)
        
        verificar_total_compra
    end

    def verificar_total_compra
        desp = get_number(@despacho)
        subt = get_number(@subtotal)
        totalnor = get_number(@total_normal)

        puts "Despacho: #{desp}" 
        puts "Subtotal: #{subt}" 
        puts "Total: #{totalnor}" 
        
        total = subt + desp
        puts "La suma da #{total}"

        if total != totalnor
            $log.set_detalle_resultado("La suma del precio con el despacho debe ser #{total} y se muestra #{totalnor}")
            puts("La suma del precio con el despacho debe ser #{total} y se muestra #{totalnor}")
        else
            puts("El precio total #{total} es correcto")
        end
    end

    def get_number(xpath)
        subt = xpath.text
        subt.gsub(/[$.]/, '')
        return subt.to_i
    end

    def verifico_data_sidebar(valor_ref, valor_comprobar)
        if valor_ref != valor_comprobar
            puts("El valor debe ser #{valor_ref} y se muestra #{valor_comprobar}")
        else
            puts "El valor es #{valor_ref} y se muestra #{valor_comprobar}"
        end
    end

    def selecciono_medio_pago(medio)
        esperar_end_loading
        esperar_end_loading_2
        sleep 3
        $log.set_medio(medio)
        if defined?($reserva) == nil
            $reserva = Reserva.new(medio) 
        end
        if medio == "tarjeta_ripley_gold"
            medio = "tarjeta_ripley"
        end
        seleccion = $driver.element(xpath: @selectors["medios_pago"][medio])
        if medio == "tarjeta_ripley"
            if seleccion.present? == false
                $transaccion_completa_TR = true
                seleccion = $driver.element(xpath: @selectors["medios_pago"]["tarjeta_ripley_tc"])
            end
        end
        esperar_end_loading
        esperar_end_loading_2
        sleep 2
        if (!seleccion.present? && (medio == "tarjeta_credito" || medio == "tarjeta_credito_rechazar"))
                seleccion = $driver.element(xpath: @selectors["medios_pago"]["credito_no_trans_complete"]) 
                $transaccion_completa = false
        end
        $tools.click(seleccion)
        case medio
        when "tarjeta_credito","tarjeta_credito_rechazar"
            $mediopago.set_tipo("Tarjeta de crédito")
        when "tarjeta_debito"
            $mediopago.set_tipo("Webpay tarjeta de débito")
        when "tarjeta_ripley"
            $mediopago.set_tipo("Tarjeta Ripley")
        end
    end

    def click_debito_webpay

        @btn_debito = $driver.element(xpath: @selectors["wp_debito"]["btn_debito"])
        $tools.click(@btn_debito)

    end


    def ingreso_datos_medio_pago_wp(medio)

        sleep 3
        esperar_end_loading
        esperar_end_loading_2
        datos_pago = JSON.parse(File.read("./features/data/medios_pago.json"))
        $mediopago.set_tarjeta(datos_pago[$ambiente][medio]["numero"])

        @transbank = TransbankPage.new
        @transbank.ingreso_datos_medio_pago_transbank(medio)  

    end

    def ingreso_datos_medio_pago(medio)
        sleep 3
        esperar_end_loading
        esperar_end_loading_2
        datos_pago = JSON.parse(File.read("./features/data/medios_pago.json"))
        $mediopago.set_tarjeta(datos_pago[$ambiente][medio]["numero"])
        
        trx_completa = $driver.element(xpath: '//div[contains(text(),"terminada en")]')

        if trx_completa.present?
            $transaccion_completa_TR = true
            puts "TRX COMPLETA TARJETA RIPLEY ON"
        else
            $transaccion_completa_TR = false
            puts "TRX COMPLETA TARJETA RIPLEY OFF"
        end
        
        case medio
            when "tarjeta_ripley","tarjeta_ripley_gold"
                if $transaccion_completa_TR == true
                   
                    @numero_tarjeta = $driver.element(id: @selectors["datos_pago"]["tarjeta_ripley"]["numero_tarjeta_tc"])
                    @numero_tarjeta.wait_until(&:present?)
                    $tools.insertar_texto(@numero_tarjeta, datos_pago[$ambiente][medio]["numero"])
                    esperar_end_loading_2
                    sleep 1
                    
                    @mes_anio_tc = $driver.element(id: @selectors["datos_pago"]["tarjeta_ripley"]["mes_anio_tc"])
                    $tools.insertar_texto(@mes_anio_tc, datos_pago[$ambiente][medio]["mes_anio"])
                
                    sleep 1
                    @cvv = $driver.element(xpath: @selectors["datos_pago"]["tarjeta_ripley"]["cvv_tc"])
                    $tools.insertar_texto(@cvv, datos_pago[$ambiente][medio]["cvv"])
                    sleep 1
                    @aceptar = $driver.element(xpath: @selectors["datos_pago"]["tarjeta_ripley"]["aceptar_tcg"])
                    $tools.click(@aceptar)
                    sleep 1
                                    
                else
                    @numero_tarjeta.wait_until(&:present?)
                    $tools.insertar_texto(@numero_tarjeta, datos_pago[$ambiente][medio]["numero"])
                    esperar_end_loading_2
                    sleep 1
                    $tools.seleccionar_opcion(@mes, datos_pago[$ambiente][medio]["mes"])
                    sleep 1
                    $tools.seleccionar_opcion(@anio, datos_pago[$ambiente][medio]["anio"])
                    sleep 1
                    $tools.insertar_texto(@cvv, datos_pago[$ambiente][medio]["cvv"])
                    sleep 1
                    $tools.click(@aceptar)
                    $tools.seleccionar_random_select_opcion(@diferido)
                    if $mobile
                    $driver.element(xpath: '//p[starts-with(@class, "RipleyCardInstallmentsForm_description")]').click
                    $driver.send_keys :down
                    $driver.send_keys :down
                    $driver.send_keys :down
                    end
                    $tools.seleccionar_random_select_opcion(@cuotas)
                    $tools.esperar_elemento($driver.element(xpath: '//div[starts-with(@class, "RipleyCardInstallmentsForm_installmentsInfo")]'))
                end
        when "tarjeta_credito","tarjeta_credito_rechazar"
            if $transaccion_completa
                $tools.esperar_elemento @numero_tarjeta_credito 
                $tools.insertar_texto(@numero_tarjeta_credito, datos_pago[$ambiente][medio]["numero"])
                esperar_end_loading_2
                esperar_end_loading
                sleep 1
                $tools.insertar_texto(@fecha_expiracion, datos_pago[$ambiente][medio]["expiracion"])
                sleep 1
                esperar_end_loading
                esperar_end_loading_2
                $tools.insertar_texto(@cod_seg, datos_pago[$ambiente][medio]["cvv"])
                sleep 1
                esperar_end_loading
                esperar_end_loading_2
                $tools.click(@btn_aceptar) 
                esperar_end_loading
                sleep 1 
            else
                puts "Desactivado Transaccion completa, se continua flujo con Web Pay"
            end
        when "tarjeta_debito"
            @transbank = TransbankPage.new
            @transbank.ingreso_datos_medio_pago_transbank(medio)
        when "gifcard_empresas"
            @numero_gifcard.wait_until(&:present?)
            $tools.insertar_texto(@numero_gifcard, datos_pago[$ambiente][medio]["numero"])
            $tools.insertar_texto(@clave, datos_pago[$ambiente][medio]["clave_gc"])
            $tools.click(@btn_validar)
            begin
                $tools.click(@btn_usar_giftcard)
            rescue
                $tools.fallo("Giftcard con saldo insuficiente")
            end
        end
    end

    def ingreso_cvv_cuotas_tarjeta_guardada(medio, cuotas)
        sleep 5
        esperar_end_loading
        esperar_end_loading_2
        datos_pago = JSON.parse(File.read("./features/data/medios_pago.json"))
        $mediopago.set_tarjeta(datos_pago[$ambiente][medio]["numero"])
        ultimos_digitos = datos_pago[$ambiente][medio]["numero"][12..15]
        puts ultimos_digitos
        
        #tarjeta_seleccionada = $driver.element(xpath: '//div[starts-with(@class, "TransactionCompleteCardSelector_cardType")]//strong[starts-with(@class, "TransactionCompleteCardSelector_cardDigits__2DQl_") and contains(text(), "' + ultimos_digitos + '")]')
        tarjeta_seleccionada = $driver.element(xpath: '//div[starts-with(@class, "TransactionCompleteCardSelector_cardType")]//strong[starts-with(@class, "TransactionCompleteCardSelector_cardDigits__2DQl_")]')


        begin
            $tools.esperar_elemento(tarjeta_seleccionada)
            sleep 2
        rescue 
            $tools.fallo("No se muestra guardada la tarjeta de crédito #{ultimos_digitos}")
        end
        #cvv = $driver.text_field(xpath: '//div[starts-with(@class, "TransactionCompleteCardSelector_cardType")]//strong[starts-with(@class, "TransactionCompleteCardSelector_cardDigits__2DQl_") and contains(text(), "' + ultimos_digitos + '")]/parent::div/parent::div/parent::label/parent::div/following-sibling::div//input[@name="cvc"]')
        cvv = $driver.text_field(xpath: '//div[starts-with(@class, "TransactionCompleteCardSelector_cardType")]//strong[starts-with(@class, "TransactionCompleteCardSelector_cardDigits__2DQl_")]/parent::div/parent::div/parent::label/parent::div/following-sibling::div//input[@name="cvc"]')


        $tools.insertar_texto(cvv, datos_pago[$ambiente][medio]["cvv"])
        #select_cuotas = $driver.select_list(xpath: '//div[starts-with(@class, "TransactionCompleteCardSelector_cardSelected")]//strong[starts-with(@class, "TransactionCompleteCardSelector_cardDigits__2DQl_") and contains(text(), "' + ultimos_digitos + '")]/parent::div/parent::div/parent::label/parent::div/following-sibling::div//select[@id="installments"]')
        select_cuotas = $driver.select_list(xpath: '//div[starts-with(@class, "TransactionCompleteCardSelector_cardSelected")]//strong[starts-with(@class, "TransactionCompleteCardSelector_cardDigits__2DQl_")]/parent::div/parent::div/parent::label/parent::div/following-sibling::div//select[@id="installments"]')
        $tools.seleccionar_opcion(select_cuotas, cuotas)
    end

    def selecciono_random_pago_diferido
        $tools.seleccionar_random_select_opcion(@diferido)
    end

    def selecciono_pago_diferido(pago)
        if pago == "Normal"
            $tools.seleccionar_value(@diferido, "0")
        elsif pago == "Random"
            cantidad_opciones = @diferido.options.count
            puts "Cantidad del Opciones Pago Diferido es #{cantidad_opciones}" 
            lista_opciones = @diferido.options.map(&:text)         
            if cantidad_opciones >= 1
                random = rand(0..(cantidad_opciones-1))
                puts "Random: #{random}"
                puts "Seleccion: #{lista_opciones[random]}"
                $tools.seleccionar_opcion(@diferido, lista_opciones[random])
            else
                puts "Solo se muestra Pago Diferido Normal"
            end
        else
            begin
                $tools.seleccionar_value(@diferido, pago) 
            rescue
                $tools.fallo("Pago Diferido no Mapeado")
            end
        end
    end

    def selecciono_random_cuotas
        $tools.seleccionar_random_select_opcion(@cuotas)
    end

    def selecciono_cuotas(cuotas)
        esperar_end_loading
        esperar_end_loading_2
        esperar_end_loading
        esperar_end_loading_2
        sleep 4
        puts $mediopago.get_data["tipo"]
        case $mediopago.get_data["tipo"]
        when "Tarjeta Ripley"
            if cuotas != "Sin Cuotas"
                begin 
                    $tools.seleccionar_opcion(@cuotas, cuotas)
                rescue
                    $tools.fallo("Cuotas a seleccionar no ha sido mapeado")
                end
            end
        when "Tarjeta de crédito"
            if $transaccion_completa
                if cuotas != "Sin Cuotas"
                    begin
                        $tools.esperar_elemento(@cuotas_credito)
                        $tools.seleccionar_value(@cuotas_credito, cuotas)
                    rescue
                        $tools.fallo("Cuotas a seleccionar no ha sido mapeado")
                    end
                end
            else
                puts "Transaccion Completa desactivado, se continuara con Web Pay"
            end
        end

    end

    def verifico_medio_pago_seleccionado(medio)
        case medio
        when "tarjeta_ripley"
        when "tarjeta_credito"
        when "tarjeta_debito"
        when "gifcard_empresas"
        end
    end

    def verificar_cupon_de_descuento
        case $reserva.get_data["cupon_descuento"]
        when "DESPACHOGRATIS"
            begin
                $tools.esperar_elemento @descuentos
            rescue
                $tools.fallo "No se muestra el Codigo de descuento ingresado"
            end

            valor_descuento = @valor_descuento.text.delete("(").delete(")").delete("$").delete(".").to_i
            $reserva.set_valor_descuento(valor_descuento)
            despacho = @despacho.text.delete("$").delete(".").to_i
            if  despacho == valor_descuento
                puts "Correcto Valor de Descuento por el Cupon $#{valor_descuento}"
            else
                $tools.fallo "El valor del descuento no es igual al valor del despacho"
            end
        end
    end

    def seleccionar_doc_tributario(doc_tributario)
        sleep 3
        esperar_end_loading
        $mediopago.set_doc_tributario(doc_tributario)
        documento = $driver.element(xpath: '//label[contains(text(), "' + doc_tributario + '")]')
        esperar_end_loading
        esperar_end_loading_2
        sleep 2
        $tools.click(documento)
        esperar_end_loading
        @documento_trib = doc_tributario
        case doc_tributario 
        when "Boleta"
            puts "Boleta seleccionada"
        when "Factura"
            puts "Factura seleccionada"
        end
    end

    def registrar_factura
        if @documento_trib == "Factura"
            datos_factura = JSON.parse(File.read("./features/data/factura.json"))
            $tools.insertar_texto(@fact_rut, $tools.get_documento)
            $tools.insertar_texto(@fact_nombre, datos_factura["nombre"])

            # $tools.seleccionar_random_select_opcion(@fact_giro)
            $tools.click(@fact_giro)
            opcion_giro = $driver.element(xpath: '//option[@value="' + datos_factura["giro"] + '"]')
            $tools.click(opcion_giro)
            # $tools.seleccionar_opcion(@fact_giro,datos_factura["giro"])
            # $tools.insertar_texto(@fact_calle, datos_factura["calle"])
            # $tools.insertar_texto(@fact_numero, datos_factura["numero"])
            $tools.insertar_texto(@direccion, datos_factura["direccion"])
            sleep 2
            $driver.send_keys :enter
            $tools.insertar_texto(@fact_departamento, datos_factura["departamento"])
            # $tools.seleccionar_random_select_opcion(@fact_region)
            # $tools.seleccionar_random_select_opcion(@fact_comuna)
            # $tools.seleccionar_random_select_opcion(@fact_codigo_telefono)
            $tools.insertar_texto(@fact_telefono, datos_factura["telefono"])
            # este paso quema el dato
            sleep 2
            $tools.click(@fact_btn_continuar)
            # para no quemar el dato cerrar y continuar con boleta
            # $tools.click(@fact_btn_cerrar)
            # documento = $driver.element(xpath: '//label[contains(text(), "Boleta")]')
            # $tools.click(documento)
            sleep 10
        end
    end

    def modificar_factura
        $tools.click(@fact_btn_modificar)
        datos_factura = JSON.parse(File.read("./features/data/factura.json"))
        $tools.clear_and_inserta_texto(@fact_rut, $tools.get_documento)
        $tools.clear_and_inserta_texto(@fact_nombre, datos_factura["nombre"])
        $tools.seleccionar_random_select_opcion(@fact_giro)
        $tools.clear_and_inserta_texto(@direccion, datos_factura["direccion"])
        sleep 2
        $driver.send_keys :enter
        # $tools.clear_and_inserta_texto(@fact_calle, datos_factura["calle"])
        # $tools.clear_and_inserta_texto(@fact_numero, datos_factura["numero"])
        $tools.clear_and_inserta_texto(@fact_departamento, datos_factura["departamento"])
        # $tools.seleccionar_random_select_opcion(@fact_region)
        # $tools.seleccionar_random_select_opcion(@fact_comuna)
        $tools.seleccionar_random_select_opcion(@fact_codigo_telefono)
        $tools.clear_and_inserta_texto(@fact_telefono, datos_factura["telefono"])
        # este paso quema el dato
        $tools.click(@fact_btn_guardar )
        # para no quemar el dato cerrar y continuar con boleta
        # $tools.click(@fact_btn_cerrar)
        # documento = $driver.element(xpath: '//label[contains(text(), "Boleta")]')
        # $tools.click(documento)
        sleep 10
    end

    def verificar_productos_pago
        esperar_end_loading
        sleep 3
        $lista_productos.each do |i|
            puts "Producto: #{i.get_data["nombre"]}"
            cantidad_producto_pago = $driver.elements(xpath: '//div[starts-with(@class, "ShoppingItem_shoppingItem") and @data-sku="' + i.get_data["sku"].delete("P") + '"]').count
            puts "Cantidad en Pago: #{cantidad_producto_pago}"
            if cantidad_producto_pago == 1
                puts "Se muestra producto #{i.get_data["nombre"]}"
            elsif cantidad_producto_pago == 0
                $tools.fallo("No se muestra en pagina de pago el producto #{i.get_data["nombre"]}")
            else
                cantidad_producto_lista = $tools.get_cantidad_elemento(i.get_data["sku"].delete("P"))
                puts "Cantidad de productos en lista #{cantidad_producto_lista}"
                if cantidad_producto_pago == cantidad_producto_lista
                    puts "Se muestran #{cantidad_producto_lista} productos de #{i.get_data["nombre"]}"
                else
                    $tools.fallo("En lista hay #{cantidad_producto_lista} mientras que en pago hay #{cantidad_producto_pago}")
                end
            end
        end
    end

    def verifico_cantidad_pago
        esperar_end_loading
        $lista_productos.each do |i|
            puts "Producto: #{i.get_data["nombre"]}"
            cantidad_producto_pago = $driver.element(xpath: '//div[starts-with(@class, "ShoppingItem_info")]/h3/parent::div/preceding-sibling::div[starts-with(@class, "ShoppingItem_quantity")]')
            puts "Cantidad en pago es : #{cantidad_producto_pago.text}"
            if i.get_data["cantidad"].to_i == cantidad_producto_pago.text.to_i
                puts "Debe haber #{i.get_data["cantidad"]} del producto #{i.get_data["nombre"]} y se muestran #{cantidad_producto_pago.text} en pago"
            else
                $tools.fallo "Debe haber #{i.get_data["cantidad"]} del producto #{i.get_data["nombre"]} y se muestran #{cantidad_producto_pago.text} en pago"
            end
        end
    end

    def verifico_precio_unidad_caja_precio(precio)
        case precio
        when "Internet"
            precio_producto = $producto.get_data["precio_internet"]
            puts precio_producto
            precio_unidad = $driver.element(xpath: '//span[starts-with(@class, "ShoppingItem_value")][1]').text
            puts precio_unidad
        when "Ripley"
            precio_producto = $producto.get_data["precio_ripley"]
            puts precio_producto
            precio_unidad = $driver.element(xpath: '//span[starts-with(@class, "ShoppingItem_value")][2]').text
            puts precio_unidad
        end
        if precio_producto == precio_unidad
            puts "Correcto el precio unidad del producto en Pago"
        else
            $tools.fallo "El precio mostrado en Pago debe ser #{precio_producto} y se muestra #{precio_unidad}"
        end
    end

    def verifico_subtotal_caja_precio
        esperar_end_loading
        esperar_end_loading_2
        subtotal = 0
        #solo productos incluidos
        cantidad_productos = $driver.elements(xpath: '//div[starts-with(@class, "ShoppingItem_shoppingItem_")]').count
        cantidad_productos_excluidos = $driver.elements(xpath: '//div[starts-with(@class, "ExcludedItems_excludedItems")]').count
        cantidad_productos_incluidos = cantidad_productos - cantidad_productos_excluidos
        item = 1
        while item <= cantidad_productos_incluidos
            cantidad_item = $driver.element(xpath: '//div[starts-with(@class, "ShoppingItem_shoppingItem_")][' + item.to_s + ']//div[starts-with(@class, "ShoppingItem_quantity")]').text.to_i
            puts "Cantidad del item #{item} es #{cantidad_item}"
            precio_normal = $driver.element(xpath: '//div[starts-with(@class, "ShoppingItem_shoppingItem_")][' + item.to_s + ']//div[starts-with(@class, "ShoppingItem_quantity")]/following-sibling::div[starts-with(@class, "ShoppingItem_info")]/div/span[starts-with(@class, "ShoppingItem_value")][1]').text.delete('$').delete('.').to_i
            puts "Precio normal del item #{item} es #{precio_normal}"
            subtotal = subtotal + (cantidad_item * precio_normal)
            puts "Subtotal de la compra es: #{subtotal}"
            item += 1
        end
        subtotal_mostrado = @subtotal.text.delete('$').delete('.').to_i
        if subtotal == subtotal_mostrado
            puts "Correcto el subtotal de Pago"
        else
            $tools.fallo "Incorrecto el subtotal en Pago se muestra #{subtotal_mostrado} de #{subtotal} calculado"
        end
    end

    def verifico_despacho_caja_precio
        begin
            $tools.esperar_elemento @despacho
        rescue
            $tools.fallo 'No se encuentra el valor del despacho en Pagina de Pago'
        end
        puts $despacho.get_data["costo"]
        if $despacho.get_data["costo"] == @despacho.text
            puts "Costo de Despacho en pagina de Pago corresponde con el valor en pagina de Despacho #{@despacho.text}"
        else
            $tools.fallo("Costo de Despacho en pagina de Pago corresponde con el valor en pagina de Despacho #{$despacho.get_data["costo"]}/#{@despacho.text}")
        end
    end

    def verifico_total_normal_caja_precio
        subtotal_mostrado = @subtotal.text.delete('$').delete('.').to_i
        puts "Subtotal de la compra es: #{subtotal_mostrado}"
        despacho_mostrado = @despacho.text.delete('$').delete('.').to_i
        puts "Despacho de la compra es: #{despacho_mostrado}"
        total_normal_calculado = subtotal_mostrado + despacho_mostrado
        puts "Total Normal calculado de la compra es: #{total_normal_calculado}"
        total_normal_mostrado = @total_normal.text.delete('$').delete('.').to_i
        puts "Total Normal mostrado de la compra es: #{total_normal_mostrado}"
        if total_normal_calculado == total_normal_mostrado
            puts "Correcto el Total Normal de Pago"
        else
            $tools.fallo "Error en Total Normal en Pago debe ser #{total_normal_calculado} y se muestra #{total_normal_mostrado}"
        end
    end

    def verifico_total_ripley_caja_precio
        cantidad_productos = $driver.elements(xpath: '//div[starts-with(@class, "ShoppingItem_shoppingItem_")]').count
        cantidad_productos_excluidos = $driver.elements(xpath: '//div[starts-with(@class, "ExcludedItems_excludedItems")]').count
        cantidad_productos_incluidos = cantidad_productos - cantidad_productos_excluidos
        subtotal = 0
        item = 1
        while item <= cantidad_productos_incluidos
            cantidad_item = $driver.element(xpath: '//div[starts-with(@class, "ShoppingItem_shoppingItem_")][' + item.to_s + ']//div[starts-with(@class, "ShoppingItem_quantity")]').text.to_i
            puts "Cantidad del item #{item} es #{cantidad_item}"
            precio_normal = $driver.element(xpath: '//div[starts-with(@class, "ShoppingItem_shoppingItem_")][' + item.to_s + ']//div[starts-with(@class, "ShoppingItem_quantity")]/following-sibling::div[starts-with(@class, "ShoppingItem_info")]/div/span[starts-with(@class, "ShoppingItem_value")][1]').text.delete('$').delete('.').to_i
            puts "Precio normal del item #{item} es #{precio_normal}"
            precio_ripley = $driver.element(xpath: '//div[starts-with(@class, "ShoppingItem_shoppingItem_")][' + item.to_s + ']//div[starts-with(@class, "ShoppingItem_quantity")]/following-sibling::div[starts-with(@class, "ShoppingItem_info")]/div/span[starts-with(@class, "ShoppingItem_value")][2]')
            if precio_ripley.present?
                precio = precio_ripley.text.delete('$').delete('.').to_i
            else
                precio = precio_normal
            end
            subtotal = subtotal + (cantidad_item * precio)
            puts "Subtotal Ripley de la compra es: #{subtotal}"
            item += 1
        end
        despacho = @despacho.text.delete('$').delete('.').to_i
        total_tarjeta_ripley = despacho + subtotal
        if @total_tarjeta_ripley.present?
            total_tarjeta_ripley_mostrado = @total_tarjeta_ripley.text.delete('$').delete('.').to_i
        else
            $tools.fallo 'No se muestra Total Tarjeta Ripley en Pago'
        end

        if total_tarjeta_ripley == total_tarjeta_ripley_mostrado
            puts "Correcto el Total Tarjeta Ripley de Pago #{total_tarjeta_ripley_mostrado}"
        else
            $tools.fallo "Error en Total tarjeta Ripley en Pago debe ser #{total_tarjeta_ripley} y se muestra #{total_tarjeta_ripley_mostrado}"
        end
    end

    def click_modificar_compra
        esperar_end_loading
        esperar_end_loading_2
        sleep 5
        $tools.click @btn_modificar_compra
    end

    def verificar_tarjeta_terminada_xxxx(medio)
        datos_pago = JSON.parse(File.read("./features/data/medios_pago.json"))
        num_tarjeta = datos_pago[$ambiente][medio]["numero"]
        last_char = num_tarjeta.split(//).last(4).join("").to_s
        puts last_char
        case medio
        when "tarjeta_ripley"
            label_tarjeta = $driver.element(xpath: '//div[starts-with(@class, "RipleyPaymentMethod_paymentMethodLabel")]//strong[contains(text(), "' + last_char + '")]')
        when "tarjeta_credito","tarjeta_credito_rechazar"
            label_tarjeta = $driver.element(xpath: '//span[starts-with(@class, "TransactionCompleteCardSelector_cardDigits") and contains(text(), "' + last_char + '")]')
            puts label_tarjeta.text 
        end
        begin
            $tools.esperar_elemento(label_tarjeta)
            puts "Se muestra mensaje correcto \"#{last_char}\""
        rescue
            $tools.fallo("No semuestra mensaje correcto \"#{last_char}\"")
        end
    end

    def verificar_documento_seleccionado(documento)
        fail "FALTA IMPLEMENTAR"
    end

    def click_agregar_mas_productos
        esperar_end_loading
        esperar_end_loading_2
        sleep 5
        $tools.click @btn_agregar_mas_productos
    end

    def click_miga_despacho
        esperar_end_loading
        esperar_end_loading_2
        sleep 2
        $tools.click @miga_despacho
    end

    def click_continuar
        esperar_end_loading
        esperar_end_loading_2
        sleep 5
        $mediopago.set_correo($driver.element(xpath: '//div[starts-with(@class, "TaxInstrumentTypeSelector_taxInstrumentSelector")]//strong').text)
        html_pre = $driver.html
        $tools.salvar_pantalla("pago", "features/screenshots/pago/")
        esperar_end_loading
        esperar_end_loading_2
        $tools.click(@btn_continuar)
        esperar_end_loading
        esperar_end_loading_2
        html_post = $driver.html
        while html_pre == html_post
            puts "No se hizo click en Continuar, se reintentara pago"
            case $mobile
            when true 
                @btn_continuar = $driver.element(xpath: @selectors["mobile"]["btn_continuar"])
            else
                @btn_continuar = $driver.element(xpath: @selectors["side_bar"]["btn_continuar"])
            end
            $tools.click(@bt_continuar)
            esperar_end_loading
            esperar_end_loading_2
            html_post = $driver.html
        end
    end
end