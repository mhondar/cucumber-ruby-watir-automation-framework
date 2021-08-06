class ConfirmacionPage
    def initialize
        selectors = JSON.parse(File.read("./features/selectors/confirmacion_selectors.json"))
        case $mobile
        when true
            @bt_continuar = $driver.element(xpath: selectors["mobile"]["bt_continuar"])
        else
            @bt_continuar = $driver.element(xpath: selectors["bt_continuar"])
        end
        @title_conf = $driver.element(xpath: selectors["title_conf"])
        @chk_acepto = $driver.element(xpath: selectors["chk_acepto"])
        @selectors_2 = JSON.parse(File.read("./features/selectors/pago_selectors.json"))
        @loading_screen = $driver.element(xpath: @selectors_2["loading_screen"])
        @btn_modificar_despacho = $driver.button(xpath: selectors["btn_modificar_despacho"])
        @btn_modificar_pago = $driver.button(xpath: selectors["btn_modificar_pago"])
        @btn_add_products = $driver.element(xpath: selectors["btn_add_products"])
        @subtotal = $driver.element(xpath: selectors["subtotal"])
        @despacho = $driver.element(xpath: selectors["despacho"])
        @tarjeta_de_debito = $driver.element(xpath: selectors["tarjeta_de_debito"])
        @total_tarjeta_ripley = $driver.element(xpath: selectors["total_tarjeta_ripley"])
        @total_normal = $driver.element(xpath: selectors["total_normal"]) 
    end

    def verificar_pagina_confirmacion_presente
        begin
            $tools.esperar_elemento(@title_conf)
            puts "Pagina de Confirmacion visible"
        rescue
            $tools.fallo("Problemas al cargar pagina de confirmacion")
        end
    end

    def esperar_end_loading
        timeout = 0
        while(@loading_screen.present? && (timeout < 60))
            timeout += 1
            sleep 3
        end
    end

    def aceptar_condiciones
        $tools.click(@chk_acepto)
    end

    def click_continuar
        guardar_monto_total
        puts "Tipo de despacho: #{$despacho.get_data["tipo"]}"
        if $despacho.get_data["tipo"] == "A domicilio"
            $despacho.set_numero($driver.element(xpath: '//div[starts-with(@class, "HomeDeliveryInformation_displayInformationRowContainer")]/h5/strong').text)
        end
        html_pre = $driver.html
        $tools.salvar_pantalla("Confirmacion", "features/screenshots/confirmacion/")
        $tools.click(@bt_continuar)
        esperar_end_loading
        html_post = $driver.html
        while html_pre == html_post
            puts "No se hizo click en Continuar, se reintentara confirmacion"
            $tools.click(@bt_continuar)
            esperar_end_loading
            html_post = $driver.html
        end
        if !$transaccion_completa
            @transbank = TransbankPage.new
            @transbank.ingreso_datos_medio_pago_transbank("tarjeta_credito")
        end
    end

    def guardar_monto_total
        case $reserva.get_data["medio_pago"]
        when "tarjeta_ripley"
            if @total_tarjeta_ripley.present?
                $reserva.set_monto_total @total_tarjeta_ripley.text
            else
                $reserva.set_monto_total @total_normal.text
            end
        else
            $reserva.set_monto_total @total_normal.text
        end
    end

    def click_modificar_despacho
        $tools.click @btn_modificar_despacho
        esperar_end_loading
    end

    def click_modificar_pago
        $tools.click @btn_modificar_pago
        esperar_end_loading
    end

    def verificar_direccion_despacho
        fail "FALTA IMPLEMENTAR"
    end

    def verificar_fecha_despacho
        fecha_mostrada = $driver.element(xpath: '//div[starts-with(@class, "HomeDeliveryInformation_displayInformationRowContainer")]/h5[contains(text(), "Fecha estimada")]/following-sibling::p').text.split
        dia_mostrado = fecha_mostrada[1]
        puts "Dia mostrado: #{dia_mostrado}"
        mes_mostrado = fecha_mostrada[3]
        puts "Mes mostrado: #{mes_mostrado}"
        if(($despacho.get_data["dia"] == dia_mostrado) && ($despacho.get_data["mes"].downcase == mes_mostrado))
            puts "Fecha Mostrada Correcta #{dia_mostrado} de #{mes_mostrado}"
        else
            $tools.fallo("Fecha Mostrada Incorrecto #{dia_mostrado} de #{mes_mostrado}, debe ser #{$despacho.get_data["dia"]} de #{$despacho.get_data["mes"]}")
        end
    end

    def verificar_horario_despacho
        horario_mostrada = $driver.element(xpath: '//div[starts-with(@class, "HomeDeliveryInformation_displayInformationRowContainer")]/h5[contains(text(), "Tipo de despacho")]/following-sibling::p').text.split
        horario_despacho = $despacho.get_data["horario"].split
        if((horario_mostrada[0] == horario_despacho[1]) && (horario_mostrada[2] == horario_despacho[3]))
            puts "Horario Mostrado Correcto #{horario_mostrada}"
        else
            $tools.fallo "Horario Mostrado Incorrecto #{horario_mostrada}, debe ser #{$despacho.get_data["horario"]}"
        end 
    end

    def verificar_nombre_producto_despacho
        nombre_mostrado = $driver.element(xpath: '//div[starts-with(@class, "HomeDeliveryInformation_productRowContainer")]/img/following-sibling::h5').text
        if $producto.get_data["nombre"] == nombre_mostrado
            puts "Nombre del Producto Correcto #{nombre_mostrado}"
        else
            $tools.fallo "Nombre del Producto Incorrecto en Pagina de Confirmacion #{nombre_mostrado}, debe ser #{$producto.get_data["nombre"]}"
        end
    end

    def verifico_documento_tributario
        documento_mostrado = $driver.element(xpath: '//h5[contains(text(), "Documento tributario")]/following-sibling::p').text
        if documento_mostrado == $mediopago.get_data["doc_tributario"]
            puts "Documento Tributario en Pagina de Confirmacion Correcto #{documento_mostrado}"
        else 
            $tools.fallo("Documento Tributario en Pagina de Confirmacion incorrecto #{documento_mostrado}, debe ser #{$mediopago.get_data["doc_tributario"]}")
        end
    end

    def verifico_correo_tributario
        correo_mostrado = $driver.element(xpath: '//h5[contains(text(), "Email de destino del documento")]/following-sibling::p').text
        if correo_mostrado == $mediopago.get_data["correo"]
            puts "Email de destino del documento correcto #{correo_mostrado}"
        else
            $tools.fallo "Email de destino del documento incorrecto #{correo_mostrado}, debe ser #{$mediopago.get_data["correo"]}"
        end
    end

    def verifico_tipo_medio_pago
        case $mediopago.get_data["tipo"]
        when "Tarjeta de crédito"
            tipo_mostrado = $driver.element(xpath: '//div[starts-with(@class, "PaymentInformation_cardType")]/span[1]').text
        when "Webpay tarjeta de débito"
            tipo_mostrado = $driver.element(xpath: '//h5[contains(text(), "Webpay tarjeta de débito")]').text
        when "Tarjeta Ripley"
            tipo_mostrado = $driver.element(xpath: '//h5[contains(text(), "Tarjeta Ripley")]').text
        end
        if tipo_mostrado == $mediopago.get_data["tipo"]
            puts "Tipo de Medio de Pago mostrado correcto #{tipo_mostrado}"
        else
            $tools.fallo "Tipo de Medio de Pago mostrado incorrecto #{tipo_mostrado}, debe ser #{$mediopago.get_data["tipo"]}"
        end
    end

    def verificar_productos_confirmacion
        esperar_end_loading
        sleep 3
        $lista_productos.each do |i|
            puts "Producto: #{i.get_data["nombre"]}"
            puts "SKU: #{i.get_data["sku"]}"
            cantidad_producto = $driver.elements(xpath: '//div[starts-with(@class, "ShoppingItem_shoppingItem") and @data-sku="' + i.get_data["sku"].delete("P") + '"]').count
            puts "Cantidad en Confirmacion: #{cantidad_producto}"
            if cantidad_producto == 1
                puts "Se muestra producto #{i.get_data["nombre"]}"
            elsif cantidad_producto == 0
                $tools.fallo("No se muestra en pagina de confirmacion el producto #{i.get_data["nombre"]}")
            else
                cantidad_producto_lista = $tools.get_cantidad_elemento(i.get_data["sku"])
                if cantidad_producto == cantidad_producto_lista
                    puts "Se muestran #{cantidad_producto_lista} productos de #{i.get_data["nombre"]}"
                else
                    $tools.fallo("En lista hay #{cantidad_producto_lista} mientras que en confirmacion hay #{cantidad_producto_despacho}")
                end
            end
        end
    end

    def verifico_cantidad_confirmacion
        esperar_end_loading
        $lista_productos.each do |i|
            puts "Producto: #{i.get_data["nombre"]}"
            puts "Producto: #{i.get_data["sku"]}"
            cantidad_producto = $driver.element(xpath: '//div[starts-with(@class, "ShoppingItem_info")]/h3/parent::div/preceding-sibling::div[starts-with(@class, "ShoppingItem_quantity")]')
            puts "Cantidad en confirmacion es : #{cantidad_producto.text}"
            if i.get_data["cantidad"].to_i == cantidad_producto.text.to_i
                puts "Debe haber #{i.get_data["cantidad"]} del producto #{i.get_data["nombre"]} y se muestran #{cantidad_producto.text} en confirmacion"
            else
                $tools.fallo "Debe haber #{i.get_data["cantidad"]} del producto #{i.get_data["nombre"]} y se muestran #{cantidad_producto.text} en confirmacion"
            end
        end
    end

    def verifico_precio_unidad_caja_precio(precio)
        esperar_end_loading
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
            puts "Correcto el precio unidad del producto en Confirmacion"
        else
            $tools.fallo "El precio mostrado en Confirmacion debe ser #{precio_producto} y se muestra #{precio_unidad}"
        end
    end

    def verifico_subtotal_caja_precio
        esperar_end_loading
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
        esperar_end_loading
        begin
            $tools.esperar_elemento @despacho  
        rescue
            $tools.fallo 'No se encuentra el valor del despacho en pagina de Confirmacion'
        end
        puts $despacho.get_data["costo"]
        if $despacho.get_data["costo"] == @despacho.text
            puts "Costo de Despacho en pagina de Confirmacion corresponde con el valor en pagina de Despacho #{@despacho.text}"
        else
            $tools.fallo("Costo de Despacho en pagina de Confirmacion corresponde con el valor en pagina de Despacho #{$despacho.get_data["costo"]}/#{@despacho.text}")
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
            puts "Correcto el Total Normal de Confirmacion"
        else
            $tools.fallo "Error en Total Normal en Confirmacion debe ser #{total_normal_calculado} y se muestra #{total_normal_mostrado}"
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
            $tools.fallo 'No se muestra Total Tarjeta Ripley en Confirmacion'
        end

        if total_tarjeta_ripley == total_tarjeta_ripley_mostrado
            puts "Correcto el Total Tarjeta Ripley en Confirmacion #{total_tarjeta_ripley_mostrado}"
        else
            $tools.fallo "Error en Total tarjeta Ripley en Confirmacion debe ser #{total_tarjeta_ripley} y se muestra #{total_tarjeta_ripley_mostrado}"
        end
    end

    def click_agregar_mas_productos
        esperar_end_loading
        sleep 2
        $tools.click @btn_add_products
    end

    def click_tarjeta_de_debito
        sleep 5
        $tools.click @tarjeta_de_debito
    end

    def verificar_alerta_debe_aceptar(mensaje)
        mensaje_alerta = $driver.element(xpath: '//div[starts-with(@class, "MessageArea_messageArea") and contains(text(), "' + mensaje + '")]')
        begin
            $tools.esperar_elemento mensaje_alerta
        rescue
            $tools.fallo "No se muestra el mensaje de alerta #{mensaje}"
        end
    end

end