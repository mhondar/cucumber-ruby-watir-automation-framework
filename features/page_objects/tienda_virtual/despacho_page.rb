class DespachoPage
    def initialize
        selectors = JSON.parse(File.read("./features/selectors/despacho_selectors.json"))
        case $mobile 
        when true 
            @bt_continuar = $driver.element(xpath: selectors["mobile"]["bt_continuar"])
            @bolsa_compras = $driver.element(xpath: selectors["miga_pan"]["bolsa_mobile"])
        else
            @bt_continuar = $driver.element(xpath: selectors["side_bar"]["bt_continuar"])
            @bolsa_compras = $driver.element(xpath: selectors["miga_pan"]["bolsa"])
        end

        @loading_screen = $driver.element(xpath: selectors["loading_screen"])
        @loading_screen_2 = $driver.element(xpath: selectors["loading_screen_2"])
        @opcion_entrega = $driver.element(xpath: selectors["main_contain"]["opcion_entrega"])
        @lbl_cantidad_producto = $driver.element(xpath: selectors["side_bar"]["lbl_cantidad_producto"])
        @subtotal = $driver.element(xpath: selectors["side_bar"]["subtotal"])
        @despacho = $driver.element(xpath: selectors["side_bar"]["despacho"])
        @total_normal = $driver.element(xpath: selectors["side_bar"]["total_normal"])
        @total_tarjeta_ripley = $driver.element(xpath: selectors["side_bar"]["total_tarjeta_ripley"])
        @btn_modificar_compra = $driver.element(xpath: selectors["side_bar"]["btn_modificar_compra"])
        @btn_agregar_productos = $driver.element(xpath: selectors["side_bar"]["btn_agregar_productos"])
        @btn_cambiar_direccion = $driver.element(xpath: selectors["main_contain"]["btn_cambiar_direccion"])
        # crear direccion
        @nueva_direccion = $driver.element(xpath: selectors["direcciones"]["nueva_direccion"])
        @aplicar_guardar = $driver.element(xpath: selectors["direcciones"]["aplicar_guardar"])
        @input_calle = $driver.element(xpath: selectors["crear_direccion"]["input_calle"])
        @input_numero = $driver.element(xpath: selectors["crear_direccion"]["input_numero"])
        @input_dpto = $driver.element(xpath: selectors["crear_direccion"]["input_dpto"])
        @select_region = $driver.select_list(xpath: selectors["crear_direccion"]["select_region"])
        @select_comuna = $driver.select_list(xpath: selectors["crear_direccion"]["select_comuna"])
        @select_codfijo = $driver.select_list(xpath: selectors["crear_direccion"]["select_codfijo"])
        @input_telefono = $driver.element(xpath: selectors["crear_direccion"]["input_telefono"])
        @input_celular = $driver.element(xpath: selectors["crear_direccion"]["input_celular"])
        @id_dir_nueva = $driver.element(xpath: selectors["crear_direccion"]["id_dir_nueva"])
        @btn_crear_dir = $driver.element(xpath: selectors["crear_direccion"]["btn_crear_dir"])
        # crear direccion nueva
        @input_direccion = $driver.text_field(xpath: selectors["crear_direccion_nueva"]["input_direccion"])
        @input_departamento = $driver.text_field(xpath: selectors["crear_direccion_nueva"]["input_departamento"])
        @select_cod_telef_fijo = $driver.select_list(xpath: selectors["crear_direccion_nueva"]["select_cod_telef_fijo"])
        @input_telefono_fijo = $driver.text_field(xpath: selectors["crear_direccion_nueva"]["input_telefono_fijo"])
        @input_celular_nuevo = $driver.text_field(xpath: selectors["crear_direccion_nueva"]["input_celular_nuevo"])
        # modificar direccion
        @list_selector_direcciones = $driver.elements(xpath: selectors["direcciones"]["list_selector_direcciones"])
        @btn_modificar_principal = $driver.element(xpath: selectors["direcciones"]["btn_modificar_principal"])
        @btn_modificar_dir = $driver.element(xpath: selectors["direcciones"]["btn_modificar_dir"])
        # opciones entrega
        @list_opciones = $driver.elements(xpath: selectors["opciones_entrega"]["list_opciones"])
        @mas_opciones = $driver.element(xpath: selectors["opciones_entrega"]["mas_opciones"])
        @dia_despacho = $driver.select_list(xpath: selectors["opciones_entrega"]["dia_despacho"])
        @jornada_costo = $driver.select_list(xpath: selectors["opciones_entrega"]["jornada_costo"])
        # opciones de entrega nueva
        @caja_box_entrega = $driver.element(xpath: selectors["opciones_entrega_nueva"]["caja_box_entrega"])
        #no despacho
        @msg_no_despacho = $driver.element(xpath: selectors["msg_no_despacho"])
        # retiro en tienda
        @select_zona = $driver.select_list(xpath: selectors["retiro_en_tienda"]["select_zona"])
        @rut_tercero = $driver.text_field(xpath: selectors["confirmacion_retiro"]["un_tercero"]["rut"])
        @nombre_tercero = $driver.text_field(xpath: selectors["confirmacion_retiro"]["un_tercero"]["nombre"])
        @confirmar_continuar = $driver.button(xpath: selectors["confirmacion_retiro"]["confirmar_continuar"])
        @celular = $driver.text_field(xpath: selectors["confirmacion_retiro"]["celular"])
        @selecionar_otra_tienda = $driver.element(xpath: selectors["retiro_en_tienda"]["selecionar_otra_tienda"])
        #miga pan        
        @error_mensage = $driver.element(xpath: selectors["error_mensage"])
        @error_agenda = $driver.element(xpath: selectors["error_agenda"])
    end

    def verificar_despacho_cargado
        begin
            esperar_end_loading
            esperar_end_loading_2
            $tools.esperar_elemento(@bt_continuar)
            if @error_mensage.present?
                $tools.fallo("Mensaje de Error: #{ @error_mensage.text}")
            end
            $tools.salvar_pantalla("Despacho", "features/screenshots/despacho/")
        rescue 
            if @msg_no_despacho.present?
                puts "Esta direccion no tiene despacho"
            else
                begin
                    $tools.esperar_elemento(@select_zona)
                    puts "Retiro en tienda por defecto"
                rescue
                    puts "Caso no mapeado"
                    $tools.fallo("Problemas al cargar el despacho")
                end
            end
        end
    end

    def esperar_end_loading
        timeout = 0
        while(@loading_screen.present? && (timeout < 60))
            sleep 2
            timeout += 1
        end
    end

    def esperar_end_loading_2
        timeout = 0
        while(@loading_screen_2.present? && (timeout < 60))
            sleep 2
            timeout += 1
        end
    end

    def esperar_mensaje_error
        timeout = 0
        while(@error_mensage.present? && (timeout < 60))
            sleep 2
            timeout += 1
        end
    end

    def verificar_despacho_new_dir_cargado
        btnADomicilio = $driver.element(xpath: '//div[@class="ShippingTypeItem_info__LesyW"]//span[contains(text(), "A domicilio")]')
        $tools.click(btnADomicilio)
        $tools.esperar_elemento(@btn_crear_dir)
    end

    def seleccionar_otra_direccion
        esperar_end_loading
        sleep 3
        $tools.click(@btn_cambiar_direccion)  
        cant = @list_selector_direcciones.count
        if cant >= 2
            direccion_seleccionada = rand(1...cant)
            $tools.click(@list_selector_direcciones[direccion_seleccionada])
        else
            $tools.fallo("Este dato solo contiene una direccion")
            # completar_formulario_nueva_direccion("Disponible")
        end
        $tools.click(@aplicar_guardar)
    end

    def crear_direccion_despacho(despacho)
        completar_formulario_direccion_nueva(despacho)
        if $mobile
            $driver.send_keys :tab
            $driver.send_keys :enter
        else
            $tools.click(@btn_crear_dir) 
        end
        sleep 4
        esperar_end_loading
    end

    def crear_direccion_despacho_nueva(despacho)
        direcciones = JSON.parse(File.read("./features/data/direcciones.json"))
        begin
            $tools.esperar_elemento(@input_direccion)
        rescue
            $tools.fallo("Formulario de Crear dirección esperado no se muestra")
        end
        
        $tools.insertar_texto(@input_direccion, direcciones[despacho]["Direccion"])
        sleep 2
        $driver.send_keys :enter
        sleep 2
        $tools.insertar_texto(@input_departamento, direcciones[despacho]["Dpto"])
        if @select_cod_telef_fijo.present?
            $tools.seleccionar_random_select_opcion(@select_cod_telef_fijo)
        else
            puts "No se muestra elemento de codigo de telefono fijo"
        end
        if @input_telefono_fijo.present?
            $tools.insertar_texto(@input_telefono_fijo, rand.to_s[2..11])
        else
            puts "No se muestra elemento de ingresar telefono fijo"
        end
        $tools.insertar_texto(@input_celular_nuevo, rand.to_s[2..11])
        sleep 2
      
        $tools.click(@btn_crear_dir) 
        sleep 4
        esperar_end_loading
    end

    def agregar_nueva_direccion(despacho)
        $tools.click(@btn_cambiar_direccion)
        completar_formulario_nueva_direccion(despacho)
    end

    def completar_formulario_nueva_direccion(despacho)
        $tools.click(@nueva_direccion)
        datos = completar_formulario_direccion_nueva(despacho)
        $tools.insertar_texto(@id_dir_nueva, datos["comuna"])
        sleep 2
        $tools.click(@btn_crear_dir)
        esperar_end_loading 
        sleep 2
        seleccionar_direccion(datos["comuna"])
        esperar_end_loading
    end

    def seleccionar_direccion(nombre)
        direccion = $driver.element(xpath: '//div[starts-with(@class, "AddressSelector_address")]//label[starts-with(@class, "RadioButton_label")]/strong[contains(text(), "' + nombre + '")]')
        $tools.click(direccion)
        $tools.click(@aplicar_guardar)
    end

    def modificar_direccion_principal(despacho)
        $tools.click(@btn_cambiar_direccion)
        $tools.click(@btn_modificar_principal)
        cambiar_formulario_direccion_existente(despacho)
        $tools.click(@btn_modificar_dir)
        $tools.click(@aplicar_guardar)
    end

    def cambiar_formulario_direccion_existente(despacho)
        direccion = Direccion.new
        datos_direccion = direccion.generar_direccion(despacho)
        $tools.clear_and_inserta_texto(@input_calle, datos_direccion["calle"])
        $tools.clear_and_inserta_texto(@input_numero, datos_direccion["numero"])
        $tools.clear_and_inserta_texto(@input_dpto, datos_direccion["dpto"])
        $tools.seleccionar_value(@select_region, datos_direccion["region"])
        $tools.seleccionar_opcion(@select_comuna, datos_direccion["comuna"])
        $tools.seleccionar_random_select_opcion(@select_codfijo)
        $tools.clear_and_inserta_texto(@input_telefono, datos_direccion["telef_fijo"])
        $tools.clear_and_inserta_texto(@input_celular, datos_direccion["celular"])
        $tools.salvar_pantalla("Despacho", "features/screenshots/despacho/")
    end

    def completar_formulario_direccion_nueva(despacho)
        direccion = Direccion.new
        datos_direccion = direccion.generar_direccion(despacho)
        $tools.insertar_texto(@input_calle, datos_direccion["calle"])
        $tools.insertar_texto(@input_numero, datos_direccion["numero"])
        $tools.insertar_texto(@input_dpto, datos_direccion["dpto"])
        if $mobile
            $driver.send_keys :tab
            $driver.send_keys :tab
            $driver.send_keys :tab
            $driver.send_keys :tab
            $driver.send_keys :tab
        end
        $tools.seleccionar_value(@select_region, datos_direccion["region"])
        $tools.seleccionar_opcion(@select_comuna, datos_direccion["comuna"])
        $tools.seleccionar_random_select_opcion(@select_codfijo)
        $tools.insertar_texto(@input_telefono, datos_direccion["telef_fijo"])
        $tools.insertar_texto(@input_celular, datos_direccion["celular"])
        $tools.salvar_pantalla("Despacho", "features/screenshots/despacho/")
        return datos_direccion 
    end

    def seleccionar_otra_opcion_entrega

        case $producto.get_data["es_mkp"] 
        when true

            puts "Encontró más opciones."
            $tools.esperar_elemento(@mas_opciones)
            puts @list_opciones.count.to_s
            x = rand(1..2)
            $tools.click(@list_opciones[x])
            
        when false
            $tools.esperar_elemento(@caja_box_entrega)
            cantidad_opciones = $driver.elements(xpath: '//div[starts-with(@class, "ShippingSchedulesSelect_box_")]').count
            if cantidad_opciones > 1
                seleccion = $driver.element(xpath: '//div[starts-with(@class, "ShippingSchedulesSelect_box")][2]')
                $tools.click(seleccion)
            else
                puts "La lista de opciones de entrega solo tiene #{cantidad_opciones} elementos"
            end
           
        end
    end

    def seleccionar_mas_opciones_entrega
        esperar_end_loading
        sleep 2
        begin
            $tools.click(@mas_opciones)
            $tools.seleccionar_random_select_opcion(@dia_despacho)
            $tools.seleccionar_random_select_opcion(@jornada_costo)
        rescue
            if @msg_no_despacho.present?
                puts "Esta direccion no tiene despacho, se agregara una direccion valida y sera seleccionada"
                agregar_nueva_direccion("Disponible")
            else
                puts "Caso no mapeado seleccionar mas opciones de entrega despacho"
            end
        end
    end

    def verificar_concistencia_precios
       puts "Subtotal: #{@subtotal.text}" 
       puts "Producto precio Internet: #{$producto.get_data["precio_internet"]}"
       
       if @subtotal.text != $producto.get_data["precio_internet"]
            puts("Error de datos de precios, el subtotal debe ser #{$producto.get_data["precio_internet"]} y se muestra #{@subtotal.text}")
       else
            puts "Precios del producto son consistentes"
       end
    end

    def verificar_total_compra
        puts "Despacho: #{@despacho.text}" 
        puts "Subtotal: #{@subtotal.text}" 
        puts "Total: #{@total_normal.text}" 
        total = @subtotal.text.to_i + @despacho.text.to_i
        if total != @total_normal.text.to_i
            $tools.fallo("La suma del precio con el despacho debe ser #{total} y se muestra #{@total_normal.text}")
        else
            puts("El precio total #{total} es correcto")
        end
    end

    def seleccionar_tipo_despacho(despacho)
        tipo_despacho = $driver.element(xpath: '//div[starts-with(@class, "ShippingTypeSelector_selector")]//div[starts-with(@class, "ShippingTypeItem_info")]/span[contains(text(), "' + despacho + '")]')
        $tools.click(tipo_despacho)
        case despacho
        when "Retiro en tienda"
            puts "CONTINUAR"
        when "A domicilio"
            $tools.esperar_elemento(@opcion_entrega)
            $producto.set_despacho(@despacho.text)
        end
    end

    def seleccionar_zona(retiro)
        sku_list = JSON.parse(File.read("./features/data/rt_regiones_comunas.json"))
        zona = sku_list[retiro].keys.shuffle.first
        $tools.seleccionar_opcion(@select_zona,zona)
        esperar_end_loading
    end

    def validar_tiendas(criterio)
        case criterio
        when "Disponible"
            clase = 'PhysicalStores_availableColumn'
        when "No Disponible"
            clase = 'PhysicalStores_unavailableColumn'
        when "Pendientes Disponibles"
            clase = 'PhysicalStores_someAvailable'
        end
        $driver.element(xpath: '//div[starts-with(@class, "PhysicalStores_row")]').wait_until(&:present?)
        tiendas = $driver.elements(xpath: '//div[starts-with(@class, "PhysicalStores_row")]//div[starts-with(@class, "' + clase + '")]').count
        if tiendas > 0
            puts "Se muestran #{tiendas} tiendas #{criterio}"
        else
            $tools.fallo "No se muestran tiendas #{criterio}"
        end
    end

    def seleccionar_tienda_criterio(criterio)
        case criterio
        when "Disponible" 
            clase = 'PhysicalStores_availableColumn'
        when "Pendientes Disponibles" 
            clase = 'PhysicalStores_someAvailable'
        end
        cant = $driver.elements(xpath: '//div[starts-with(@class, "PhysicalStores_row")]//div[starts-with(@class, "' + clase + '")]').count
        puts "Cantidad es: #{cant}"
        numero = 1
        tienda = $driver.element(xpath: '//div[starts-with(@class, "PhysicalStores_row")][' + numero.to_s + ']//div[starts-with(@class, "' + clase + '")]/following-sibling::div')
        @sucursal = $driver.element(xpath: '//div[starts-with(@class, "PhysicalStores_row")][' + numero.to_s + ']//div[starts-with(@class, "' + clase + '")]/preceding-sibling::div//h4').text
        puts "Seleccionada #{@sucursal}"
        $tools.click tienda
        esperar_end_loading
        alert_error = $driver.element(xpath: '//div[starts-with(@class, "alert_error")]')
        while numero <= cant
            if alert_error.present?
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
            $tools.fallo 'Ninguna Tienda estaba disponible para ser seleccionada'
        end
    end

    def validar_tienda_seleccionada
        tienda_confirmada = $driver.element(xpath: '//div[starts-with(@class, "PickupConfirmation_storeInformation")]/h5')
        $tools.esperar_elemento tienda_confirmada
        if tienda_confirmada.text == @sucursal
            puts "La tienda quedo seleccionada #{@sucursal}"
        else
            $tools.fallo "La tienda mostrada #{tienda_confirmada.text} no es la misma que la tienda seleccionada #{@sucursal}"
        end

    end

    def click_seleccionar_otra_tienda(criterio)
        $tools.click @selecionar_otra_tienda
        esperar_end_loading
        seleccionar_tienda_criterio(criterio)
        esperar_end_loading
    end

    def seleccionar_tienda(retiro)
        case retiro
        when "Disponible"
            zona = 20
            count = 1
            until zona == 0 do
                    $tools.seleccionar_value(@select_zona, zona.to_s)
                    sleep 3
                    tienda_seleccionada = $driver.element(xpath: '//div[starts-with(@class, "PhysicalStores_row")][1]//div[starts-with(@class, "PhysicalStores_availableColumn")]//div[starts-with(@class, "PhysicalStores_allAvailable")]/parent::div/parent::div/following-sibling::div/button')
                    if tienda_seleccionada.present? 
                        puts "Tienda Disponible encontrada"
                        zona = 0
                    elsif count <= 4
                        puts "Tienda Disponible no encontrada se seleccionara otra zona"
                        zona +=1
                        count += 1
                    end
            end
            if $mobile
                $driver.send_keys :down
                $driver.send_keys :down
                $driver.send_keys :down 
            end
            $tools.click(tienda_seleccionada)
            esperar_end_loading
            sleep 3
        when "1 de 2 disponibles"
            $tools.seleccionar_value(@select_zona, "20")
            tienda_seleccionada = $driver.element(xpath: '//div[starts-with(@class, "PhysicalStores_row")]//div[starts-with(@class, "PhysicalStores_availableColumn")]//div[starts-with(@class, "PhysicalStores_someAvailable")]/parent::div/parent::div/following-sibling::div/button')
            $tools.click(tienda_seleccionada)
            esperar_end_loading
            sleep 3
        end
    end

    def indicar_quien_retira(retiro)
        quien_retira = $driver.element(xpath: '//p[contains(text(), "' + retiro + '")]/parent::label')
        $tools.click(quien_retira)
        if retiro == "Un tercero"
            persona = Persona.new
            datos_persona = persona.generar_persona
            $tools.insertar_texto(@rut_tercero, datos_persona["rut"])
            $tools.insertar_texto(@nombre_tercero, (datos_persona["rut"] + " " +  datos_persona["apellido"]))
            $tools.clear_and_inserta_texto(@celular, datos_persona["celular"])
        end
        $tools.clear_and_inserta_texto(@celular, "944590547")
        $tools.click(@confirmar_continuar)
    end

    def click_continuar
        sleep 8
        esperar_end_loading
        esperar_end_loading_2
        capturar_datos_despacho
        html_pre = $driver.html
        $tools.salvar_pantalla("Despacho", "features/screenshots/despacho/")
        $tools.click(@bt_continuar)
        esperar_end_loading
        html_post = $driver.html
        while html_pre == html_post
            puts "No se hizo click en Continuar, se reintentara despacho"
            $tools.click(@bt_continuar)
            esperar_end_loading
            html_post = $driver.html
        end
    end

    def capturar_datos_despacho
        begin
            tipo = $driver.element(xpath: '//div[starts-with(@class, "ShippingTypeItem_itemActive")]//span').text
            puts "Tipo de Despacho: #{tipo}"
            
            if $ambiente != "prd" && $producto.get_data["es_mkp"] == false
                if tipo == "A domicilio"
                        direccion_element = $driver.element(xpath: '//p[starts-with(@class, "ShippingAddress_address")]')
                        fecha = $driver.element(xpath: '//strong[starts-with(@class, "ShippingSchedulesSelect_date")]').text.split
                        costo = $driver.element(xpath: '//div[starts-with(@class, "ShippingSchedulesSelect_active")]//div[2]').text
                        horario = $driver.element(xpath: '//div[starts-with(@class, "ShippingSchedulesSelect_active")]//strong').text
                elsif tipo == "Retiro en tienda"
                    direccion_element = $driver.element(xpath: '//div[starts-with(@class, "PickupConfirmation_storeInformation")]/h5/following-sibling::p')
                    fecha = $driver.element(xpath: '//div[starts-with(@class, "PickupConfirmation_textRight")]/h5[contains(text(), "Fecha estimada")]/following-sibling::div//strong').text.split
                    horario = $driver.element(xpath: '//div[starts-with(@class, "PickupConfirmation_textRight")]/h5[contains(text(), "Horario")]/following-sibling::div//strong').text
                    costo = $driver.element(xpath: '//div[starts-with(@class, "PickupConfirmation_textRight")]/h5[contains(text(), "Costo")]/following-sibling::div//strong').text
                else
                    $tools.fallo("Tipo de Despacho No Mapeado")
                end
                puts "Fecha de Despacho: #{fecha}"
                if (fecha[0]== "Mañana" || fecha[0]== "Hoy")
                    dia = fecha[2]
                    mes = fecha[4]
                else
                    dia = fecha[1]
                    mes = fecha[3]
                end
                if direccion_element.present?
                    if tipo == "A domicilio"
                        direccion = direccion_element.text
                    elsif tipo == "Retiro en tienda"
                        direccion = $driver.element(xpath: '//div[starts-with(@class, "PickupConfirmation_storeInformation")]/h5').text + " " + $driver.element(xpath: '//div[starts-with(@class, "PickupConfirmation_storeInformation")]/h5/following-sibling::p').text
                    else 
                        $tools.fallo("Tipo de Despacho no Mapeado")
                    end
                    puts "Direccion de Despacho: #{direccion}"
                end
                puts "Dia de Despacho: #{dia}"
                puts "Mes de Despacho: #{mes}"
                puts "Horario de Despacho: #{horario}"
                puts "Costo de Despacho: #{costo}"
            elsif $ambiente == "prd" || $producto.get_data["es_mkp"] == true
                costo_element = $driver.element(xpath: '//div[starts-with(@class, "ShippingGroup_radioDateCost")]')
                if costo_element.present?
                    costo = costo_element.text
                    puts "Costo de Despacho: #{costo}"
                end
            end
            $despacho = Despacho.new(tipo, direccion, dia, mes, horario, costo)
        rescue
            if @error_agenda.present?
                $tools.fallo("Página de Despacho no muestra disponibilidad de agenda")
            else
                $tools.fallo("Caso no mapeado")
            end
        end
    end

    def verificar_productos_despacho
        esperar_end_loading
        sleep 5

        if $mobile
            mostrar_productos = $driver.element(xpath: '//div[@class="Cart_itemsToggle__NfXSn Cart_collapse__3i7aO"]')
            # $tools.click(mostrar_productos)
            $driver.execute_script("arguments[0].click();", mostrar_productos)
        end

        $lista_productos.each do |i|
            cantidad_producto_despacho = $driver.elements(xpath: '//div[@class="ShoppingItem_shoppingItem__1I82H" and @data-sku="' + i.get_data["sku"].delete("P") + '"]').count
            if cantidad_producto_despacho == 1
                puts "Se muestra producto #{i.get_data["nombre"]}"
            elsif cantidad_producto_despacho == 0
                $tools.fallo("No se muestra en pagina de despacho el producto #{i.get_data["nombre"]}")
            else
                cantidad_producto_lista = $tools.get_cantidad_elemento(i.get_data["sku"].delete("P"))
                puts "Cantidad de productos en lista #{cantidad_producto_lista}"
                if cantidad_producto_despacho == cantidad_producto_lista
                    puts "Se muestran #{cantidad_producto_lista} productos de #{i.get_data["nombre"]}"
                else
                    $tools.fallo("En lista hay #{cantidad_producto_lista} mientras que en despacho hay #{cantidad_producto_despacho}")
                end
            end
        end
    end

    def verifico_cupon_descuento_aplicado

    end

    def click_modificar_compra
        esperar_end_loading
        $tools.click @btn_modificar_compra
    end

    def click_agregar_productos
        esperar_end_loading
        $tools.click @btn_agregar_productos
    end

    def verifico_cantidad_despacho
        if $producto.get_data["cantidad"].to_i == @lbl_cantidad_producto.text.to_i
            puts "Debe haber #{$producto.get_data["cantidad"]} del producto #{$producto.get_data["nombre"]} y se muestran #{@lbl_cantidad_producto.text} en la bolsa"
        else
            $tools.fallo "Debe haber #{$producto.get_data["cantidad"]} del producto #{$producto.get_data["nombre"]} y se muestran #{@lbl_cantidad_producto.text} en despacho"
        end
    end

    def verifico_variacion_caja_precio(variacion)
        puts $producto.get_data[variacion]
        puts $driver.element(xpath: '//span[starts-with(@class, "ShoppingItem_attributes") and contains(text(), "Talla")]').text
        case variacion
        when "talla" 
            var_element = $driver.element(xpath: '//span[starts-with(@class, "ShoppingItem_attributes") and contains(text(), "Talla")]').text
            puts var_element
            puts "TALLA " + $producto.get_data[variacion]
            if var_element == "TALLA " + $producto.get_data[variacion]
                puts "Correcta la #{variacion} del producto en despacho"
            else
                $tools.fallo "Incorrecta la #{variacion} del producto en despacho que que muestra #{var_element}"
            end
        when "color" 
            var_element = $driver.element(xpath: '//span[starts-with(@class, "ShoppingItem_attributes") and contains(text(), "' + $producto.get_data[variacion] + '")]')
            $tools.esperar_elemento(var_element)
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
            puts "Correcto el precio unidad del producto en Despacho"
        else
            $tools.fallo "El precio #{precio} mostrado en Despacho debe ser #{precio_producto} y se muestra #{precio_unidad}"
        end
    end

    def verifico_subtotal_caja_precio
        subtotal = 0

        # cantidad incluidos
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
        # cantidad excluidos
        item = 1
        while item <= cantidad_productos_excluidos
            cantidad_item = $driver.element(xpath: '//div[starts-with(@class, "ExcludedItems_excludedItems")][' + item.to_s + ']//div[starts-with(@class, "ShoppingItem_quantity")]').text.to_i
            puts "Cantidad del item #{item} es #{cantidad_item}"
            precio_normal = $driver.element(xpath: '//div[starts-with(@class, "ExcludedItems_excludedItems")][' + item.to_s + ']//div[starts-with(@class, "ShoppingItem_quantity")]/following-sibling::div[starts-with(@class, "ShoppingItem_info")]/div/span[starts-with(@class, "ShoppingItem_value")][1]').text.delete('$').delete('.').to_i
            puts "Precio normal del item #{item} es #{precio_normal}"
            subtotal = subtotal + (cantidad_item * precio_normal)
            puts "Subtotal de la compra es: #{subtotal}"
            item += 1
        end

        subtotal_mostrado = @subtotal.text.delete('$').delete('.').to_i
        if subtotal == subtotal_mostrado
            puts "Correcto el subtotal de despacho"
        else
            $tools.fallo "Incorrecto el subtotal en despacho se muestra #{subtotal_mostrado} de #{subtotal} calculado"
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
            puts "Correcto el Total Normal de Despacho"
        else
            $tools.fallo "Error en Total Normal debe ser #{total_normal_calculado} y se muestra #{total_normal_mostrado}"
        end
    end

    def verifico_total_ripley_caja_precio
        subtotal = 0
        #items incluidos
        cantidad_productos = $driver.elements(xpath: '//div[starts-with(@class, "ShoppingItem_shoppingItem_")]').count
        cantidad_productos_excluidos = $driver.elements(xpath: '//div[starts-with(@class, "ExcludedItems_excludedItems")]').count
        cantidad_productos_incluidos = cantidad_productos - cantidad_productos_excluidos
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

        #item excluidos
        item = 1
        while item <= cantidad_productos_excluidos
            cantidad_item = $driver.element(xpath: '//div[starts-with(@class, "ExcludedItems_excludedItems")][' + item.to_s + ']//div[starts-with(@class, "ShoppingItem_quantity")]').text.to_i
            puts "Cantidad del item #{item} es #{cantidad_item}"
            precio_normal = $driver.element(xpath: '//div[starts-with(@class, "ExcludedItems_excludedItems")][' + item.to_s + ']//div[starts-with(@class, "ShoppingItem_quantity")]/following-sibling::div[starts-with(@class, "ShoppingItem_info")]/div/span[starts-with(@class, "ShoppingItem_value")][1]').text.delete('$').delete('.').to_i
            puts "Precio normal del item #{item} es #{precio_normal}"
            precio_ripley = $driver.element(xpath: '//div[starts-with(@class, "ExcludedItems_excludedItems")][' + item.to_s + ']//div[starts-with(@class, "ShoppingItem_quantity")]/following-sibling::div[starts-with(@class, "ShoppingItem_info")]/div/span[starts-with(@class, "ShoppingItem_value")][2]')
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
            $tools.fallo 'No se muestra Total Tarjeta Ripley'
        end

        if total_tarjeta_ripley == total_tarjeta_ripley_mostrado
            puts "Correcto el Total Tarjeta Ripley de Despacho"
        else
            $tools.fallo "Error en Total tarjeta Ripley debe ser #{total_tarjeta_ripley} y se muestra #{total_tarjeta_ripley_mostrado}"
        end
    end

    def verifico_despacho_caja_precio
        begin
            $tools.esperar_elemento @despacho
            puts "Despacho de la compra #{@despacho.text} visible"
        rescue
            $tools.fallo 'No se encuentra el valor del despacho '
        end
        # puts descuento_mostrado

        # puts "Request"
        # url = 'https://preprod-ibmcloud.ripley.cl/wcs/resources/store/10151/person/@self'
        # $tools.visitar_portal(url)
        # address_id = $driver.element(xpath: '//tr[@id="/addressId"]//td[@class="treeValueCell stringCell"]//span[@class="objectBox objectBox-string"]').wait_until(&:present?).text.delete('"')

        # productos = ""

        # $lista_productos.each do |i|
        #     sku = i.get_data["sku"]
        #     puts sku
        #     if productos == ""
        #         productos = sku 
        #     else
        #         productos = productos + "," + sku
        #     end
        # end
        # puts productos
        
        # url2 = 'https://preprod-ibmcloud.ripley.cl/wcs/resources/store/10151/cart/@self/ext/shipping_info/delivery_availability/' + address_id + '?partNumbers=' + productos
        # response = JSON.parse(open(url).read)
        # puts response

        # sleep 20
    end

    def click_bolsa_compras
        esperar_end_loading
        esperar_end_loading_2
        esperar_mensaje_error
        sleep 3
        $tools.click @bolsa_compras
    end

   
end