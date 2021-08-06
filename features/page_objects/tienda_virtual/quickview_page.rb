class QuickViewPage
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/quickview_selectors.json"))
        @btn_quickview_close = $driver.button(xpath: @selectors["quickview"]["btn_cerrar"])
        @mas_detalles = $driver.element(xpath: @selectors["quickview"]["mas_detalles"])
        @title_quickview = $driver.element(xpath: @selectors["quickview"]["title_quickview"]) 
        @btn_menos = $driver.element(xpath: @selectors["quickview"]["btn_menos"])
        @btn_mas = $driver.element(xpath: @selectors["quickview"]["btn_mas"])
        @lbl_cantidad = $driver.element(xpath: @selectors["quickview"]["lbl_cantidad"])
        @btn_seleciona_opciones = $driver.button(xpath: @selectors["quickview"]["btn_seleciona_opciones"])
        @color_opcion_list = $driver.elements(xpath: @selectors["quickview"]["color_opcion_list"])
        @talla_opcion_list = $driver.elements(xpath: @selectors["quickview"]["talla_opcion_list"])
        @btn_add_bolsa = $driver.button(xpath: @selectors["quickview"]["btn_add_bolsa"])
        #datos producto
        @prod_name = $driver.element(xpath: '//div[@class="quickview-header"]/h3')
        @precio_normal = $driver.element(xpath: '//dd[@class="product-price-type" and contains(text(), "Normal")]/following-sibling::dt')
        @precio_internet = $driver.element(xpath: '//dd[@class="product-price-type" and contains(text(), "Internet")]/following-sibling::dt')
        @precio_ripley = $driver.element(xpath: '//dd[@class="product-price-type" and contains(text(), "Tarjeta Ripley o Chek")]/following-sibling::dt')
        @descuento = $driver.element(xpath: '//dd[@class="product-price-type" and contains(text(), "Descuento")]/following-sibling::dt')
        @ripley_puntos = $driver.element(xpath: '//span[@class="product-price-type" and contains(text(), "Acumulas")]/following-sibling::span') 
        @aceptar_cookies = $driver.element(xpath: @selectors["aceptar_cookie"])

    end

    def verifico_cantidad_no_menor_uno
        cantidad = @lbl_cantidad.text.to_s
        $tools.click @btn_menos
        if cantidad == @lbl_cantidad.text.to_s
            puts "Se mantuvo la cantidad de productos a #{cantidad}"
        else
            $tools.fallo("La cantidad en el quickvew se decremento a #{@lbl_cantidad.text}")
        end 
    end

    def ingreso_cantidad_random_quickview
        cantidad = rand(2..9)
        puts "Se deben indicar #{cantidad} productos"
        timeout = 0
        cantidad_ahora = @lbl_cantidad.text.to_i
        puts "Ahora hay #{cantidad_ahora}"
        while((cantidad_ahora != cantidad) && (timeout < 10))
            $tools.click @btn_mas
            cantidad_ahora = @lbl_cantidad.text.to_i
            puts "Ahora hay #{cantidad_ahora}"
            timeout += 1
        end
        if cantidad_ahora == cantidad
            puts "Ya se indico la cantidad del producto en el QuickView #{cantidad} correctamente"
        else
            $tools.fallo("Error al setear la cantidad #{cantidad} del producto en el QuickView")
        end
    end

    def ingresar_cantidad_quickview(cant)
        label_cantidad = @lbl_cantidad.text.to_i
        puts "Cantidad de productos inicial: " + label_cantidad.to_s
        if(cant <= 0 || cant >= 10)
            puts "Debe ingresar cantidades entre 1 y 9, se dejara por defecto #{label_cantidad}"
        elsif(label_cantidad == 1 && label_cantidad == cant)
            puts "No es necesario ingresar cantidad, por defecto es 1"
        else
            while(cant != label_cantidad)
                if cant < label_cantidad
                    $tools.click(@btn_menos)
                elsif cant > label_cantidad
                    $tools.click(@btn_mas)
                else
                    puts "Ya son iguales"
                end
                label_cantidad = @lbl_cantidad.text.to_i
                puts "Cantidad de productos ingresada: " + label_cantidad.to_s
            end
        end
        $log.set_cant(cant)
    end

    def ingresar_cantidad_sin_restricciones_quickview(cantidad)
        timeout = 0
        cantidad_ahora = @lbl_cantidad.text.to_i
        while((cantidad_ahora != cantidad) && (timeout < 10))
            $tools.click @btn_mas
            cantidad_ahora = @lbl_cantidad.text.to_i
            puts "Ahora hay #{cantidad_ahora}"
            timeout += 1
        end
    end

    def validar_cantidad_quickview_no_mayor_nueve
        label_cantidad = @lbl_cantidad.text.to_i
        if label_cantidad == 9
            puts "Se ingreso cantidad de productos hasta 9, no se permite ingresar mas"
        elsif label_cantidad > 9
            $tools.fallo("QuickView permite ingresar cantidad superior a 9, se ingreso: #{label_cantidad}")
        else
            puts "No se ingreso previamente una cantidad mayor a 9"
        end
    end

    def validar_label_selecciona_opciones
        begin
            $tools.esperar_elemento  @btn_seleciona_opciones
        rescue
            $tools.fallo("No se visualiza boton Selecciona opciones")
        end
    end

    def seleccionar_opciones_producto_quickview_random
        esperar_loading
        puts "Opciones de Color"
        xpath = '//div[@class="product-colors-container"]['
        seleccionar_opcion_random(@color_opcion_list, xpath)
        sleep 2
        puts "Opciones de Talla"
        xpath = '//div[@class="custom-select is-pristine radio-box"]//li[@class="radio-item js-check-product"]['
        seleccionar_opcion_random(@talla_opcion_list, xpath)
    end

    def seleccionar_opcion_random(list_element, xpath)
        cant_opcions = list_element.count
        if cant_opcions != NIL && cant_opcions != 0
            puts "Cantidad de opciones: #{cant_opcions}"
            random_num_color = rand 1..cant_opcions
            puts "Seleccionado: #{random_num_color}"
            selected_opcion = $driver.element(xpath: xpath + random_num_color.to_s + ']')
            if @aceptar_cookies.present?
                $tools.click(@aceptar_cookies)
            end
            $tools.click(selected_opcion)
        else
            puts "No hay opcion"
        end
    end

    def capturar_datos_producto
        nombre =  @prod_name.text
        puts "Nombre: " + nombre
        if @precio_normal.present? 
            precio_normal =  @precio_normal.text
            puts "Precio Normal: " + precio_normal
        else 
            puts "No hay precio normal"
        end
        if @precio_internet.present? 
            precio_internet = @precio_internet.text 
            puts "Precio Internet: " + precio_internet
        else
            puts "No hay precio internet"
        end
        if @precio_ripley.present? 
            precio_ripley = @precio_ripley.text 
            puts "Precio Ripley: " + precio_ripley
        else
            puts "No hay precio ripley"
        end
        if @descuento.present? 
            descuento = @descuento.text
            puts "Descuento: " + descuento
        else
            puts "No hay descuento"
        end
        cantidad = 1
        color_elem = $driver.element(xpath: '//div[@class="product-colors-option-outer __chosen"]')
        if color_elem.present?
            color = color_elem.title
            puts "Color: " +color
        end
        talla_elem = $driver.element(xpath: '//div[@class="radio-item is-selected js-check-product"]')
        if talla_elem.present?
            talla = talla_elem.title
            puts "Talla: " +talla
        end

        if @ripley_puntos.present?
            ripley_puntos = @ripley_puntos.text
            puts "Ripley puntos: " + ripley_puntos
        else
            ripley_puntos="No se muestran los puntos Ripley"
        end
        $producto = Producto.new("", nombre, "", precio_normal, precio_internet, precio_ripley, descuento, ripley_puntos, cantidad, color, talla, "")
        $lista_productos << $producto
    end

    def validar_activacion_button_add_bolsa
        esperar_loading
        begin
            $tools.esperar_elemento @btn_add_bolsa
        rescue
            $tools.fallo("No se visualiza boton Agregar a la bolsa")
        end
    end

    def esperar_loading
        loading = $driver.element(xpath: '//div[@class="is-loading-overlay"]')
        timeout = 0
        while(loading.present? && (timeout < 60))
            sleep 1
            timeout += 1
            puts "Cargando boton agregar a la bolsa"
        end
    end

    def agregar_a_bolsa_quick_view
        capturar_datos_producto
        $tools.click @btn_add_bolsa
    end

    def click_ver_mas_detalles
        esperar_loading
        capturar_datos_producto
        if @aceptar_cookies.present?
            $tools.click(@aceptar_cookies)
        end
        $tools.click @mas_detalles
    end

    def click_titulo_producto
        esperar_loading
        capturar_datos_producto
        if @aceptar_cookies.present?
            $tools.click(@aceptar_cookies)
        end
        $tools.click @title_quickview
    end
end