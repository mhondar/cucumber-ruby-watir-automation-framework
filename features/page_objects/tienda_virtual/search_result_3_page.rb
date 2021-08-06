require './features/page_objects/tienda_virtual/search_result_comun_page.rb'
class SearchResult3Page < SearchResultComunPage
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/search_result_selectors.json"))
        @btn_filtrar = $driver.button(xpath: @selectors["result_3"]["btn_filtrar"])
        @result_msg_catalog = $driver.element(xpath: @selectors["comun"]["result_msg_catalogo"])
        @btn_quickview_close = $driver.button(xpath: @selectors["quickview"]["btn_cerrar"])
        @btn_pagina_siguiente_sup_deshabilitada = $driver.element(xpath: @selectors["result_3"]["btn_pagina_siguiente_sup_deshabilitada"])
        @btn_pagina_siguiente_sup_habilitada = $driver.element(xpath: @selectors["result_3"]["btn_pagina_siguiente_sup_habilitada"])
        @btn_pagina_siguiente_inf_deshabilitada = $driver.element(xpath: @selectors["result_3"]["btn_pagina_siguiente_inf_deshabilitada"])
        @btn_pagina_siguiente_inf_habilitada = $driver.element(xpath: @selectors["result_3"]["btn_pagina_siguiente_inf_habilitada"])
        @mas_detalles = $driver.element(xpath: @selectors["quickview"]["mas_detalles"])
        @limpiar_filtros = $driver.element(xpath: @selectors["result_3"]["limpiar_filtros"])
        @sel_ordenar = $driver.select_list(xpath: @selectors["result_3"]["sel_ordenar"])
        @btn_menos = $driver.element(xpath: @selectors["quickview"]["btn_menos"])
        @btn_mas = $driver.element(xpath: @selectors["quickview"]["btn_mas"])
        @lbl_cantidad = $driver.element(xpath: @selectors["quickview"]["lbl_cantidad"])
        @btn_seleciona_opciones = $driver.button(xpath: @selectors["quickview"]["btn_seleciona_opciones"])
        @color_opcion_list = $driver.elements(xpath: @selectors["quickview"]["color_opcion_list"])
        @talla_opcion_list = $driver.elements(xpath: @selectors["quickview"]["talla_opcion_list"])
        @btn_add_bolsa = $driver.button(xpath: @selectors["quickview"]["btn_add_bolsa"])
        @aceptar_cookies = $driver.element(xpath: @selectors["aceptar_cookie"])
        @btn_aplicar_filtro = $driver.element(xpath: @selectors["result_3"]["btn_aplicar_filtro"])
    end

    def click_aplicar_filtro
        $tools.esperar_elemento(@btn_aplicar_filtro)
        $tools.click(@btn_aplicar_filtro)  
    end

    def click_filtrar
        sleep 5
        $tools.esperar_elemento(@btn_filtrar)
        if (@btn_filtrar.present?)
            $tools.click(@btn_filtrar)    
        else
            puts "No se encuentra elemento"
        end
        sleep 1
    end

    def filtrar_categoria_hija(categoria)
        seleccion = $driver.element(xpath: '//div[@class="catalog-filters-child-categories"]//a[contains(text(), "' + categoria + '")]')
        $tools.click(seleccion)
    end

    def realizo_filtro_faceta(filtro, faceta)
        marca = $driver.element(xpath: '//h5[contains(text(), "Marca")]')
        precio = $driver.element(xpath: '//h5[contains(text(), "Precio")]')
        $tools.click(marca)
        $tools.click(precio)

        filtro_selected = ""
        case filtro
        when "random"
            filtrar_faceta(faceta)
        else
            if faceta == "Random"
                cant_facetas = $driver.elements(xpath: '//section[@class="catalog-facets"]//section').count
                random_num = rand(1..cant_facetas)
                @faceta = $driver.element(xpath: '//section[@class="catalog-facets"]//section[' + random_num.to_s + ']/h5').text
                puts "Faceta seleccionada Random es #{@faceta}"
            else
                @faceta = faceta
            end
            
            section_faceta = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]/parent::section')
            if section_faceta.attribute_value("class") == "is-collapsed catalog-facet"
                pre_select = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]')
                $tools.click(pre_select)
            end
 
            lista_filtros = $driver.elements(xpath: '//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li')
            cantidad_filtros = lista_filtros.count
            puts "Cantidad de filtros de #{@faceta} es #{cantidad_filtros}"
            pivot = 1
            while pivot <= cantidad_filtros
                puts "Numero de #{@faceta} seleccionada #{pivot}"
    
                @filtro_name = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + pivot.to_s + ']/div').title
                puts "Nombre de la #{@faceta} seleccionada: #{@filtro_name}"

                if @filtro_name == filtro
                    filtro_selected = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + pivot.to_s + ']')
                    @filtro_count = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + pivot.to_s + ']//span[@class="badge-count"]').text
                    puts "Cantidad de productos con esta #{@faceta}: #{@filtro_count}"
                    break
                else
                    pivot += 1
                end
            end
            if filtro_selected != ""    
                $tools.click(filtro_selected)
                sleep 3
                # if (@btn_aplicar_filtro.present?)
                #     $tools.click(@btn_aplicar_filtro)    
                # else
                #     puts "No se encuentra aplicar filtro"
                # end
                # sleep 2
                click_aplicar_filtro
                timeout = 0
                while(filtro_selected.present? && (timeout < 60))
                    puts "Pagina cargando"
                    timeout += 1
                    sleep 2
                end
                puts "Realizado el filtro"
            else
                $tools.fallo "No existe el filtro #{filtro} en la #{faceta} indicada"
            end
        end
    end

    def filtrar_faceta(faceta)
        $driver.execute_script "document.body.style['-webkit-transform'] = \"scale(0.5)\";"
        $driver.send_keys :down
        $driver.send_keys :down
        $driver.send_keys :down
        marca = $driver.element(xpath: '//h5[contains(text(), "Marca")]')
        precio = $driver.element(xpath: '//h5[contains(text(), "Precio")]')
        $tools.click(marca)
        $tools.click(precio)
        if faceta == "Random"
            cant_facetas = $driver.elements(xpath: '//section[@class="catalog-facets"]//section').count
            random_num = rand(1..cant_facetas)
            @faceta = $driver.element(xpath: '//section[@class="catalog-facets"]//section[' + random_num.to_s + ']/h5').text
            puts "Faceta seleccionada Random es #{@faceta}"
        else
            @faceta = faceta
        end
        section_faceta = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]/parent::section')
        if section_faceta.attribute_value("class") == "is-collapsed catalog-facet"
            pre_select = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]')
            $tools.click(pre_select)
        end

        lista_filtros = $driver.elements(xpath: '//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li')
        cantidad_filtros = lista_filtros.count
        puts "Cantidad de filtros de #{@faceta} es #{cantidad_filtros}"

        random_num = rand(1..cantidad_filtros)
        puts "Numero de #{@faceta} seleccionada #{random_num}"

        filtro_selected = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + random_num.to_s + ']')
        sleep 2
        @filtro_name = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + random_num.to_s + ']/div').title
        puts "Nombre de la #{@faceta} seleccionada: #{@filtro_name}"
            
        @filtro_count = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + random_num.to_s + ']//span[@class="badge-count"]').text
        puts "Cantidad de productos con esta #{@faceta}: #{@filtro_count}"
        sleep 4    
        $tools.click(filtro_selected)

        click_aplicar_filtro

        timeout = 0
        while(filtro_selected.present? && (timeout < 60))
            puts "Pagina cargando"
            timeout += 1
            sleep 2
        end
        puts "Realizado el filtro"
    end

    def comparar_cantidad_filtro_resultado
        sleep 3
        $tools.esperar_elemento(@result_msg_catalog)
        cantidad_msg = @result_msg_catalog.text.gsub(/[^0-9]/, '')
        if cantidad_msg == @filtro_count
            puts "La cantidad de productos mostrada #{cantidad_msg} coincide con el filtro #{@filtro_count}"
        else
            $tools.fallo("No coincide la cantidad de productos mostrada #{cantidad_msg} con el filtro seleccionado #{@filtro_count}")
        end
    end

    
    def seleccionar_ultimo_filtro_faceta
        cant_facetas = $driver.elements(xpath: '//section[@class="catalog-facets"]//section').count
        puts "Hay #{cant_facetas} de facetas"
        last_faceta = $driver.element(xpath: '//section[@class="catalog-facets"]//section[' + cant_facetas.to_s + ']')
        @faceta =  $driver.element(xpath: '//section[@class="catalog-facets"]//section[' + cant_facetas.to_s + ']/h5').text
        puts "La ultima faceta se llama #{@faceta}"
        puts "La clase de la faceta es #{last_faceta.attribute_value("class")}"
        if last_faceta.attribute_value("class") == "is-collapsed catalog-facet"
            $tools.click(last_faceta)
        end
        cant_filtros = $driver.elements(xpath: '//section[@class="catalog-facets"]//section[' + cant_facetas.to_s + ']//li').count
        puts "La faceta #{@faceta} tiene #{cant_filtros} filtros"
        ultimo_filtro = $driver.element(xpath: '//section[@class="catalog-facets"]//section[' + cant_facetas.to_s + ']//li[' + cant_filtros.to_s + ']')
        @filtro_name = $driver.element(xpath: '//section[@class="catalog-facets"]//section[' + cant_facetas.to_s + ']//li[' + cant_filtros.to_s + ']/a').title
        puts "El ultimo filtro es #{@filtro_name}"
        $tools.click(ultimo_filtro)
    end

    def verificar_filtro_seleccionado
        filtro = $driver.element(xpath: '//div[@id="catalog-page"]//div[2]/div[1]//div[2]/div[@class="header-bottom-container"]//ul//span[contains(text(), "' + @filtro_name + '")]')
        if filtro.present?
            puts "Filtro de #{@faceta} #{@filtro_name} se muestra correctamente"
        else
            $tools.fallo("No se muestra Filtro de #{@faceta} #{@filtro_name}")
        end
    end

    def validar_facetas_distitas
        cant_facetas = $driver.elements(xpath: '//section[@class="catalog-facets"]//section').count
        puts "Hay #{cant_facetas} de facetas"
        
        array_facetas = Array.new
        repetidos = Array.new
        i = 1
        while i <= cant_facetas
            faceta = $driver.element(xpath: '//section[@class="catalog-facets"]//section[' + i.to_s + ']/h5').text
            puts "Validar #{faceta}"
            if $tools.elemento_presente_array(faceta, array_facetas)
                repetidos.push(faceta)
            else
                array_facetas.push(faceta)
            end
            i += 1
        end

        if repetidos.any?
            $tools.fallo "Existen facetas repetidas"
            repetidos.each do |i|
                puts i
            end
        else
            puts "No existen facetas repetidas"
        end

    end

    def verificar_cantidad_items_filtrado
        cantidad_total_productos = @filtro_count
        pagina = 1
        total_items = 0
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
        puts "Cantidad de Productos en la pagina #{pagina} es #{cant_productos_pagina}"
        total_items = total_items + cant_productos_pagina
        pagina += 1
        while !@btn_pagina_siguiente_sup_deshabilitada.present?
            sleep 1
            $tools.click(@btn_pagina_siguiente_sup_habilitada)
            pagina_activa = $driver.element(xpath: '//div[@id="catalog-page"]//div[2]/div[1]//div[2]//div[2]//a[@class="is-active" and contains(text(), "' + pagina.to_s + '")]')
            timeout = 0
            while(!pagina_activa.present? && (timeout < 60))
                puts "Pagina #{pagina} cargando"
                sleep 1
                timeout += 1
            end
            puts "Pagina cargada"

            cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
            puts "Cantidad de Productos en la pagina #{pagina} es #{cant_productos_pagina}"
            total_items = total_items + cant_productos_pagina
            puts "Cantidad de productos sumados hasta ahora #{total_items}"
            pagina +=1
        end

        if total_items == cantidad_total_productos.to_i
            puts "Se listaron #{total_items} que coincide con la totaldad de los productos filtrados #{cantidad_total_productos}"
        else
            $tools.fallo("No se listaron los items de productos esperados, hay #{total_items}/#{cantidad_total_productos}")
        end
    end

    def verificar_items_quickview_filtro_seleccionado
        productos_ok = Array.new
        productos_nok = Array.new
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
        cantidad_total_productos_revisados = 0
        pagina = 1
        @btn_pagina_siguiente_sup_deshabilitada = $driver.element(xpath: @selectors["result_3"]["btn_pagina_siguiente_sup_deshabilitada"])
        while ((pagina <= 4 && pagina != 1 && !@btn_pagina_siguiente_sup_deshabilitada.present?) || pagina == 1)
            if pagina != 1
                @btn_pagina_siguiente_sup_habilitada = $driver.element(xpath: @selectors["result_3"]["btn_pagina_siguiente_sup_habilitada"])
                $tools.click(@btn_pagina_siguiente_sup_habilitada)
                page_active = $driver.element(xpath: '//div[@id="catalog-page"]//div[2]//div[2]//div[2]//a[@class="is-active" and contains(text(), "' + pagina.to_s + '")]')
                timeout = 0
                while(!page_active.present? && (timeout < 60))
                    puts "Pagina #{pagina} cargando"
                    sleep 1
                    timeout += 1
                end
                cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
            end
            
            if (@faceta == "Marca" || @faceta == "Precio" || @faceta == "Color")
                #informacion presente en el item
                if validar_filtro_aplicado
                    registro = @faceta + "_" + @filtro_name + "_P" + pagina.to_s + "_" + @registro_pagina
                    productos_ok.push(registro)
                else
                    registro = @faceta + "_" + @filtro_name + "_P" + pagina.to_s + "_" + @registro_pagina
                    productos_nok.push(registro)
                end
                if !productos_nok.empty?
                    i = 0
                    while i < productos_nok.length
                        puts productos_nok[i]
                        i += 1
                    end
                    $tools.fallo("Hay #{productos_nok.length} paginas que no concuerdan con el filtro aplicado")
                else
                    puts "Se revisaron #{cant_productos_pagina} y todos coincidian con el filtro faceta #{@faceta} con valor #{@filtro_name} seleccionado"
                end
            else
                #se necesita entrar al quickview
                cant_productos_revisar = return_cuantos_items_analiso(pagina, cant_productos_pagina)  
                cantidad_total_productos_revisados =  cantidad_total_productos_revisados + cant_productos_revisar         
                puts "Cantidad de Productos en la pagina #{pagina} es #{cant_productos_pagina} y se revisaran #{cant_productos_revisar}"
                item = 1
                while item <= cant_productos_revisar
                    puts "Se validara de la faceta #{@faceta} el filtro #{@filtro_name} al item de produto #{item}"
                    item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/a[' + item.to_s + ']/div[@class="proportional-image-wrapper catalog-product__image-preview"]')
                    item_agotado = $driver.element(xpath: '//div[@class="catalog-container"]/a[' + item.to_s + ']/div[@class="proportional-image-wrapper catalog-product__image-preview catalog-product__image-preview--disabled"]')
                    if !item_agotado.present?
                        $tools.click(item_selected)
                        registro = @faceta + "_" + @filtro_name + "_P" + pagina.to_s + "_" + item.to_s
                        if validar_filtro_aplicado
                            productos_ok.push(registro)
                        else
                            productos_nok.push(registro)
                        end
                        if (@faceta != "Género" && @faceta != "Tipo de Prenda")
                            begin
                                $tools.click(@btn_quickview_close)
                                $driver.scroll.to :top
                                item += 1
                            rescue
                                $tools.fallo("El producto #{item} de la pagina #{pagina} no abre el quickview")
                            end
                        end
                    else
                        puts "Producto #{item} agotado"
                        item += 1
                    end
                end
                if !productos_nok.empty?
                    i = 0
                    while i < productos_nok.length
                        puts productos_nok[i]
                        i += 1
                    end
                    $tools.fallo("Hay #{productos_nok.length} productos que no concuerdan con el filtro aplicado")
                else
                    puts "Se revisaron #{cantidad_total_productos_revisados} y todos coincidian con el filtro faceta #{@faceta} con valor #{@filtro_name} seleccionado"
                end
            end
            pagina += 1
        end
    end

    def validar_filtro_aplicado
        case @faceta
        when "Talla" then result = validar_filtro_talla_producto_quickview(@faceta, @filtro_name)
        when "Género" then result = validar_filtro_especificaciones_producto_detalle(@faceta, @filtro_name)
        when "Marca" then result = validar_filtro_marca_producto_catalog(@faceta, @filtro_name)
        when "Tipo de Prenda" then result = validar_filtro_especificaciones_producto_detalle(@faceta, @filtro_name)
        when "Color" then result = validar_filtro_color_producto_catalog(@faceta, @filtro_name)
        when "Precio" then result = validar_filtro_precio_producto_catalogo(@faceta, @filtro_name)
        end
        return result
    end

    def validar_filtro_talla_producto_quickview(faceta, filtro_name)
        sleep 2
        elemento_verificado = $driver.element(xpath: '//span[contains(text(), "' + faceta + '")]/parent::div/following-sibling::div[@class="radio-items"]/div[@class="radio-item js-check-product"]//label[contains(text(), "' + filtro_name + '")]')
        if elemento_verificado.present?
            puts "SI esta presente faceta #{faceta} con valor #{filtro_name}"
            return true 
        else
            puts "NO esta presente/disponible faceta #{faceta} con valor #{filtro_name}"
            return false
        end
    end

    def validar_filtro_especificaciones_producto_detalle(faceta, filtro_name)
        url = $driver.url
        $tools.click(@mas_detalles)
        ficha = FichaPage.new
        result = ficha.validar_especificaciones(faceta, filtro_name)
        $tools.back
        if $driver.url != url
            puts "Back retry"
            $tools.back
            sleep 1
        end
        return result
    end

    def validar_filtro_marca_producto_catalog(faceta, filtro_name)
        cant_marcas = $driver.elements(xpath:'//div[@class="catalog-container"]/a/div[@class="catalog-product-details"]//div[contains(text(), "' + filtro_name + '")]').count
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
        @registro_pagina = cant_marcas.to_s + "/" + cant_productos_pagina.to_s
        puts "Esta pagina contiene #{cant_marcas}/#{cant_productos_pagina} con la marca seleccionada"
        if cant_marcas == cant_productos_pagina
            puts "Los #{cant_productos_pagina} productos que contiene esta pagina son de la #{faceta}: #{filtro_name}"
            return true
        else
            puts "De los #{cant_productos_pagina} solo #{cant_marcas} productos contienen la #{faceta}: #{filtro_name}"
            return false
        end
    end

    def validar_filtro_color_producto_catalog(faceta, filtro_name)
        cant_color = $driver.elements(xpath:'//div[@class="catalog-container"]/a/div[@class="catalog-product-details"]/div[@class="catalog-product-details__colors"]//div[@title="' + filtro_name + '"]').count
        cant_color_no_dispo = $driver.elements(xpath:'//div[@class="catalog-container"]/a/div[@class="catalog-product-details"]/div[@class="catalog-product-details__colors"]//div[@title="' + filtro_name + " (No disponible)" + '"]').count
        cant_color_total = cant_color + cant_color_no_dispo
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
        @registro_pagina = cant_color_total.to_s + "/" + cant_productos_pagina.to_s
        puts "Esta pagina contiene #{cant_color_total}/#{cant_productos_pagina} con el color seleccionado"
        if cant_color == cant_productos_pagina
            puts "Los #{cant_productos_pagina} productos que contiene esta pagina son de #{faceta}: #{filtro_name}"
            return true
        else
            puts "De los #{cant_productos_pagina} solo #{cant_color} productos contienen el #{faceta}: #{filtro_name} y están Disponibles"
            return false
        end
    end

    def validar_filtro_precio_producto_catalogo(faceta, filtro_name)
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
        item = 1
        cantidad_ok = 0
        cantidad_nok = 0
        while item <= cant_productos_pagina
            xpath_element = '//div[@class="catalog-container"]/a[' + item.to_s + ']/div[@class="catalog-product-details"]//div[@class="catalog-product-details__prices"]//li[@title="Precio Internet"]'
            precio_item = $driver.element(xpath: xpath_element)
            if precio_item.present?
                precio = precio_item.text
            else
                xpath_element = '//div[@class="catalog-container"]/a[' + item.to_s + ']/div[@class="catalog-product-details"]//div[@class="catalog-product-details__prices"]//li[@title="Rango de precios"]'
                precio_item = $driver.element(xpath: xpath_element)
                if precio_item.present?
                    precio = precio_item.text
                else
                    puts "Ni Precio Internet ni Rango de Precios"
                    break
                end
            end
            temp = precio.split
            long = temp.length
            precio_limpio = temp[long-1].delete("$").delete(".").to_i
            if $tools.precio_en_el_rango(precio_limpio, filtro_name)
                cantidad_ok += 1
            else
                cantidad_nok += 1
            end
            item += 1
        end

        @registro_pagina = cantidad_ok.to_s + "/" + cant_productos_pagina.to_s
        puts "Esta pagina contiene #{cantidad_ok}/#{cant_productos_pagina} con el precio en el rango seleccionado"
        
        if cantidad_ok == cant_productos_pagina
            puts "Los #{cant_productos_pagina} productos que contiene esta pagina con el precio en el rango seleccionado #{filtro_name}"
            return true
        else
            puts "De los #{cant_productos_pagina} solo #{cantidad_ok} productos contienen el precio en el rango seleccionado #{filtro_name}"
            return false
        end
    end

    def return_cuantos_items_analiso(pagina, cantidad_items)
        case pagina
        when 1 then result = cantidad_items 
        when 2 then result = cantidad_items*80/100
        when 3 then result = cantidad_items*70/100
        when 4 then result = cantidad_items*60/100
        when 5 then result = cantidad_items*50/100
        when 6 then result = cantidad_items*40/100
        when 7 then result = cantidad_items*30/100
        when 8 then result = cantidad_items*20/100
        when 9 then result = cantidad_items*10/100
        when 10 then result = cantidad_items*5/100
        end
        return result
    end

    def sumar_cantidad_en_filtro(faceta)
        if faceta == "Random"
            cant_facetas = $driver.elements(xpath: '//section[@class="catalog-facets"]//section').count
            random_num = rand(1..cant_facetas)
            @faceta = $driver.element(xpath: '//section[@class="catalog-facets"]//section[' + random_num.to_s + ']/h5').text
            puts "Faceta seleccionada Random es #{@faceta}"
        else
            @faceta = faceta
        end
        section_faceta = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]/parent::section')
        if section_faceta.attribute_value("class") == "is-collapsed catalog-facet"
            pre_select = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]')
            $tools.click(pre_select)
        end

        cantidad_filtros = $driver.elements(xpath: '//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li').count
        puts "La faceta #{@faceta} contiene #{cantidad_filtros} filtros"
        @cantidad_productos_filtro = 0
        item = 1
        while item <= cantidad_filtros
            filtro_item_cant = $driver.element(xpath: '//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + item.to_s + ']//span[@class="badge-count"]').text
            @cantidad_productos_filtro = @cantidad_productos_filtro + filtro_item_cant.to_i
            item += 1
        end
        puts "La cantidad de productos de la faceta #{@faceta} es #{@cantidad_productos_filtro}"
    end

    def verificar_cantidad_filtro_vs_resultado
        if @cantidad_productos_filtro < $cantidad_listado
            $tools.fallo("Hay #{@cantidad_productos_filtro}/#{$cantidad_listado} productos con este filtro #{@faceta}")
        else
            puts "Hay #{@cantidad_productos_filtro}/#{$cantidad_listado} productos con este filtro #{@faceta}"
        end
    end

    def eliminar_filtro
        filtro_eliminar = $driver.element(xpath: '//div[@id="catalog-page"]//div[2]/div[2]//li/a/span[contains(text(), "' + @filtro_name + '")]')
        $tools.click(filtro_eliminar)
        while filtro_eliminar.present?
            puts "Pagina cargando"
            sleep 2
        end
        puts "Eliminado el filtro"
    end

    def verificar_cantidad_antes_despues_eliminar_filtro
        filtro_eliminar = $driver.element(xpath: '//div[@id="catalog-page"]//div[2]/div[2]//li/a/span[contains(text(), "' + @filtro_name + '")]')
        if !filtro_eliminar.present? && $cantidad_listado == $cantidad_listado_despues_filtro
            puts "Se elimino el filtro correctamente"
        else
            $tools.fallo("Al eliminar el filtro no se aplico correctamente")
        end
    end

    def limpiar_filtros
        $tools.click(@limpiar_filtros)
        while @limpiar_filtros.present?
            puts "Pagina cargando"
            sleep 2
        end
        puts "Se borraron todos los filtros"
    end

    def seleccionar_ordenamiento(metodo)
        $tools.seleccionar_opcion(@sel_ordenar,metodo)
        filtro_aplicado = $driver.element(xpath: '//div[2]/div/div/div/div[1]/div/div/select[@name="orderBy"]/option[@selected and contains(text(), "' + metodo + '")]')
        $tools.esperar_elemento filtro_aplicado
        # while !filtro_aplicado.present?
        #     puts "Cargando Ordenamiento #{metodo}"
        #     sleep 2
        # end
        puts "Se completo el ordenamiento #{metodo}"
    end

    def verificar_orden_mayor_menor
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
        item = 1
        precio_anterior = 99999999
        while item <= cant_productos_pagina
            xpath_element = '//div[@class="catalog-container"]/a[' + item.to_s + ']/div[@class="catalog-product-details"]//div[@class="catalog-product-details__prices"]//li[@title="Precio Internet"]'
            precio_item = $driver.element(xpath: xpath_element)
            if precio_item.present?
                precio = precio_item.text
            else
                xpath_element = '//div[@class="catalog-container"]/a[' + item.to_s + ']/div[@class="catalog-product-details"]//div[@class="catalog-product-details__prices"]//li[@title="Rango de precios"]'
                precio_item = $driver.element(xpath: xpath_element)
                if precio_item.present?
                    precio = precio_item.text
                else
                    puts "Ni Precio Internet ni Rango de Precios"
                    break
                end
            end
            temp = precio.split
            long = temp.length
            precio_limpio = temp[long-1].delete("$").delete(".").to_i
            if precio_anterior < precio_limpio
                $tools.fallo("El producto #{item} tiene un precio #{precio_limpio} y su anterior #{precio_anterior} es menor, por lo que no esta ordenado por #{metodo}")
            else
                puts "El producto #{item} tiene un precio #{precio_limpio} y es menor o igual a su anterior #{precio_anterior}"
            end
            item += 1
            precio_anterior = precio_limpio
        end
    end

    def verificar_orden_menor_mayor
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
        item = 1
        precio_anterior = 0
        while item <= cant_productos_pagina
            xpath_element = '//div[@class="catalog-container"]/a[' + item.to_s + ']/div[@class="catalog-product-details"]//div[@class="catalog-product-details__prices"]//li[@title="Precio Internet"]'
            precio_item = $driver.element(xpath: xpath_element)
            if precio_item.present?
                precio = precio_item.text
            else
                xpath_element = '//div[@class="catalog-container"]/a[' + item.to_s + ']/div[@class="catalog-product-details"]//div[@class="catalog-product-details__prices"]//li[@title="Rango de precios"]'
                precio_item = $driver.element(xpath: xpath_element)
                if precio_item.present?
                    precio = precio_item.text
                else
                    puts "Ni Precio Internet ni Rango de Precios"
                    break
                end
            end
            temp = precio.split
            long = temp.length
            precio_limpio = temp[long-1].delete("$").delete(".").to_i
            if precio_anterior > precio_limpio
                $tools.fallo("El producto #{item} tiene un precio #{precio_limpio} y su anterior #{precio_anterior} es mayor, por lo que no esta ordenado por #{metodo}")
            else
                puts "El producto #{item} tiene un precio #{precio_limpio} y es mayor o igual a su anterior #{precio_anterior} "
            end
            item += 1
            precio_anterior = precio_limpio
        end
    end

    def pag_sup_ultima_pag
        pagina = 1
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
        puts "Cantidad de Productos en la pagina #{pagina} es #{cant_productos_pagina}"
        pagina += 1
        while !@btn_pagina_siguiente_sup_deshabilitada.present?
            sleep 1
            $tools.click(@btn_pagina_siguiente_sup_habilitada)
            pagina_activa = $driver.element(xpath: '//div[@id="catalog-page"]//div[2]/div[1]//div[2]//div[2]//a[@class="is-active" and contains(text(), "' + pagina.to_s + '")]')
            timeout = 0
            while(!pagina_activa.present? && (timeout < 60))
                puts "Pagina #{pagina} cargando"
                sleep 1
                timeout += 1
            end
            if timeout == 60
                $tools.fallo("Despues de 1 minuto la pagina no cargo apropiadamente")
            else
                puts "Pagina cargada"
                cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
                puts "Cantidad de Productos en la pagina #{pagina} es #{cant_productos_pagina}"
                pagina +=1
            end
        end
    end

    def pag_inf_ultima_pag
        pagina = 1
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
        puts "Cantidad de Productos en la pagina #{pagina} es #{cant_productos_pagina}"
        pagina += 1
        while !@btn_pagina_siguiente_inf_deshabilitada.present?
            sleep 1
            $tools.click(@btn_pagina_siguiente_inf_habilitada)
            pagina_activa = $driver.element(xpath: '//div[@class="catalog-page__footer-pagination"]//a[@class="is-active" and contains(text(), "' + pagina.to_s + '")]')
            timeout = 0
            while(!pagina_activa.present? && (timeout < 60))
                puts "Pagina #{pagina} cargando"
                sleep 1
                timeout += 1
            end
            if timeout == 60
                $tools.fallo("Despues de 1 minuto la pagina no cargo apropiadamente")
            else
                puts "Pagina cargada"
                cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
                puts "Cantidad de Productos en la pagina #{pagina} es #{cant_productos_pagina}"
                pagina +=1
            end
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

    def verificar_abra_quick_view
        cantidad_total_productos_revisados = 0
        pagina = 1
        @btn_pagina_siguiente_sup_deshabilitada = $driver.element(xpath: @selectors["result_3"]["btn_pagina_siguiente_sup_deshabilitada"])
        while ((pagina <= 4 && pagina != 1 && !@btn_pagina_siguiente_sup_deshabilitada.present?) || pagina == 1)
            if pagina != 1
                
                if $mobile
                    @btn_pagina_siguiente_sup_habilitada = $driver.element(xpath: @selectors["mobile"]["btn_pagina_siguiente_sup_habilitada"])
                    $tools.click(@btn_pagina_siguiente_sup_habilitada)
                    page_active = $driver.element(xpath: '//div[@class="catalog-page"]/div[2]/div/ul/li[2]/div/select[@name="pagination"]/option[@disabled="" and contains(text(), "' + pagina.to_s + '")]')
                    puts page_active
                else
                    @btn_pagina_siguiente_sup_habilitada = $driver.element(xpath: @selectors["result_3"]["btn_pagina_siguiente_sup_habilitada"])
                    $tools.click(@btn_pagina_siguiente_sup_habilitada)
                    page_active = $driver.element(xpath: '//div[@id="catalog-page"]//div[2]//div[2]//div[2]//a[@class="is-active" and contains(text(), "' + pagina.to_s + '")]')
                end
                # page_active = $driver.element(xpath: '//div[@id="catalog-page"]//div[2]//div[2]//div[2]//a[@class="is-active" and contains(text(), "' + pagina.to_s + '")]')
                timeout = 0
                while(!page_active.present? && (timeout < 60))
                    puts "Pagina #{pagina} cargando"
                    sleep 1
                    timeout += 1
                end
            end
            cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
            cant_productos_revisar = return_cuantos_items_analiso(pagina, cant_productos_pagina)  
            cantidad_total_productos_revisados =  cantidad_total_productos_revisados + cant_productos_revisar         
            puts "Cantidad de Productos en la pagina #{pagina} es #{cant_productos_pagina} y se revisaran #{cant_productos_revisar}"
            item = 1
            while item <= cant_productos_revisar
                puts "Se validara el quickview del produto #{item}"
                item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/a[' + item.to_s + ']/div[@class="proportional-image-wrapper catalog-product__image-preview"]')
                item_agotado = $driver.element(xpath: '//div[@class="catalog-container"]/a[' + item.to_s + ']/div[@class="proportional-image-wrapper catalog-product__image-preview catalog-product__image-preview--disabled"]')
                if !item_agotado.present?
                    $tools.click(item_selected)
                    esperar_loading
                    sleep 2
                    begin
                        $tools.esperar_elemento_timeout(@btn_quickview_close, 80)
                        $tools.click(@btn_quickview_close)
                        sleep 1
                        $driver.scroll.to :top
                        item += 1
                    rescue
                        $tools.fallo("El producto #{item} de la pagina #{pagina} no abre el quickview")
                    end
                else
                    puts "Producto #{item} agotado"
                    item += 1
                end
            end
            pagina += 1
            puts "Se revisaron #{cantidad_total_productos_revisados} y todos abrian el quickview"
        end
    end

    def abrir_quick_view_producto_random
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/div').count
        
        item = rand(1..cant_productos_pagina - 3)
        item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/a[@class="catalog-product-item catalog-product-item--moda catalog-product-item__container undefined"]')
        item_agotado = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/a[@class="proportional-image-wrapper catalog-product__image-preview catalog-product__image-preview--disabled"]')
        
        while item_agotado.present?
            item = rand(1..cant_productos_pagina - 3)
            item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/a[@class="catalog-product-item catalog-product-item--moda catalog-product-item__container undefined"]')
            item_agotado = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/div[@class="proportional-image-wrapper catalog-product__image-preview catalog-product__image-preview--disabled"]') 
        end
        
        $tools.click(item_selected)
        esperar_loading
        begin
            $tools.esperar_elemento(@btn_quickview_close)
        rescue
            $tools.fallo("El producto #{item} de la pagina no abre el quickview")
        end
       
    end

    def abrir_quickview_producto_con_precio(precio)
    
        case precio
        when "Precio Descuento"
            algun_producto_precio = $driver.element(xpath: '//div[@class="catalog-product-details__discount-tag"]')
        else        
            algun_producto_precio = $driver.element(xpath: '//div[@class="catalog-container"]/div//a/div//div[@class="catalog-prices"]/ul/li[@title="' + precio + '"]')
        end
        if algun_producto_precio.present?
            lista_productos = $driver.elements(xpath: '//div[@class="catalog-container"]/div')
            cant_productos = lista_productos.count
            puts "Cantidad productos #{cant_productos}"
            item = 1
            puts "Producto seleccionado #{item}"

        case precio    
        when "Precio Descuento"
            item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']//a/div//div[@class="catalog-prices"]/ul/li/parent::ul/parent::div/parent::div/following-sibling::div[@class="catalog-product-details__discount-tag"]')    
        else
            item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']//a/div//div[@class="catalog-prices"]/ul/li[@title="' + precio + '"]')
        end

        while !item_selected.present?
                item += 1
                puts "Producto seleccionado #{item}"

        case precio
            when "Precio Descuento"
                item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']//a/div//div[@class="catalog-prices"]/ul/li/parent::ul/parent::div/parent::div/following-sibling::div[@class="catalog-product-details__discount-tag"]')    
            else
                item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']//a/div//div[@class="catalog-prices"]/ul/li[@title="' + precio + '"]')
            end
                # item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']//a/div//div[@class="catalog-prices"]/ul/li[@title="' + precio + '"]')
            end
            if @aceptar_cookies.present?
                $tools.click(@aceptar_cookies)
            end
            $tools.click(item_selected)
            begin
                $tools.esperar_elemento(@btn_quickview_close)
            rescue
                $tools.fallo("El producto #{item} de la pagina no abre el quickview")
            end
        else
            puts "En esta pagina no hay producto con #{precio}"
        end
    end

    def verificar_accion_boton_back_browser(dato)
        if $mobile
            validar_msg_resultados(dato)
        else
            btn_inicio_session = $driver.element(xpath: '//a/span[@class="my-account__desktop"]')
            if btn_inicio_session.present?
                puts "Cliente direccionado a Home Ripley correctamente"
            end
        end
    end 
    
    def presionar_boton_back_browser
        sleep 2
        $tools.back 
    end
end