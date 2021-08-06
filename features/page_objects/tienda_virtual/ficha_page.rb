require './features/page_objects/tienda_virtual/home_page.rb'

class FichaPage < RipleyHomePage
    def initialize 
        selectors = JSON.parse(File.read("./features/selectors/ficha_selectors.json"))
        case $mobile
        when true
            @prod_sku = $driver.element(xpath: selectors["mobile"]["prod_sku"])
            @prod_name = $driver.element(xpath: selectors["mobile"]["prod_name"])
            @select_color = $driver.element(xpath: selectors["mobile"]["select_color"])
            @select_talla = $driver.select_list(xpath: selectors["mobile"]["select_talla"])
            @prod_desc = $driver.element(xpath: selectors["mobile"]["prod_desc"])
            @guia_talla = $driver.element(xpath: selectors["mobile"]["link_guia_talla"])
            @conoce_tu_talla = $driver.element(xpath: selectors["mobile"]["link_conoce_talla"])
        else
            @prod_sku = $driver.element(xpath: selectors["product_item"]["prod_sku"])
            @prod_name = $driver.element(xpath: selectors["product_item"]["prod_name"])
            @prod_desc = $driver.element(xpath: selectors["product_item"]["prod_desc"])
            @guia_talla = $driver.element(xpath: selectors["product_item"]["link_guia_talla"])
            @conoce_tu_talla = $driver.element(xpath: selectors["product_item"]["link_conoce_talla"])
            # @container_nuevo = $driver.element(xpath: selectors["product_item"]["container_nuevo"])
        end
        
        @container_nuevo = $driver.element(xpath: selectors["product_item"]["container_nuevo"])
        @error_page = $driver.element(xpath: selectors["product_item"]["error_page"])
        @precio_normal = $driver.element(xpath: selectors["product_item"]["precio_normal"])
        @precio_internet = $driver.element(xpath: selectors["product_item"]["precio_internet"])
        @precio_ripley = $driver.element(xpath: selectors["product_item"]["precio_ripley"])
        @descuento = $driver.element(xpath: selectors["product_item"]["descuento"])
        @ripley_puntos = $driver.element(xpath: selectors["product_item"]["ripley_puntos"])
        @btn_menos = $driver.element(xpath: selectors["product_item"]["btn_menos"])
        @btn_mas = $driver.element(xpath: selectors["product_item"]["btn_mas"])
        @cantidad = $driver.element(xpath: selectors["product_item"]["cantidad"])
        @color_opcion_list = $driver.elements(xpath: selectors["product_item"]["color_opcion_list"])
        @talla_opcion_list = $driver.elements(xpath: selectors["product_item"]["talla_opcion_list"])        
        @select_comuna = $driver.element(xpath: selectors["product_item"]["select_comuna"])
        @btn_ir_bolsa = $driver.element(xpath: selectors["product_item"]["btn_ir_bolsa"])
        @opc_extragaranty = $driver.elements(xpath: selectors["product_item"]["opc_extragaranty"])
        @seguir_comprando = $driver.element(xpath: selectors["product_item"]["seguir_comprando"])
        @bt_garext_continuar = $driver.element(xpath: selectors["extra_garantia_popup"]["bt_garext_continuar"])
        @especificaciones = $driver.element(xpath: selectors["product_item"]["especificaciones"])
        @sugerencia_cuotas = $driver.element(xpath: selectors["product_item"]["sugerencia_cuotas"])
        @calcular_cuotas = $driver.element(xpath: selectors["product_item"]["calcular_cuotas"])
        @select_num_cuotas = $driver.element(xpath: selectors["product_item"]["select_num_cuotas"])
        @pago_mensual_form = $driver.element(xpath: selectors["product_item"]["pago_mensual_form"])
        @costo_total_cae_form = $driver.element(xpath: selectors["product_item"]["costo_total_cae_form"])
        @aceptar_cookies = $driver.element(xpath: selectors["aceptar_cookie"])
        @btn_agotado = $driver.element(xpath: selectors["product_item"]["btn_agotado"])
        @calificacion = $driver.element(xpath: selectors["product_item"]["calificacion"])
        @labelDespachoDisponible = $driver.element(xpath: selectors["product_item"]["labelDespachoDisponible"])
        @btnCambiarComuna = $driver.element(xpath: selectors["product_item"]["btnCambiarComuna"])
        @btnSelect = $driver.element(xpath: selectors["product_item"]["btnSelect"])
        @labelSeleccionaOpciones = $driver.element(xpath: selectors["product_item"]["labelSeleccionaOpciones"])          
        @btn_bolsa_productos = $driver.element(xpath: selectors["product_item"]["btn_bolsa_productos"])
        @popup_sorpresas = $driver.element(xpath: selectors["popup"]["contenedor"])
        @btn_popup_no_gracias = $driver.element(xpath: selectors["popup"]["btn_cerrar"])
        @tabDescripcion = $driver.element(xpath: selectors["product_item"]["tab_descripcion"])
        @tabEspecificiones = $driver.element(xpath: selectors["product_item"]["tab_especificaciones"])
        @tabComentarios = $driver.element(xpath: selectors["product_item"]["tab_comentarios"])
        @tabGarantia = $driver.element(xpath: selectors["product_item"]["tab_garantia_legal_y_fabricante"])

        @contariner_conoce_tu_talla = $driver.element(xpath: selectors["product_item"]["contariner_conoce_tu_talla"])

        @contariner_guia_talla = $driver.element(xpath: selectors["product_item"]["contariner_guia_talla"])
        @button_add_bolsa = $driver.element(xpath: selectors["product_item"]["btn_add_bolsa"])
    end

    # Se debe continuar desarrollo cuando esté funcionando correctamente 
    def agregar_bolsa_recomendaciones
        $tools.esperar_elemento($driver.element(xpath: '//div[@class="recommendations-carousel"]'))
        cantidad_Recomendaciones = $driver.elements(xpath: '//div[@class="recommendations-carousel"]//div[@class="owl-item"]').count        

        if cantidad_Recomendaciones == 0
            $tools.fallo("No se muestran recomendaciones")  
        end
        sleep 3
        item = rand(1..5)
        # sleep 3
        $name_prod_select = $driver.element(xpath: '//div[@class="recommendations-carousel"]//div[@class="owl-item"][' + item.to_s + ']//span[contains(@class, "name")]').text
        puts "El nombre es: #{$name_prod_select}"
        item_selected = $driver.element(xpath: '//div[@class="recommendations-carousel"]//div[@class="owl-item"][' + item.to_s + ']//button[text()="Agregar a la bolsa"]')
        if $mobile
            clicBtnBolsa = $driver.execute_script("return arguments[0].click();", item_selected) 
        else
            $tools.click(item_selected)         
        end
    end

    def validar_container_guia_talla
        begin
            $tools.esperar_elemento(@contariner_guia_talla)
        rescue
            $tools.fallo("No se muestra container de guia de talla")
        end
    end

    def click_guia_talla
        sleep 3
        begin                        
            case $mobile
                when true
                    $driver.execute_script("arguments[0].scrollIntoView(true);", @guia_talla) 
                    # $tools.esperar_elemento(@guia_talla)
                    $driver.send_keys :up
                    $driver.send_keys :up
                    sleep 3
                    $tools.click(@guia_talla)
                else
                    $tools.esperar_elemento(@guia_talla)
                    $tools.click(@guia_talla)
                end
        rescue
            $tools.fallo("No se muestra link de guia de talla")
        end        
    end

    def validar_container_conoce_tu_talla
        begin
            $tools.esperar_elemento(@contariner_conoce_tu_talla)
        rescue
            $tools.fallo("No se muestra container de conoce tu talla")
        end
    end

    def click_conoce_tu_talla
        sleep 3
        begin
            case $mobile
            when true
                $driver.execute_script("arguments[0].scrollIntoView(true);", @conoce_tu_talla) 
                # $tools.esperar_elemento(@conoce_tu_talla)
                $driver.send_keys :up
                $driver.send_keys :up
                $driver.send_keys :up
                sleep 3
                $tools.click(@conoce_tu_talla)
            else
                $tools.esperar_elemento(@conoce_tu_talla)
                $tools.click(@conoce_tu_talla)
            end
        rescue
            $tools.fallo("No se muestra link de conoce tu talla")
        end        
    end

    def validarSeleccionaOpciones
        begin
            $tools.esperar_elemento(@labelSeleccionaOpciones)
        rescue
            $tools.fallo("No se muestra seleccionar opciones.")
        end
    end
    def clickCambiarComuna
        sleep 5
        $tools.esperar_elemento(@btnCambiarComuna)
        if $mobile
            $driver.execute_script("arguments[0].scrollIntoView(true);", @btnCambiarComuna)     
            $driver.send_keys :up
            $driver.send_keys :up       
            sleep 1 
        end
        $tools.click(@btnCambiarComuna)
    end

    def clickSelectComuna
        $tools.click(@btnSelect)
        $driver.send_keys "El Bosque"
        # comuna = $driver.element(xpath: '//div[@class="Select-menu-outer"]//*[contains(text(),"El Bosque")]')        
        $driver.send_keys :enter
        # $tools.click comuna
    end

    def validarDespachoDisponible
        begin
            $tools.esperar_elemento(@labelDespachoDisponible)
        rescue
            $tools.fallo("No se muestra disponibilidad de despacho a domicilio.")
        end
    end

    def verificar_disponibilidad
        begin
            $tools.esperar_elemento(@prod_sku)
        rescue
            # $driver.refresh
            # retry
            if @error_page.present?
                $tools.fallo("Producto no disponible")
            else
                puts "Caso no mapeado revisar disponibilidad detalle producto"
            end
        end
    end

    def validar_nombre_ficha
        if @prod_name.present?
            puts "Se muestra el nombre en la ficha."
        else
            $tools.fallo("No se muestra el nombre en la ficha.")
        end
    end

    def validar_sku_ficha
        if @prod_sku.present?
            puts "Se muestra el sku en la ficha."
        else
            $tools.fallo("No se muestra el sku en la ficha.")
        end
    end

    def validar_calificaciones_ficha
        sleep 2

        if $mobile
            ir_calificacion = $driver.element(xpath: '//section[@class="product-header visible-xs"]//div[2]')
        else
            ir_calificacion = $driver.element(xpath: '//section[@class="product-header hidden-xs"]//div[2]')
        end
        sleep 2
        # $tools.click(clic_calificacion)
        $driver.execute_script("return arguments[0].click();", ir_calificacion) 

        if @calificacion.present?
            puts "Se muestra la calificacion en la ficha."
        else
            $tools.fallo("No se muestra la calificacion en la ficha.")
        end
    end

    def validar_descripción_corta
        if @prod_desc.present?
            puts "Se muestra la descripción en la ficha."
        else
            $tools.fallo("No se muestra la descripción en la ficha.")
        end
    end

    def validar_container_nuevo
        if @container_nuevo.present?
            puts "Se muestra container correctamente."
        else
            $tools.fallo("No se muestra container en la ficha.")
        end
    end
    def validar_precio_normal
        if @precio_normal.present?
            puts "Se muestra el precio normal en la ficha."
        else
            $tools.fallo("No se muestra el precio normal en la ficha.")
        end
    end

    def validar_precio_internet
        if @precio_internet.present?
            puts "Se muestra el precio internet en la ficha."
        else
            $tools.fallo("No se muestra el precio internet en la ficha.")
        end
    end

    def validar_precio_ripley
        if @precio_ripley.present?
            puts "Se muestra el precio ripley en la ficha."
        else
            $tools.fallo("No se muestra el precio ripley en la ficha.")
        end
    end

    def validar_puntos_ripley
        if @ripley_puntos.present?
            puts "Se muestran los ripley puntos go la ficha."
        else
            $tools.fallo("No se muestran los ripley puntos go en la ficha.")
        end
    end

    def validar_descuento
        if @descuento.present?
            puts "Se muestra el descuento en la ficha."
        else
            $tools.fallo("No se muestra el descuento en la ficha.")
        end

    end


    def capturar_datos_producto
        sku = @prod_sku.text.delete("P")
        $log.set_sku(sku)
        puts "Sku: " + sku
        if @prod_name.present?
            nombre =  @prod_name.text
            puts "Nombre: " + nombre
        else
            puts "No se muestra el nombre"
        end
        if @prod_desc.present?
            descripcion = @prod_desc.text
            puts "Descripcion: " + descripcion
        else
            puts "No se muestra descripcion"
        end
        if @precio_normal.present? 
            precio_normal =  @precio_normal.text
            puts "Precio Normal: " + precio_normal
        else 
            precio_normal = ""
            puts "No hay precio normal"
        end
        if @precio_internet.present? 
            precio_internet = @precio_internet.text 
            puts "Precio Internet: " + precio_internet
        else
            precio_internet = ""
            puts "No hay precio internet"
        end
        if @precio_ripley.present? 
            precio_ripley = @precio_ripley.text 
            puts "Precio Ripley: " + precio_ripley
        else
            precio_ripley = ""
            puts "No hay precio ripley"
        end
        if @descuento.present? 
            descuento = @descuento.text
            puts "Descuento: " + descuento
        else
            descuento = ""
            puts "No hay descuento"
        end
        if @ripley_puntos.present?
            ripley_puntos = @ripley_puntos.text
            puts "Ripley puntos: " + ripley_puntos
        else
            puts "No muestra ripley puntos"
        end

        if @cantidad.present?
            cantidad =  @cantidad.text.to_i
            puts "Cantidad del producto: #{cantidad}"
        else
            puts "No muestra cantidad"
        end
        
        case $mobile
        when true
            color_selected = $driver.element(xpath: '//select[starts-with(@name, "color")]/option[@selected]')
            talla_selected = $driver.element(xpath: '//select[starts-with(@name, "talla")]/option[@selected]')
        else
            color_selected = $driver.element(xpath: '//div[@class="radio-item is-selected js-check-product"]/input[@name="COLOR"]/following-sibling::label')
            talla_selected = $driver.element(xpath: '//div[@class="radio-item is-selected js-check-product"]/input[contains(@name, "talla")]/following-sibling::label')
        end
        if color_selected.present?
            color = color_selected.text
            puts "Color: " + color
        else
            color = ""
            puts "No hay variacion de Color"
        end
        if talla_selected.present?
            talla = talla_selected.text
            puts "Talla: " + talla
        else
            talla = ""
            puts "No hay variacion de Talla"
        end

        agotado = $driver.element(xpath: '//button[contains(text(), "Agotado")]')

        $producto = Producto.new(sku, nombre, descripcion, precio_normal, precio_internet, precio_ripley, descuento, ripley_puntos, cantidad, color, talla, $mkp)
        $mkp = false
        $producto.set_precio_extragarantia(@precio_extragarantia)
        $producto.set_nombre_extragarantia(@nombre_extragarantia)
        if agotado.present?
            $producto.set_agotado(true)
        end   
    end

    def verificar_dato_producto(atributo)
        case atributo
        when "Nombre"
            if $producto.get_data["nombre"] == @prod_name.text
                puts "#{atributo} del producto correcto #{@prod_name.text}"
            else
                $tools.fallo("#{atributo} del producto #{$producto.get_data["nombre"]} no coincide con ficha #{@prod_name.text}")
            end
        when "Precio Normal"
            if $producto.get_data["precio_normal"] == @precio_normal.text
                puts "#{atributo} del producto correcto #{@precio_normal.text}"
            else
                $tools.fallo("#{atributo} del producto #{$producto.get_data["precio_normal"]} no coincide con ficha #{@precio_normal.text}")
            end
        when "Precio Internet"
            if $producto.get_data["precio_internet"] == @precio_internet.text
                puts "#{atributo} del producto correcto #{@precio_internet.text}"
            else
                $tools.fallo("#{atributo} del producto #{$producto.get_data["precio_internet"]} no coincide con ficha #{@precio_internet.text}")
            end
        when "Precio Tarjeta Ripley"
            if $producto.get_data["precio_ripley"] == @precio_ripley.text
                puts "#{atributo} del producto correcto #{@precio_ripley.text}"
            else
                $tools.fallo("#{atributo} del producto #{$producto.get_data["precio_ripley"]} no coincide con ficha #{@precio_ripley.text}")
            end
        end
    end

    def ingresar_cantidad_productos(cantidad)
        cant = cantidad.to_i
        puts "Cantidad a setear: #{cant}"
        label_cantidad = @cantidad.text.to_i
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
                label_cantidad = @cantidad.text.to_i
                puts "Cantidad de productos ingresada: " + label_cantidad.to_s
            end
        end
        if label_cantidad == cant
            puts "Ya se indico la cantidad del producto en el QuickView #{cant} correctamente"
        else
            $tools.fallo("Error al setear la cantidad #{cant} del producto en la Ficha")
        end
        $log.set_cant(cant)
    end

    def seleccionar_opciones_producto_random
        sleep 2
        case $mobile
        when true
            if @select_color.present?
                $driver.execute_script("arguments[0].scrollIntoView(true);", @select_color) 
                $driver.send_keys :up
                $driver.send_keys :up
                sleep 2
            else
                puts "Producto no tiene opción de color y/o talla"
            end
        end

        puts "Opciones de Color"
        xpath = '//div[@class="custom-select is-pristine radio-box-wide"]//div[@class="product-colors-container"]//div[@class="product-colors-option-outer"]['
        seleccionar_opcion_random(@color_opcion_list, xpath)
        sleep 2
        puts "Opciones de Talla"
        xpath = '//div[@class="custom-select is-pristine radio-box"]//ol[@class="radio-items"]//li[@class="radio-item js-check-product"]['
        seleccionar_opcion_random(@talla_opcion_list, xpath)
        sleep 2
    end
    
    
    def validarMuestraPaletaColores
        if @color_opcion_list.count >= 1 
            puts "Se muestra paleta de colores correctamente en la ficha."
        else
            $tools.fallo("No se muestra paleta de colores en la ficha.")
        end
    end

    def validarMuestraTallas
        if @talla_opcion_list.count >= 1 
            puts "Se muestran las tallas disponibles correctamente en la ficha."
        else
            $tools.fallo("No se muestran las tallas disponibles en la ficha.")
        end
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
            sleep 1
            $tools.click(selected_opcion)
        else
            puts "No hay opcion"
        end
    end

    def realizo_click_add_bolsa
        sleep 5
        capturar_datos_producto
        $tools.salvar_pantalla("Detalle", "features/screenshots/detalle/")
        if @aceptar_cookies.present?
            $tools.click(@aceptar_cookies)
        end
        if @btn_agotado.present?
            $tools.fallo("Producto Agotado")
        else
            begin
                $tools.click(@button_add_bolsa)
            rescue
                $tools.fallo("Problemas con boton Agregar a la Bolsa de la Ficha")
            end
        end
        sleep 3
        begin
            $tools.esperar_elemento_timeout(@msg_no_disponible, 5)
            flag = true
            count = 0
            while (count < 3 && flag)
                seleccionar_opciones_producto_random
                capturar_datos_producto
                $tools.salvar_pantalla("Detalle", "features/screenshots/detalle/")
                $tools.click(@button_add_bolsa)
                begin
                    $tools.esperar_elemento(@btn_ir_bolsa)
                    flag = false
                rescue
                    puts "Sin disponibilidad, se selecciona otro producto"  
                end
                count += 1
            end
            if count == 3
                puts "Se seleccionaron aleatoriamente 4 productos y no tenian disponibilidad"
            end
        rescue 
            puts "Producto disponible debe avanzar a la Bolsa"  
            $log.set_sku($producto.get_data["sku"])
            $lista_productos << $producto
        end
        sleep 2
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

    #def validar_popup_extragarantia
     ##   begin
       #     $tools.esperar_elemento @bt_garext_continuar
        #rescue
         #   $tools.fallo("No se muestra popUp de Extragarantía")
        #end
    #end

    def validar_popup_extragarantia
        #begin
        if @bt_garext_continuar.present?
            $tools.esperar_elemento @bt_garext_continuar
	    
		    puts "Producto con EG"
	    else
	    $tools.back
        end
    end   




    def selecciono_comuna_cercana
        # $tools.esperar_elemento(@select_comuna)
        sleep 5
        if (@select_comuna.present?)
            if $mobile
                $driver.execute_script("arguments[0].scrollIntoView(true);", @select_comuna) 
                $driver.send_keys :up
                $driver.send_keys :up
            end
            sleep 3
            $tools.click(@select_comuna)       
            sleep 1
            $driver.send_keys "Cerrillos"
            $driver.send_keys :enter
        else
            puts "No se encuentra elemento"
        end
    end


    def click_ir_bolsa
        begin
            $tools.click(@btn_ir_bolsa)
        rescue
            $tools.fallo("No esta disponible el producto")
        end
    end

    def click_bolsa_productos
        sleep 3
        $tools.click(@btn_bolsa_productos)
    end

    def click_seguir_comprando
        $tools.click(@seguir_comprando)
        count = 0
        while(@seguir_comprando.present? && count < 3)
            sleep 2
            count += 1
        end
    end

    def seleccionar_extragarantia(extragarantia)
        case extragarantia
        when "No" then puts "No se seleccionara extragarantia al producto"
        when "Si"
            cant = @opc_extragaranty.count
            if(cant > 0)
                puts "El producto contiene #{cant} garantias extendidas"
                num_random = rand 1..cant
                seleccion = $driver.element(xpath: '//section[@class="product-extras-block product-warranties opened"]//div[@class="radio-item"]['+ num_random.to_s + ']/label') 
                @precio_extragarantia = $driver.element(xpath: '//div[@class="radio-item"]['+ num_random.to_s + ']//span[@class="radio-item__price"]').text
                @nombre_extragarantia = $driver.element(xpath: '//div[@class="radio-item"]['+ num_random.to_s + ']//span[@class="radio-item__label"]').text
                puts "Seleccionando EG: #{@nombre_extragarantia} Precio: #{@precio_extragarantia}"
                timeout = 0
                begin
                    $tools.click(seleccion)
                    puts "CLICK"
                    sleccionado = $driver.element(xpath: '//section[@class="product-extras-block product-warranties opened"]//div[@class="radio-item is-selected"]['+ num_random.to_s + ']')
                    $tools.esperar_elemento_timeout(sleccionado, 3)
                rescue
                    if (timeout < 2)
                        timeout += 1
                        retry
                    else
                        puts "No se selecciona"
                    end
                end 
            else
                @precio_extragarantia = ""
                @nombre_extragarantia = ""
                puts "Producto no posee extragarantias"
            end
        end
    end

    def seleccionar_extragarantia_popup(extragarantia)
        case extragarantia
        when "No" then puts "No se seleccionara extragarantia al producto"
        when "Si"
            @opc_extragaranty = $driver.elements(xpath: '//div[@class="radio-item-options display-all"]/div')
            cant = @opc_extragaranty.count
            if(cant > 0)
                puts "El producto contiene #{cant} garantias extendidas"
                num_random = rand 1..cant
                seleccion = $driver.element(xpath: '//div[@class="radio-item-options display-all"]/div['+ num_random.to_s + ']') 
                @precio_extragarantia = $driver.element(xpath: '//div[@class="radio-item-options display-all"]/div['+ num_random.to_s + ']//span[@class="radio-item__price"]').text
                puts "El valor de la extragarantia es #{@precio_extragarantia}"
                @nombre_extragarantia = $driver.element(xpath: '//div[@class="radio-item-options display-all"]/div['+ num_random.to_s + ']//span[@class="radio-item__label"]').text
                $tools.click(seleccion)
            else
                @precio_extragarantia = ""
                @nombre_extragarantia = ""
                puts "Producto no posee extragarantias"
            end
            $producto.set_precio_extragarantia(@precio_extragarantia)
            $producto.set_nombre_extragarantia(@nombre_extragarantia)
        end
    end

    def validar_especificaciones(faceta, filtro_name)
        verificar_disponibilidad
        seleccionar_opciones_producto_random
        $tools.click(@especificaciones)
        especificacion = $driver.element(xpath: '//div[@id="especificaciones"]/following-sibling::div//td[contains(text(), "' + faceta + '")]/following-sibling::td[contains(text(), "' + filtro_name + '")]')
        begin
            especificacion.wait_until(&:present?)
            puts "SI esta presente faceta #{faceta} con valor #{filtro_name}"
            return true
        rescue   
            puts "NO esta presente faceta #{faceta} con valor #{filtro_name}"
            return false
        end
    end

    def verificar_sugerencia_cuotas_presente
        begin 
            $tools.esperar_elemento @sugerencia_cuotas
            puts "Se encuentra presente la sugerencia de cuotas: #{@sugerencia_cuotas.text}"
        rescue
            $tools.fallo("No se muestra sugerencia de cuotas en este producto")
        end
    end

    def verificar_sugerencia_cuotas_no_presente
        sleep 5
        if !@sugerencia_cuotas.present?
            puts "No se encuentra presente la sugerencia de cuotas"
        else
            $tools.fallo("Se muestra sugerencia de cuotas en este producto")
        end
    end

    def verificar_cuotas_sugerencia(cuotas)
        texto_sugerido = @sugerencia_cuotas.text[0..1].delete(" ")
        puts texto_sugerido
        if cuotas == texto_sugerido
            puts "Se muestran las cuotas sugeridas correctamente #{texto_sugerido}"
        else
            $tools.fallo("No se muestran las cuotas sugeridas correctamente #{cuotas}/#{texto_sugerido}")
        end
    end

    def verificar_pago_mensual_sugerido
        precio = return_precio_menor
        puts "Precio menor: #{precio}"
        if precio == 9999999999
            $tools.fallo("No se muestra precios en este producto")
        else
            if precio < 50000
                puts "Este producto tiene el precio $#{precio} que es menor a $50000 por lo tanto no se mostrara las cuotas sugeridas"
            else
                if precio <= 350000
                    cuotas = 9
                elsif precio > 350000
                    cuotas = 12
                end
            end
            url = 'https://www.ripley.cl/wcs/resources/store/10151/simuladorcuotas/get_simuladorcuotas/DUMMYPARTNUMBER/' + cuotas.to_s + '/' + precio.to_s + ''
            response = JSON.parse(open(url).read)
            texto = @sugerencia_cuotas.text
            pago_mensual_txt = texto[texto.index('$')+1,10].delete(".").delete("c").delete("o").delete("n").delete(" ").to_i
            puts "Pago mensual en texto: #{pago_mensual_txt}"
            pago_mensual_respons = response["pagoMensual"].delete(".")[0...-1].to_i
            puts "Pago mensual respons: #{pago_mensual_respons}"  
            if pago_mensual_respons == pago_mensual_txt
                puts "El pago mensual coincide: #{pago_mensual_txt}/#{pago_mensual_respons}"
            else
                $tools.fallo("El pago mensual no coincide: #{pago_mensual_txt}/#{pago_mensual_respons}")
            end
        end
    end

    def verificar_costo_total_sugerido
        precio = return_precio_menor
        puts "Precio menor: #{precio}"
        if precio == 9999999999
            $tools.fallo("No se muestra precios en este producto")
        else
            if precio < 50000
                puts "Este producto tiene el precio $#{precio} que es menor a $50000 por lo tanto no se mostrara las cuotas sugeridas"
            else
                if precio <= 350000
                    cuotas = 9
                elsif precio > 350000
                    cuotas = 12
                end
            end
            url = 'https://www.ripley.cl/wcs/resources/store/10151/simuladorcuotas/get_simuladorcuotas/DUMMYPARTNUMBER/' + cuotas.to_s + '/' + precio.to_s + ''
            response = JSON.parse(open(url).read)
            texto = @sugerencia_cuotas.text
            costo_total_txt = texto[texto.index('Costo Total')+1,texto.index('|')].delete(".").delete("Costo Total").delete("$").delete("|").delete(" ").to_i
            puts "Costo Total en texto: #{costo_total_txt}"
            costo_total_respons = response["costoTotal"].delete(".")[0...-1].to_i
            puts "Costo Total respons: #{costo_total_respons}"  
            if costo_total_respons == costo_total_txt
                puts "El costo total coincide: #{costo_total_txt}/#{costo_total_respons}"
            else
                $tools.fallo("El costo total no coincide: #{costo_total_txt}/#{costo_total_respons}")
            end
        end
    end

    def verificar_cae_sugerido
        precio = return_precio_menor
        puts "Precio menor: #{precio}"
        if precio == 9999999999
            $tools.fallo("No se muestra precios en este producto")
        else
            if precio < 50000
                puts "Este producto tiene el precio $#{precio} que es menor a $50000 por lo tanto no se mostrara las cuotas sugeridas"
            else
                if precio <= 350000
                    cuotas = 9
                elsif precio > 350000
                    cuotas = 12
                end
            end
            url = 'https://www.ripley.cl/wcs/resources/store/10151/simuladorcuotas/get_simuladorcuotas/DUMMYPARTNUMBER/' + cuotas.to_s + '/' + precio.to_s + ''
            response = JSON.parse(open(url).read)
            texto = @sugerencia_cuotas.text
            cae_txt = texto[texto.index('CAE'),texto.size].delete("CAE").delete("%").delete(" ").to_f
            puts "CAE en texto: #{cae_txt}"
            cae_respons = response["cae"][0...-1].to_f.round(2)
            puts "CAE respons: #{cae_respons}"  
            if cae_respons == cae_txt
                puts "El cae coincide: #{cae_txt}/#{cae_respons}"
            else
                $tools.fallo("El cae no coincide: #{cae_txt}/#{cae_respons}")
            end
        end
    end

    def verificar_medio_pago_ripley_sugerido
        texto = @sugerencia_cuotas.text
        if texto.include? "Tarjeta Ripley"
            puts "Medio de Pago sugerido es Tarjeta Ripley"
        else
            $tools.fallo "Medio de Pago sugerido es distinto de Tarjeta Ripley"
        end
    end

    def return_precio_menor
        precio = 9999999999
            if @precio_normal.present?
                precio = @precio_normal.text.delete("$").delete(".").to_i
                puts "Precio normal: #{precio}"
            end
            if @precio_internet.present? 
                precio_internet = @precio_internet.text.delete("$").delete(".").to_i
                puts "Precio internet: #{precio_internet}"
                if precio > precio_internet
                    precio = precio_internet
                    puts "Actualizacion de precio: #{precio}"
                end
            end
            if @precio_ripley.present?
                precio_ripley = @precio_ripley.text.delete("$").delete(".").to_i
                puts "Precio Ripley: #{precio_ripley}"
                if precio > precio_ripley
                    precio = precio_ripley
                    puts "Actualizacion de precio: #{precio}"
                end
            end
        return precio
    end

    def click_calcular_cuotas
        timeout = 0
        while (!@select_num_cuotas.present? && timeout < 5)
            $tools.click @calcular_cuotas
            sleep 1
            timeout += 1
        end
    end

    def verificar_formulario_calcular_cuotas
        begin
            $tools.esperar_elemento(@select_num_cuotas)
        rescue
            $tools.fallo("No se muestra el formulario de calcular cuotas")
        end
    end

    def selecciono_numero_cuotas(num_cuotas)
        $tools.esperar_elemento(@select_num_cuotas)
        $tools.esperar_enabled(@select_num_cuotas)
        if num_cuotas == "Sin Cuotas"
            @cuotas = "1"
        elsif num_cuotas == "Random"
            @num_random = rand 3..48
            @cuotas = @num_random.to_s
        else
            @cuotas = num_cuotas
        end
        $tools.click(@select_num_cuotas)
        opcion = $driver.element(xpath: '//div[@class="custom-select drop-select"]/select/option[@value="' + @cuotas + '"]')
        $tools.click opcion
        esperar_cuotas_loading 
    end

    def esperar_cuotas_loading
        loading = $driver.element(xpath: '//div[@class="instalment-form__instalment-results"]//span[@class="instalment-results__loading"]/img[@alt="Cargando"]')
        count = 0
        while(loading.present? && count <= 30)
            sleep 2
            count += 1
        end
    end

    def verifico_pago_mensual_formulario(num_cuotas)
        pago_mensual = @pago_mensual_form.text.delete("Pago mensual $").delete(".").to_i
        puts "Pago Mensual #{pago_mensual}"
        precio = return_precio_menor
        puts "Precio Menor #{precio}"
        url = "https://www.ripley.cl/wcs/resources/store/10151/simuladorcuotas/get_simuladorcuotas/DUMMYPARTNUMBER/#{@cuotas}/#{precio.to_s}" 
        response = JSON.parse(open(url).read)
        puts response["pagoMensual"]
        precio_resp = response["pagoMensual"].delete(".")[0...-1].to_i

        if precio_resp == pago_mensual
            puts "El Pago mensual del formulario coincide: #{pago_mensual}/#{precio_resp}"
        else
            $tools.fallo("El Pago mensual del formulario no coincide: #{pago_mensual}/#{precio_resp}")
        end
    end

    def verifico_costo_total_formulario(num_cuotas)
        texto = @costo_total_cae_form.text
        costo_total = texto[texto.index('Costo Total'),texto.index('|')].delete("Costo Total $").delete(".").to_i
        puts "#{costo_total}"
        precio = return_precio_menor
        url = "https://www.ripley.cl/wcs/resources/store/10151/simuladorcuotas/get_simuladorcuotas/DUMMYPARTNUMBER/#{@cuotas}/#{precio.to_s}"    
        response = JSON.parse(open(url).read)
        precio_resp = response["costoTotal"].delete(".")[0...-1].to_i

        if precio_resp == costo_total
            puts "El Costo Total del formulario coincide: #{costo_total}/#{precio_resp}"
        else
            $tools.fallo("El Costo Total del formulario no coincide: #{costo_total}/#{precio_resp}")
        end
    end

    def verifico_cae_formulario(num_cuotas)
        texto = @costo_total_cae_form.text
        cae_form = texto[texto.index('CAE'),texto.index('%')].delete("CAE").delete("%").delete(" ").to_f
        puts "#{cae_form}"
        precio = return_precio_menor
        url = "https://www.ripley.cl/wcs/resources/store/10151/simuladorcuotas/get_simuladorcuotas/DUMMYPARTNUMBER/#{@cuotas}/#{precio.to_s}"    
        response = JSON.parse(open(url).read)
        cae_resp = response["cae"][0...-1].to_f.round(2)
        if cae_resp == cae_form
            puts "El CAE del formulario coincide: #{cae_form}/#{cae_resp}"
        else
            $tools.fallo("El CAE del formulario no coincide: #{cae_form}/#{cae_resp}")
        end
    end

    def verificar_activacion_add_bag_button
        begin
            $tools.esperar_elemento @button_add_bolsa
        rescue
            $tools.fallo("No se visualiza boton Agregar a la bolsa")
        end
    end

    def clusterizacion_sku_txt
        f = File.open('features/data/data_sku_generate/sku_input.txt') 
        list_sku=[] # start with an empty array

        @sku_cluster_json = JSON.parse(File.read("./features/data/data_sku_generate/sku_cluster.json")) 

        list_sku.each do |item|
            puts item
            url = "#{$url}/#{item}"
            $tools.visitar_portal(url)
            $driver.cookies.add 'robot', 'true', path: '/', secure: true, domain: 'ripley.cl'
            verificar_disponibilidad
            capturar_datos_producto
            # clusterizacion por categorias
            # Agotado
            if $producto.get_data["agotado"] == true
                guardar_categoria("Agotado")
            else
                # Disponible
                if $producto.get_data["agotado"] == false
                    guardar_categoria("Disponible")
                end
                # Precios 
                precio = return_precio_menor 
                if precio < 50000
                    guardar_categoria("Precio Menor 50000")
                else
                    if precio <= 350000 
                        guardar_categoria("Precio Menor 350000")
                    elsif precio > 350000 
                        guardar_categoria("Precio Mayor 350000")
                    end
                end 
                # Precio Internet
                if $producto.get_data["precio_internet"] != ""
                    guardar_categoria("Internet")
                end
                #Precio Ripley
                if $producto.get_data["precio_ripley"] != ""
                    guardar_categoria("Ripley")
                end
                #Variaciones
                var_color =  @color_opcion_list.count
                var_talla = @talla_opcion_list.count
                if var_color == 0 && var_talla == 0
                    guardar_categoria("Sin Variaciones")
                else
                    guardar_categoria("Variaciones")
                end
                #EG
                if @opc_extragaranty.count == 0
                    guardar_categoria("Sin Extragarantia")
                else
                    guardar_categoria("Con Extragarantia")
                end
                #cuotas su
                geridas
                if @sugerencia_cuotas.present?
                    guardar_categoria("Cuotas Sugeridas")
                end
                #despacho domicilio
                despacho_disponible = $driver.element(xpath: '//span[@class="product-shipping-name" and contains(text(), "Despacho a Domicilio")]/following-sibling::span//span[@class="is-available" and contains(text(), "Disponible")]')
                if despacho_disponible.present?
                    guardar_categoria("Despacho a Domicilio")
                else
                    guardar_categoria("Sin Despacho a Domicilio")
                end
                #retiro en tienda
                retiro_disponible = $driver.element(xpath: '//span[@class="product-shipping-name" and contains(text(), "Retiro en Tiendas")]/following-sibling::span//span[@class="is-available" and contains(text(), "Disponible")]')
                if retiro_disponible.present?
                    guardar_categoria("Retiro en Tienda")
                else
                    guardar_categoria("Sin Retiro en Tienda")
                end
            end

            @sku_cluster_json.to_json
            File.open("./features/data/data_sku_generate/sku_cluster.json","w") do |f|
                f.write(JSON.pretty_generate(@sku_cluster_json))
            end
        end
    end

    def clusterizacion_sku_json
        json_sku = JSON.parse(File.read("./features/data/data_sku_generate/sku_input.json")) 
        categorias = json_sku[$pais][$ambiente].keys
        list_sku=[] # start with an empty array
        categorias.each do |categoria|
            items = json_sku[$pais][$ambiente][categoria]
            items.each do |i|
                if items.length != 0
                    list_sku.push i 
                end
            end
        end

        @sku_cluster_json = JSON.parse(File.read("./features/data/data_sku_generate/sku_cluster.json")) 

        list_sku.each do |item|
            puts item
            url = "#{$url}/#{item}"
            $tools.visitar_portal(url)
            $driver.cookies.add 'robot', 'true', path: '/', secure: true, domain: 'ripley.cl'
            verificar_disponibilidad
            capturar_datos_producto
            # clusterizacion por categorias
            # Agotado
            if $producto.get_data["agotado"] == true
                guardar_categoria("Agotado")
            else
                # Disponible
                if $producto.get_data["agotado"] == false
                    guardar_categoria("Disponible")
                end
                # Precios 
                precio = return_precio_menor 
                if precio < 50000
                    guardar_categoria("Precio Menor 50000")
                else
                    if precio <= 350000 
                        guardar_categoria("Precio Menor 350000")
                    elsif precio > 350000 
                        guardar_categoria("Precio Mayor 350000")
                    end
                end 
                # Precio Internet
                if $producto.get_data["precio_internet"] != ""
                    guardar_categoria("Internet")
                end
                #Precio Ripley
                if $producto.get_data["precio_ripley"] != ""
                    guardar_categoria("Ripley")
                end
                #Variaciones
                var_color =  @color_opcion_list.count
                var_talla = @talla_opcion_list.count
                if var_color == 0 && var_talla == 0
                    guardar_categoria("Sin Variaciones")
                else
                    guardar_categoria("Variaciones")
                end
                #EG
                if @opc_extragaranty.count == 0
                    guardar_categoria("Sin Extragarantia")
                else
                    guardar_categoria("Con Extragarantia")
                end
                #cuotas sugeridas
                if @sugerencia_cuotas.present?
                    guardar_categoria("Cuotas Sugeridas")
                end
                #despacho domicilio
                despacho_disponible = $driver.element(xpath: '//span[@class="product-shipping-name" and contains(text(), "Despacho a Domicilio")]/following-sibling::span//span[@class="is-available" and contains(text(), "Disponible")]')
                if despacho_disponible.present?
                    guardar_categoria("Despacho a Domicilio")
                else
                    guardar_categoria("Sin Despacho a Domicilio")
                end
                #retiro en tienda
                retiro_disponible = $driver.element(xpath: '//span[@class="product-shipping-name" and contains(text(), "Retiro en Tiendas")]/following-sibling::span//span[@class="is-available" and contains(text(), "Disponible")]')
                if retiro_disponible.present?
                    guardar_categoria("Retiro en Tienda")
                else
                    guardar_categoria("Sin Retiro en Tienda")
                end
            end

            @sku_cluster_json.to_json
            File.open("./features/data/data_sku_generate/sku_cluster.json","w") do |f|
                f.write(JSON.pretty_generate(@sku_cluster_json))
            end
        end
    end


    def verificar_imagen_producto
        sleep 5
        img_principal = $driver.element(xpath: '//li[@class="thumbnail-item is-active"]')
        $tools.esperar_elemento(img_principal)
        if img_principal.present?
            puts("Imagen encontrada: #{img_principal}")
        else
            $tools.fallo("No se encuentra la imagen en la pagina")
        end
    end

    
    def consultar_nombre_img_principal
        nombre_marca = $driver.element(xpath: '//li[@class="thumbnail-item is-active"]//img').attribute("alt")
        $nombre_primer_img = $driver.element(xpath: '//li[@class="thumbnail-item is-active"]//img[@alt="' + nombre_marca + '"]').attribute("src")
        puts "La url de la imagen es: #{$nombre_primer_img}"
        if $nombre_primer_img.blank?
            $tools.fallo("nombre no recuperado")
        else
            puts "nombre recuperado"
        end
    end


    def consultar_nombre_img_modificada
        nombre_marca = $driver.element(xpath: '//li[@class="thumbnail-item is-active"]//img').attribute("alt")
        $nombre_nueva_img = $driver.element(xpath: '//li[@class="thumbnail-item is-active"]//img[@alt="' + nombre_marca + '"]').attribute("src")
        puts "La url de la nueva imagen es: #{$nombre_nueva_img}"
        if $nombre_nueva_img != $nombre_primer_img
            puts "Imagen modificada correctamente"            
        else
            $tools.fallo("No se modifica imagen")            
        end
    end

    def guardar_categoria(categoria)
        puts "Producto #{categoria}"
        if  @sku_cluster_json[$pais][$ambiente][categoria].include?($producto.get_data["sku"])
            puts "SKU ya añadido"
        else
            cantidad = @sku_cluster_json[$pais][$ambiente][categoria].count
            @sku_cluster_json[$pais][$ambiente][categoria][cantidad] = $producto.get_data["sku"]
        end
    end

    def seleccionar_tab(nombreTab)
        sleep 4
        case nombreTab
        when "Especificaciones"
            $tools.esperar_elemento(@tabDescripcion)
            $estado_inicial_tab = $driver.element(css: "#tab-Especificaciones").attribute("aria-selected")
            $driver.execute_script("return arguments[0].click();", @tabEspecificiones) 
         end

        case nombreTab
            when "Comentarios"
                $tools.esperar_elemento(@tabDescripcion)
                $estado_inicial_tab = $driver.element(css: "#tab-Comentarios").attribute("aria-selected")
                cambiaTab = $driver.execute_script("return arguments[0].click();", @tabComentarios)
            end

        case nombreTab
            when "Garantía"
                $tools.esperar_elemento(@tabDescripcion)
                $estado_inicial_tab = $driver.element(css: "#tab-Garantía\\ Legal\\ y\\ del\\ Fabricante").attribute("aria-selected") 
                cambiaTab = $driver.execute_script("return arguments[0].click();", @tabGarantia)
            end
    end

    def verificar_cambio_tab_ficha_producto(nombreTab)
        case nombreTab
            when "Especificaciones"
                $tools.esperar_elemento(@tabEspecificiones)
                estado_final_tab = $driver.element(css: "#tab-Especificaciones").attribute("aria-selected")
                puts "El estado es: " + estado_final_tab
        end

        case nombreTab
            when "Comentarios"
                $tools.esperar_elemento(@tabComentarios)
                estado_final_tab = $driver.element(css: "#tab-Comentarios").attribute("aria-selected")
                puts "Es estado es: " + estado_final_tab
            end

        case nombreTab
            when "Garantía"
                $tools.esperar_elemento(@tabGarantia)
                estado_final_tab = $driver.element(css: "#tab-Garantía\\ Legal\\ y\\ del\\ Fabricante").attribute("aria-selected")
                puts "Es estado es: " + estado_final_tab
            end    

        if $estado_inicial_tab != estado_final_tab
            puts "moficada correctamente"        
        else 
            $tools.fallo("tab no cambiado")
        end             
    end


    def seleccionar_imagen_random_producto
        sleep 1
        img_disponible = $driver.elements(xpath: '//ul[@class="product-image-previews"]//li[@class="thumbnail-item"]/img')
        cant_img_prod = img_disponible.count
        random_num_img = rand 1..cant_img_prod
        if random_num_img != NIL && random_num_img != 0
            puts "El numero de la imagen seleccionada es: #{random_num_img}"
        end
        $tools.click(img_disponible[random_num_img])
    end

    def ver_realidad_aumentada
        sleep 3
        begin
            realidad_aumentada = $driver.element(xpath: '//button[@id="buttonX"]')
            if $mobile
                $driver.execute_script("arguments[0].click()", realidad_aumentada)
            else
                $tools.click(realidad_aumentada)
            end
        rescue
            $tools.fallo("Ha ocurrido un error")
        end
    end

    def validar_iframe_realidad_aumentada
        sleep 3
        begin
        iframe = $driver.element(xpath: '//div[@class="slideout slideout__stateful simple-modal augmented-reality-modal"]')
        if iframe.present?
            puts "se abre correctamente el iframe"
        end
        rescue
            $tools.fallo("No se pudo levantar el iframe")
        end
    end

end
