class BolsaCompraPage

    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/bolsa_selectors.json"))
        selectors_ficha = JSON.parse(File.read("./features/selectors/ficha_selectors.json"))
        @bt_garext_continuar = $driver.element(xpath: selectors_ficha["extra_garantia_popup"]["bt_garext_continuar"])

        case $mobile 
        when true
            @btn_continuar = $driver.element(xpath: @selectors["mobile"]["btn_continuar"])
        else
            @btn_continuar = $driver.element(xpath: @selectors["btn_continuar"])
        end

        @titulo_prebolsa = $driver.element(xpath: @selectors["titulo_prebolsa"])
        @titulo_bolsa = $driver.element(xpath: @selectors["titulo_bolsa"])
        @loading_screen = $driver.element(xpath: @selectors["loading_screen"])
        @btn_add = $driver.button(xpath: @selectors["shopping_bag_item"]["stepper"]["btn_add"])
        @lbl_cant = $driver.element(xpath: @selectors["shopping_bag_item"]["stepper"]["lbl_cant"])
        @btn_dec = $driver.button(xpath: @selectors["shopping_bag_item"]["stepper"]["btn_dec"])
        @prod_name = $driver.element(xpath: @selectors["shopping_bag_item"]["card_product"]["prod_name"])
        @sku = $driver.element(xpath: @selectors["shopping_bag_item"]["card_product"]["sku"])
        @precio_unit = $driver.element(xpath: @selectors["shopping_bag_item"]["card_product"]["precio_unit"])
        @list_precio_unit = $driver.elements(xpath: @selectors["shopping_bag_item"]["card_product"]["precio_unit"])
        @precio_ripley = $driver.element(xpath: @selectors["shopping_bag_item"]["card_product"]["precio_ripley"])
        @precio_internet = $driver.element(xpath: @selectors["shopping_bag_item"]["card_product"]["precio_internet"])
        @list_precio_ripley = $driver.elements(xpath: @selectors["shopping_bag_item"]["card_product"]["precio_ripley"])
        @del_product = $driver.element(xpath: @selectors["shopping_bag_item"]["card_product"]["del_product"])
        @input_code = $driver.text_field(xpath: @selectors["shopping_bag_item"]["extras"]["input_code"])
        @descuento_aplicado = $driver.element(xpath: @selectors["shopping_bag_item"]["extras"]["descuento_aplicado"]) 
        @quitar_cupon = $driver.element(xpath: @selectors["shopping_bag_item"]["extras"]["quitar_cupon"]) 
        @quitar_cupon_list = $driver.elements(xpath: @selectors["shopping_bag_item"]["extras"]["quitar_cupon"]) 
        @btn_aplicar = $driver.button(xpath: @selectors["shopping_bag_item"]["extras"]["btn_aplicar"])
        @subtotal = $driver.element(xpath: @selectors["shopping_bag_item"]["resumen"]["subtotal"])
        @total_normal = $driver.element(xpath: @selectors["shopping_bag_item"]["resumen"]["total_normal"])
        @total_ripley = $driver.element(xpath: @selectors["shopping_bag_item"]["resumen"]["total_ripley"])
        
        @btn_guardar = $driver.element(xpath: @selectors["btn_guardar"])
        @list_product_items = $driver.elements(xpath: @selectors["list_product_items"])
        @empty_bag = $driver.element(xpath: @selectors["empty_bag"])
        @ripley_icon = $driver.element(xpath: @selectors["ripley_icon"])
        @msg_no_disponible = $driver.element(xpath: @selectors["msg_no_disponible"])
        @btn_ir_a_la_bolsa = $driver.element(xpath: @selectors["btn_ir_a_la_bolsa"])

        @btn_rclubes = $driver.element(xpath: @selectors["shopping_bag_item"]["extras"]["btn_rclubes"])
        @input_code_rclubes = $driver.element(xpath: @selectors["shopping_bag_item"]["extras"]["input_code_rclubes"])
        @button_acumular = $driver.element(xpath: @selectors["shopping_bag_item"]["extras"]["button_acumular"])
        @codigo_rclubes_aplicado = $driver.element(xpath: @selectors["shopping_bag_item"]["extras"]["codigo_rclubes_aplicado"])
        @popup_sorpresas = $driver.element(xpath: @selectors["popup"]["contenedor"])
        @btn_popup_no_gracias = $driver.element(xpath: @selectors["popup"]["btn_cerrar"])
        @contenedor_recomendacion = $driver.element(xpath: @selectors["shopping_bag_item"]["recomendaciones"]["contenedor_recomendacion"])
        @cantidad_recomendaciones = $driver.elements(xpath: @selectors["shopping_bag_item"]["recomendaciones"]["cantidad_recomendaciones"])
        @nombre_recomendacion = $driver.element(xpath: @selectors["shopping_bag_item"]["recomendaciones"]["nombre_recomendacion"])
        @btn_agregar_bolsa_recomendacion = $driver.element(xpath: @selectors["shopping_bag_item"]["recomendaciones"]["btn_agregar_bolsa_recomendacion"])
   
    end

    def click_garext_continuar
        sleep 2
        popup_sorpresas
        if @bt_garext_continuar.present?
            $tools.click(@bt_garext_continuar)
        end
    end

    def popup_sorpresas
        begin
            $tools.esperar_elemento_timeout(@popup_sorpresas,5)
            puts "Se encuentra Popup."
            $tools.click(@btn_popup_no_gracias)
            puts "Se hace Click en Botón No Gracias del Popup."
        rescue 
            puts "No se encuentra Popup."     
        end          
    end

    def agregar_bolsa_recomendaciones
        $tools.esperar_elemento(@contenedor_recomendacion)
        cantidad_Recomendaciones = @cantidad_recomendaciones.count        

        if cantidad_Recomendaciones == 0
            $tools.fallo("No se muestran recomendaciones")  
        end

        item = rand(1..3)
        item_selected = $driver.element(xpath: '//div[@class="owl-carousel owl-theme"]//div[@class="owl-item"][' + item.to_s + ']//button[text()="Agregar a la bolsa"]')
        
        if $mobile
            $driver.execute_script("return arguments[0].click();", item_selected)

        else
            $tools.click(item_selected)
        puts 

        end    
        @nombre_recomendacion = @nombre_recomendacion.text
        
        btn_agregar_bolsa_recomendacion = @btn_agregar_bolsa_recomendacion

        if $mobile
            $driver.execute_script("return arguments[0].click();", btn_agregar_bolsa_recomendacion)
        else
            $tools.click(btn_agregar_bolsa_recomendacion) 
        end
        sleep 1
        click_garext_continuar
        esperar_end_loading    
    end

    def validar_producto_recomendacion
        if $mobile
            $tools.scroll_to(:top)
        end

        nombre_cant =$driver.element(xpath: '//div[@class="cart-product-info-name" and text()=\''.concat(@nombre_recomendacion).concat('\']'))

        if nombre_cant.present?
            puts "Se agrega producto a la bolsa correctamente"
        else
            puts "No se muestra precio Normal"
        end         
    end


    def validar_sub_Total
        esperar_end_loading
        if @subtotal.present?
            puts "Validando que se muestre subTotal"
        else
            puts "No se muestra subTotal"
        end
    end

    def validar_precio_total_normal
        esperar_end_loading
        if @total_normal.present?
            puts "Validando que se muestre el precio normal"
        else
            puts "No se muestra precio Normal"
        end
    end
    
    def validar_precio_ripley
        esperar_end_loading
        if @total_ripley.present?
            puts "Validando que se muestre precio Ripley"
        else
            puts "No se muestra precio Ripley"
        end
    end

    def validar_prebolsa_cargada_ok
        begin
            $tools.esperar_elemento(@titulo_prebolsa)
            puts "PreBolsa de Productos cargada correctamente."
        rescue 
            $tools.fallo("No se cargo la PreBolsa correctamente")
        end
    end

    def validar_bolsa_cargada_ok
        begin
            $tools.esperar_elemento(@titulo_bolsa)
            puts "Bolsa de Productos cargada correctamente."
        rescue 
            $tools.fallo("No se cargo la Bolsa correctamente")
        end
    end

    def esperar_end_loading
        timeout = 0
        while(@loading_screen.present? && (timeout < 60))
            sleep 2
            timeout += 1
        end
    end

    def cantidad_elementos_bolsa
        cant = @list_product_items.count
        puts "Hay #{cant} productos en la bolsa"
        return cant
    end

    def validar_lista_productos
        cant = $lista_productos.length
        i = 0
        while i < cant
            puts $lista_productos[i].get_data["nombre"]
            producto_esperado = $driver.element(xpath: '//div[@class="shopping-bag-item-row new-shopping-bag"]//div[contains(@title, "' +  $lista_productos[i].get_data["nombre"] + '")]')
            $tools.esperar_elemento(producto_esperado)
            extragarantia =  $lista_productos[i].get_data["nombre_extragarantia"]
            if extragarantia != "" && extragarantia != nil
                producto_esperado = $driver.element(xpath: '//div[@class="shopping-bag-item-row new-shopping-bag"]//div[@title="' + 'EG ' + extragarantia + '"]')
                $tools.esperar_elemento(producto_esperado)
            end
            i += 1
        end
    end

    def ingresar_cantidad_productos(cant)
        sleep 3
        popup_sorpresas
        $log.set_cant(cant)
        puts "***********************"
        label_cantidad = @lbl_cant.text.to_i
        puts "Cantidad del producto: " + label_cantidad.to_s + "."
        puts "Cantidad a ingresar: #{cant}."
        
        if(cant.to_i <= 0 || cant.to_i >= 10)
            puts "Debe ingresar cantidades entre 1 y 9, se dejara por defecto #{label_cantidad}"
        elsif(label_cantidad == 1 && label_cantidad == cant.to_i)
            puts "No es necesario ingresar cantidad del producto, por defecto es 1"
        else
            while(cant != label_cantidad)
                puts "Entro al ciclo, hay #{label_cantidad}, debe ser #{cant}."
                if cant.to_i < label_cantidad  
                    puts "Elimino 1"
                    $tools.click(@btn_dec)
                elsif cant.to_i > label_cantidad
                    puts "Agrego 1"
                    $tools.click(@btn_add)
                else
                    puts "Ya son iguales"
                    break
                end

                sleep 2

                esperar_end_loading

                label_cantidad = @lbl_cant.text.to_i
                puts "Cantidad del producto actualizada a: " + label_cantidad.to_s       
            end
        end
        $producto.set_cantidad(cant)
        puts $producto.get_data["nombre"]
        i = $lista_productos.index{ |item| item.get_data["nombre"] == $producto.get_data["nombre"] }
        puts i
        $lista_productos[i].set_cantidad(cant)
        puts  $lista_productos[i].get_data["cantidad"]
    end

    def validar_cantidad_productos(cant)
        label_cantidad = @lbl_cant.text.to_i
        puts "Cantidad del producto: " + label_cantidad.to_s
        if label_cantidad == cant.to_i
            puts "Es correcta la cantidad del producto agregado"
        else
            $tools.fallo "No es correcta la cantidad del producto debe ser #{cant} y es #{label_cantidad}"
        end
    end

    def validar_datos_detalle_vs_bolsa
        validar_dato_detalle_vs_bolsa_internet("sku", @sku)
        validar_dato_detalle_vs_bolsa_internet("nombre", @prod_name)
        validar_dato_detalle_vs_bolsa_internet("precio_internet", @precio_unit)
        # validar_dato_detalle_vs_bolsa_internet("precio_ripley", @precio_ripley)
    end

    def validar_dato_detalle_vs_bolsa_internet(dato_detalle, dato_bolsa)
        if dato_bolsa.present?
            puts "Validando #{dato_detalle}"
            detalle = $producto.get_data[dato_detalle].delete("P")
            case dato_detalle
                when "sku" then bolsa = dato_bolsa.text.delete("SKU: ")
                when "nombre" then bolsa = dato_bolsa.text.slice(0..(dato_bolsa.text.index('4'))).delete("\nSKU")
                else bolsa = dato_bolsa.text
            end
            puts "Detalle: -" + detalle + "- == Bolsa: -" +  bolsa + "-"
            if detalle == bolsa
                puts "#{dato_detalle} OK"
            else
                $tools.fallo("#{dato_detalle} no coinciden")
            end
        else
            puts "No posee dato"
        end
    end

    def elimino_todos_cupones_de_descuento
        cantidad_cupones = @quitar_cupon_list.count
        while(cantidad_cupones > 0)
            puts "Hay #{cantidad_cupones} cupones aplicados"
            $tools.click @quitar_cupon
            esperar_end_loading
            sleep 2
            puts "Quitado un cupon quedan #{cantidad_cupones - 1}"
            cantidad_cupones -= 1
        end
        if @quitar_cupon.present? == true
            $tools.fallo("No se eliminaron todos los cupones")
        else
            puts "Se eliminaron todos los cupones"
        end
    end

    def ingreso_cupon_descuento(cupon)
        $tools.insertar_texto(@input_code, cupon) 
        if defined?($reserva) == nil 
            $reserva = Reserva.new($mediopago.get_data["medio"]) 
        end
        $reserva.set_cupon_descuento(cupon)
        $driver.send_keys :enter
        esperar_end_loading
        sleep 1
    end

    def verifico_cupon_descuento_aplicado
        if $reserva.get_data["cupon_descuento"] == ""
            puts "No se ha aplicado cupon de descuento"
        elsif @descuento_aplicado.text == $reserva.get_data["cupon_descuento"]
            puts "Cupon de Descuento #{$reserva.get_data["cupon_descuento"]} aplicado correctamente"
        else
            $tools.fallo("Cupon de Descuento #{$reserva.get_data["cupon_descuento"]} no aplicado correctamente")
        end
    end

    def ingreso_codigo_rclubes(codigo)
        esperar_end_loading
        $tools.click(@btn_rclubes)
        $tools.esperar_elemento(@input_code_rclubes)
        codigos = JSON.parse(File.read("./features/data/codigos.json"))
        $tools.insertar_texto(@input_code_rclubes, codigos["RClubes"][codigo]) 
        $tools.click(@button_acumular)
        esperar_end_loading
        begin
            $tools.esperar_elemento(@codigo_rclubes_aplicado)
            puts "Codigo RClubes: #{@codigo_rclubes_aplicado.text}"
            if defined?($reserva) == nil 
                if defined?($mediopago) == nil
                    $reserva = Reserva.new("") 
                else
                    $reserva = Reserva.new($mediopago.get_data["medio"]) 
                end
            end
            $reserva.set_codigo_rclubes(@codigo_rclubes_aplicado.text)
        rescue
            $tools.fallo("Codigo RClubes no aplicado correctamente")
        end
    end

    def elimino_producto_bolsa(num_producto)
        sleep 2
        @list_product_items = $driver.elements(xpath: @selectors["list_product_items"])
        cantidad_productos = @list_product_items.count
        puts cantidad_productos
        if cantidad_productos >= num_producto.to_i
            sku_product_eliminar = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][1]//div[@class="cart-product-info-sku"]').text.delete("SKU: ")
            puts "Se eliminará el producro #{sku_product_eliminar}"
            del_dinamic_button = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][' + num_producto.to_s + ']//div[@class="shopping-bag-item-actions"]//button[@title="Quitar producto"]')
            puts "Numero de producto #{num_producto}"
            $tools.click(del_dinamic_button)
            esperar_end_loading
            if cantidad_productos == 1
                @empty_bag = $driver.element(xpath: @selectors["empty_bag"])
                $tools.esperar_elemento(@empty_bag)
                esperar_end_loading
            end
            
            i = $lista_productos.index{ |item| item.get_data["sku"] == sku_product_eliminar }
            puts "Item #{i}"
            $lista_productos.delete_at(i)
        elsif cantidad_productos < num_producto.to_i
            puts "No se puede eliminar ya que el numero indicado es mayor a la cantidad de productos"
        end
    end

    def elimino_todos_productos_bolsa
        esperar_end_loading
        sleep 2 
        popup_sorpresas
        sleep 2 
        cantidad_productos = @list_product_items.count
        puts "Cantidad de productos inicial: #{cantidad_productos}"
        del_dinamic_button = $driver.element(xpath: '//div[@class="shopping-bag-item-actions"]//button[@title="Quitar producto"]')
        
        cantidad_productos.times {
            $tools.click(del_dinamic_button)
            puts "elimine uno"
            esperar_end_loading
        }
    end

    def verificar_empty_bag
        $tools.esperar_elemento(@empty_bag)
        puts "Bolsa vacia"  
        $lista_productos.clear 
    end

    def click_ripley_icon
        $tools.click(@ripley_icon)
    end

    def click_continuar_compra
        esperar_end_loading
        html_pre = $driver.html
        $tools.salvar_pantalla("Bolsa", "features/screenshots/bolsa/")
        sleep 2 
        popup_sorpresas
        sleep 2 
        $tools.click(@btn_continuar)
        esperar_end_loading
        html_post = $driver.html
        while html_pre == html_post
            puts "No se hizo click en Continuar, se reintentara"
            case $mobile 
            when true
                @btn_continuar = $driver.element(xpath: @selectors["mobile"]["btn_continuar"])
            else
                @btn_continuar = $driver.element(xpath: @selectors["btn_continuar"])
            end
            $tools.click(@bnt_continuar)
            esperar_end_loading
            html_post = $driver.html
        end
    end

    def popup_sorpresas

        begin
            $tools.esperar_elemento_timeout(@popup_sorpresas,5)
            puts "Se encuentra Popup."
            $tools.click(@btn_popup_no_gracias)
            sleep 2
        rescue
            puts "No se encuentra Popup."
        end

       # if $tools.esperar_elemento(@popup_sorpresas)
        #    puts "Se encuentra Popup."
         #   $tools.click(@btn_popup_no_gracias)
         #   puts "Se hace Click en Botón No Gracias del Popup."
        #else
         #   puts "No se encuentra Popup."
       # end
   
    end

    def elimino_producto_decrementando_cantidad(num_producto)
        cantidad_items_productos = @list_product_items.count
        puts "Cantidad de items de productos #{cantidad_items_productos}"
        
        if num_producto > cantidad_items_productos
            puts "El item de producto solicitado es mayor a la cantidad de items de la bolsa"
        else
            del_product = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][' + num_producto.to_s + ']//button[@class="stepper-control stepper-control-decrease"]')
            cant_producto = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][' + num_producto.to_s + ']//div[@class="stepper-value"]').text.to_i
            puts "Cantidad de productos del item #{num_producto} es #{cant_producto}"
            while !@empty_bag.present?
                $tools.click(del_product)
                esperar_end_loading
            end
        end
    end

    def validar_producto_bolsa
        validar_dato_detalle_vs_bolsa_internet("sku", @sku)
    end

    def validar_precio_producto_bolsa
        validar_dato_detalle_vs_bolsa_internet("precio_internet", @precio_unit)
    end

    def validar_caja_precio_subtotal
        $tools.esperar_elemento @precio_internet
        subtotal_caja_precio = @subtotal.text.delete('$').delete('.').to_i
        subtotal_esperado = calcular_subtotal_normal
        if subtotal_caja_precio == subtotal_esperado
            puts "El subtotal es correcto $#{subtotal_esperado}"
        else
            $tools.fallo("El subtotal no coincide con la suma de los precios de los items #{subtotal_esperado}/#{subtotal_caja_precio}")
        end
    end

    def validar_precio_Internet
        $tools.esperar_elemento @total_normal
        esperar_end_loading
        total_normal = @total_normal.text
        if $producto.get_data["precio_internet"] == total_normal
            puts "El Precio Normal es correcto #{total_normal}"
        else
            $tools.fallo("El precio Total normal no coincide con precio Internet")
        end
        
    end


    def validar_caja_precio_total_sin_descuentos
        $tools.esperar_elemento @precio_internet
        total_normal_caja_precio = @total_normal.text.delete('$').delete('.').to_i
        total_normal_esperado = calcular_subtotal_normal
        if total_normal_caja_precio == total_normal_esperado
            puts "El Total Normal es correcto $#{total_normal_esperado}"
        else
            $tools.fallo("El subtotal no coincide con la suma de los precios de los items #{total_normal_esperado}/#{total_normal_caja_precio}")
        end
    end

    def validar_caja_precio_ripley_sin_descuentos
        $tools.esperar_elemento @precio_internet
        total_ripley_caja_precio = @total_ripley.text.delete('$').delete('.').to_i
        total_ripley_esperado = calcular_total_ripley
        if total_ripley_caja_precio == total_ripley_esperado
            puts "El Total Ripley es correcto $#{total_ripley_esperado}"
        else
            $tools.fallo("El subtotal no coincide con la suma de los precios de los items #{total_ripley_esperado}/#{total_ripley_caja_precio}")
        end
    end

    def calcular_subtotal_normal
        cantidad_productos = @list_product_items.count
        puts "La bolsa tiene #{cantidad_productos} productos"
        i = 1
        subtotal = 0
        while i <= cantidad_productos
            #precio_internet_item = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][' + i.to_s + ']//td[contains(text(), "Precio unidad")]/following-sibling::td')
            precio_internet_item = $driver.element(xpath: '//div[@class="shopping-bag-item-row new-shopping-bag"][' + i.to_s + ']//div[@class="cart-product-info-price-value"]')
            cantidad_item = $driver.element(xpath: '//div[@class="shopping-bag-item-row new-shopping-bag"][' + i.to_s + ']//div[@class="stepper-value"]').text.to_i
            precio_product_item = precio_internet_item.text.delete('$').delete('.').to_i
            subtotal = subtotal + (precio_product_item * cantidad_item)
            i += 1
        end
        return subtotal
    end

    def calcular_total_ripley
        cantidad_productos = @list_product_items.count
        puts "La bolsa tiene #{cantidad_productos} productos"
        i = 1
        subtotal = 0
        while i <= cantidad_productos
            
            precio_ripley_item = $driver.element(xpath: '//div[@class="shopping-bag-item-row new-shopping-bag"][' + i.to_s + ']//span[contains(text(),"Tarjeta Ripley/Chek")]/following-sibling::div')
            precio_internet_item = $driver.element(xpath: '//div[@class="shopping-bag-item-row new-shopping-bag"][' + i.to_s + ']//span[contains(text(),"Internet")]/following-sibling::div')
           # precio_ripley_item = $driver.element(xpath: '//div[@class="shopping-bag-item-row new-shopping-bag"][' + i.to_s + ']//td[contains(text(), "Tarjeta Ripley")]/following-sibling::td')
           # precio_internet_item = $driver.element(xpath: '//div[@class="shopping-bag-item-row new-shopping-bag"][' + i.to_s + ']//td[contains(text(), "Precio unidad")]/following-sibling::td')
            
            cantidad_item = $driver.element(xpath: '//div[@class="shopping-bag-item-row new-shopping-bag"][' + i.to_s + ']//div[@class="stepper-value"]').text.to_i
            if precio_ripley_item.present?
                precio_product_item = precio_ripley_item.text.delete('$').delete('.').to_i
            else
                precio_product_item = precio_internet_item.text.delete('$').delete('.').to_i
            end
            subtotal = subtotal + (precio_product_item * cantidad_item)
            i += 1
        end
        return subtotal
    end

    def validar_cantidad_producto
        if $producto.get_data["cantidad"] == @lbl_cant.text.to_i
            puts "Debe haber #{$producto.get_data["cantidad"]} del producto #{$producto.get_data["nombre"]} y se muestran #{@lbl_cant.text} en la bolsa"
        else
            $tools.fallo "Debe haber #{$producto.get_data["cantidad"]} del producto #{$producto.get_data["nombre"]} y se muestran #{@lbl_cant.text} en la bolsa"
        end
    end

    def click_ir_a_la_bolsa
        $tools.click(@btn_ir_a_la_bolsa)
        puts "Se hace Click en Ir a la bolsa."
    end

end