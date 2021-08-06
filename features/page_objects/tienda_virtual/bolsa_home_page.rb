class BolsaHomePage 

    def initialize 
        selectors = JSON.parse(File.read("./features/selectors/bolsa_home_selectors.json"))
        @btn_bolsa = $driver.element(xpath: selectors["btn_bolsa"])
        @lbl_bolsa_vacia = $driver.element(xpath: selectors["bolsa_vacia"])
        @list_productos = $driver.elements(xpath: selectors["list_productos"])
        @bag_loaging = $driver.element(xpath: selectors["bag_loaging"])
        @btn_cerrar = $driver.element(xpath: selectors["btn_cerrar"])
        @btn_ir_bolsa = $driver.element(xpath: selectors["btn_ir_bolsa"])
        @subtotal = $driver.element(xpath: selectors["subtotal"])
        @total_normal = $driver.element(xpath: selectors["total_normal"])
        @total_ripley = $driver.element(xpath: selectors["total_ripley"])
        @btn_cerrar_empty = $driver.element(xpath: selectors["btn_cerrar_empty"])
        @pop_up_ir_a_la_bolsa = $driver.element(xpath: selectors["pop_up_ir_a_la_bolsa"])
    end

    def realizar_click_pop_ir_bolsa
        $tools.esperar_elemento(@pop_up_ir_a_la_bolsa)
        $tools.click(@pop_up_ir_a_la_bolsa)
    end

    def click_bolsa_productos
        sleep 5
        $tools.scroll_to(:top)
        sleep 5
        # $tools.click(@btn_bolsa)
        clicBtnBolsa = $driver.execute_script("return arguments[0].click();", @btn_bolsa) 
    end

    def validar_bolsa_vacia
        $tools.esperar_elemento(@lbl_bolsa_vacia)
    end

    def esperar_loading_off
        timeout = 1
        while(@bag_loaging.present? && (timeout < 60))
            sleep 2
            timeout += 1
        end
    end

    def validar_producto_agregado_carrusel
        sleep 4
        producto_esperado = $driver.element(xpath: '//div[@class="cart-product-info-name"]')
        $tools.esperar_elemento(producto_esperado)
        name_prod_esperado = producto_esperado.attribute("title")     
        
        if $name_prod_select == name_prod_esperado
            puts "Producto agregado a la bolsa correctamente"
        else
            $tools.fallo("Ocurrio un error, no se pudo encontrar el producto a la bolsa")
        end
    end

    def validar_producto_agregado
        puts "REVISAR AQUI: " + $producto.get_data["nombre"]
        #producto_esperado = $driver.element(xpath: '//div[@class="shopping-bag-item-row"]//div[@title="' +  $producto.get_data["nombre"] + '"]')
        producto_esperado = $driver.element(xpath: '//div[@class="cart-product-info-name"]')
        
        $tools.esperar_elemento(producto_esperado)
        extragarantia = $producto.get_data["nombre_extragarantia"]
        if extragarantia != "" && extragarantia != nil
            producto_esperado = $driver.element(xpath: '//div[@class="cart-product-info-name"][contains(text(), "Garantía ")]')
            $tools.esperar_elemento(producto_esperado)
        end
    end

    
    def validar_listado_productos_bolsa
        cant = $lista_productos.length
        i = 0
        while i < cant
            puts $lista_productos[i].get_data["nombre"]
            producto_esperado = $driver.element(xpath: '//div[@class="shopping-bag-item-row new-shopping-bag"]//div[@class="cart-product-info-name"]//div[@title="' +  $lista_productos[i].get_data["nombre"] + '"]')
            $tools.esperar_elemento(producto_esperado)
            extragarantia =  $lista_productos[i].get_data["nombre_extragarantia"]
            if extragarantia != "" && extragarantia != nil
                producto_esperado = $driver.element(xpath: '//div[@class="shopping-bag-item-row"]//div[@title="' + 'EG ' + extragarantia + '"]')
                $tools.esperar_elemento(producto_esperado)
            end
            i += 1
        end
    end

    def delete_all_product
            esperar_loading_off
            if !@lbl_bolsa_vacia.present?
                cantidad = @list_productos.count
                pivot = 1
                puts "Cantidad: #{cantidad}"
                while cantidad >= pivot
                    btn_delete = $driver.button(xpath: '//div[@class="shopping-bag-item-actions"][1]//button[@title="Quitar producto"]')
                    sleep 1
                    $tools.click(btn_delete)
                    esperar_loading_off
                    pivot += 1
                end
                $lista_productos.clear
            else
                puts "Bolsa Vacia"
            end
    end

    def click_cerrar_bolsa
        sleep 2
        if @btn_cerrar_empty.present?
            sleep 1
            $tools.click(@btn_cerrar_empty)
            sleep 2
            if !@btn_cerrar_empty.present?
                puts "Cerrada la bolsa"
            else
                $tools.fallo("Bolsa no cerro")
            end
        elsif @btn_cerrar.present?
            $tools.click(@btn_cerrar)
            sleep 2
            if !@btn_cerrar.present?
                puts "Cerrada la bolsa"
            else
                $tools.fallo("Bolsa no cerro")
            end
        else
            $tools.fallo("No se encuentra boton de cerrar bolsa")
        end
    end

    def validar_cantidad_productos(cantidad)
        cantidad_real = @list_productos.count
        if cantidad != cantidad_real
            $tools.fallo("Se esperan #{cantidad} productos en la bolsa y contiene #{cantidad_real}")
        else
            puts "Existen #{cantidad_real} productos en la bolsa correctamente"
        end
    end

    def validar_cantidad_producto(cantidad)
        cant_value = $driver.element(xpath: '//div[@title="' +  $producto.get_data["nombre"] + '"]/parent::div/parent::a/preceding-sibling::div/div[@class="stepper-value"]')
        cant_actual = cant_value.text
        if cantidad.to_i == cant_actual.to_i
            puts "La cantidad esta acorde a lo deseado #{cant_value.text}"
        else
            $tools.fallo("La cantidad del producto no coincide con la indicada")
        end
    end

    def indicar_cantidad_productos(cantidad)
        puts "AQUI"
        btn_add = $driver.button(xpath: '//div[@title="' +  $producto.get_data["nombre"] + '"]/parent::div/parent::a/preceding-sibling::div/button[@title="Agregar uno"]')
        btn_res = $driver.button(xpath: '//div[@title="' +  $producto.get_data["nombre"] + '"]/parent::div/parent::a/preceding-sibling::div/button[@title="Quitar uno"]')
        cant_value = $driver.element(xpath: '//div[@title="' +  $producto.get_data["nombre"] + '"]/parent::div/parent::a/preceding-sibling::div/div[@class="stepper-value"]')
         
        cant_actual = cant_value.text.to_i
        puts "Cantidad a indicar: #{cantidad}"
        flag = true
        while flag
            puts "Cantidad actual: #{cant_actual}"
            
            if cantidad.to_i == cant_actual
                flag = false
                break
            elsif cantidad.to_i < cant_actual
                aumento = false
                puts "Se disminuye uno"
                $tools.click(btn_res)
                esperar_loading_off
            elsif cantidad.to_i > cant_actual
                aumento = true
                puts "Se aumenta uno"
                $tools.click(btn_add)
                esperar_loading_off
            end
            if aumento
                cant_actual += 1
            else 
                cant_actual -= 1
            end
        end
        $producto.set_cantidad(cantidad)
    end

    def validar_producto_eliminado
        producto = $driver.button(xpath: '//div[@title="' +  $producto.get_data["nombre"] + '"]')
        if producto.present?
            $tools.fallo("El producto #{$producto.get_data["nombre"]} no fue eliminado")
        else
            puts "El producto #{$producto.get_data["nombre"]} ha sido eliminado"
        end
    end

    def click_ir_bolsa
        $tools.click(@btn_ir_bolsa)
    end

    def validar_precio_normal
        puts "PENDIENTE DE DATO"
    end

    def validar_precio_internet
        precio = $driver.element(xpath: '//div[@title="' + $producto.get_data["nombre"] + '"]/following-sibling::table//td[@class="cart-product-info-price-label" and contains(text(), "Precio unidad")]/following-sibling::td[@class="cart-product-info-price-value"]').text
        if precio == $producto.get_data["precio_internet"]
            puts "Precio Internet OK"
        else
            $tools.fallo("Precio Internet NOK")
        end
    end

    def validar_precio_ripley
        precio = $driver.element(xpath: '//div[@title="' + $producto.get_data["nombre"] + '"]/following-sibling::table//td[@class="cart-product-info-price-label" and contains(text(), "Tarjeta Ripley")]/following-sibling::td[@class="cart-product-info-price-value"]').text
        if precio == $producto.get_data["precio_ripley"]
            puts "Precio Ripley OK"
        else
            $tools.fallo("Precio Ripley NOK")
        end
    end

    def validar_subtotal
        cant_productos = @list_productos.count
        puts "Hay #{cant_productos} productos en la bolsa"
        #sumar las cantidades de precio unidad de los productos listados
        count = 1
        subtotal = 0
        while count <= cant_productos
            precio_unidad = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][' + count.to_s + ']//td[@class="cart-product-info-price-label" and contains(text(), "Precio unidad")]/following-sibling::td[@class="cart-product-info-price-value"]').text
            cantidad_producto = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][' + count.to_s + ']//div[@class="stepper"]//div[@class="stepper-value"]').text
            puts precio_unidad.delete("$").delete(".").to_i.to_s
            subtotal = subtotal + (precio_unidad.delete("$").delete(".").to_i * cantidad_producto.to_i)
            puts "Subtotal es: #{subtotal}"
            count += 1
        end
        if @subtotal.text.delete("$").delete(".").to_i == subtotal
            puts "Subtotal OK"
        else
            $tools.fallo("Calculo Subtotal NOK")
        end
    end

    def validar_total_normal
        cant_productos = @list_productos.count
        puts "Hay #{cant_productos} productos en la bolsa"
        #sumar las cantidades de precio unidad de los productos listados
        count = 1
        subtotal = 0
        while count <= cant_productos
            precio_unidad = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][' + count.to_s + ']//td[@class="cart-product-info-price-label" and contains(text(), "Precio unidad")]/following-sibling::td[@class="cart-product-info-price-value"]').text
            cantidad_producto = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][' + count.to_s + ']//div[@class="stepper"]//div[@class="stepper-value"]').text
            puts precio_unidad.delete("$").delete(".").to_i.to_s
            subtotal = subtotal + (precio_unidad.delete("$").delete(".").to_i * cantidad_producto.to_i)
            puts "Total Normal es: #{subtotal}"
            count += 1
        end
        if @total_normal.text.delete("$").delete(".").to_i == subtotal
            puts "Total Normal OK"
        else
            $tools.fallo("Calculo Total Normal NOK")
        end
    end

    def validar_total_ripley
        cant_productos = @list_productos.count
        puts "Hay #{cant_productos} productos en la bolsa"
        #sumar las cantidades de precio unidad de los productos listados
        count = 1
        subtotal = 0
        while count <= cant_productos

            precio_ripley = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][' + count.to_s + ']//td[@class="cart-product-info-price-label" and contains(text(), "Tarjeta Ripley")]/following-sibling::td[@class="cart-product-info-price-value"]')
            if precio_ripley.present?
                puts "Tiene Precio Ripley"
                precio_ripley = precio_ripley.text
                cantidad_producto = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][' + count.to_s + ']//div[@class="stepper"]//div[@class="stepper-value"]').text
                puts precio_ripley.delete("$").delete(".").to_i.to_s
                subtotal = subtotal + (precio_ripley.delete("$").delete(".").to_i * cantidad_producto.to_i)
                puts "Total Tarjeta Ripley es: #{subtotal}"  
               
            else
                puts "Este producto no tiene precio con tarjeta Ripley, se sumara el precio unidad"
                precio_unidad = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][' + count.to_s + ']//td[@class="cart-product-info-price-label" and contains(text(), "Precio unidad")]/following-sibling::td[@class="cart-product-info-price-value"]').text
                cantidad_producto = $driver.element(xpath: '//div[@class="shopping-bag-item-row"][' + count.to_s + ']//div[@class="stepper"]//div[@class="stepper-value"]').text
                puts precio_unidad.delete("$").delete(".").to_i.to_s
                subtotal = subtotal + (precio_unidad.delete("$").delete(".").to_i * cantidad_producto.to_i)
                puts "Total Tarjeta Ripley es: #{subtotal}"  
            end
            count += 1
        end

        if @total_ripley.text.delete("$").delete(".").to_i == subtotal
            puts "Total Tarjeta Ripley OK"
        else
            $tools.fallo("Calculo Total Tarjeta Ripley NOK")
        end
    end

end






