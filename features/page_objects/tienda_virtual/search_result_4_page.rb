require './features/page_objects/tienda_virtual/search_result_comun_page.rb'
#require './features/page_objects/tienda_virtual/search_result_3_page.rb'

class SearchResult4Page < SearchResultComunPage      
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/search_result_selectors.json"))
        case $mobile
        when true
            @btn_aplicar_filtro = $driver.element(xpath: @selectors["mobile"]["btn_aplicar_filtro"])
            @btn_second_page = $driver.element(xpath: @selectors["mobile"]["btn_second_page"])
            @btn_second_page_active = $driver.element(xpath: @selectors["mobile"]["btn_second_page_active"])
        else
            @result_msg_catalog = $driver.element(xpath: @selectors["comun"]["result_msg_catalogo"])
            @btn_pagina_siguiente_inf_deshabilitada = $driver.element(xpath: @selectors["result_4"]["btn_pagina_siguiente_inf_deshabilitada"])
            @btn_pagina_siguiente_inf_habilitada = $driver.element(xpath: @selectors["result_4"]["btn_pagina_siguiente_inf_habilitada"])
            @limpiar_filtros = $driver.element(xpath: @selectors["result_4"]["limpiar_filtros"])
            @sel_ordenar = $driver.select_list(xpath: @selectors["result_4"]["sel_ordenar"])
            @aceptar_cookies = $driver.element(xpath: @selectors["aceptar_cookie"])
            @btn_second_page = $driver.element(xpath: @selectors["result_4"]["btn_second_page"])
            @btn_second_page_active = $driver.element(xpath: @selectors["result_4"]["btn_second_page_active"])
            @btn_aplicar_filtro = $driver.element(xpath: @selectors["result_4"]["btn_aplicar_filtro"])
        end       
    end
    
    def click_aplicar_filtro
        case $mobile
        when true
            $tools.esperar_elemento(@btn_aplicar_filtro)
            $tools.click(@btn_aplicar_filtro)
        else
            $tools.esperar_elemento(@btn_aplicar_filtro)
            $tools.click(@btn_aplicar_filtro)
        end    
    end

    def filtrar_categoria_hija(categoria)

        sleep 3
     
        if $mobile

            puts "Categoria hija ya seleccionada"
            # sleep 2
            # select_categoría = $driver.element(xpath: '//div[@class="slideout anm-slideout-slidein"]//a[contains(text(), "' + categoria + '")]')
            # $tools.click(select_categoría)
        else
            seleccion = $driver.element(xpath: '//div[@class="catalog-page"]//div[@class="catalog-filters-child-categories"]//a[contains(text(), "' + categoria + '")]')
            $tools.click(seleccion)
        end
    end

    def filtrar_categoria_hija_mobile(filtrocategoria)   
        selec = $driver.element(xpath: '//div[@class="catalog-filters-child-categories"]/div/div/a[contains(text(), "' + filtrocategoria + '")]')    
        $tools.click(selec)
    end

    def seleccionar_ultimo_filtro_faceta
        cant_facetas = $driver.elements(xpath: '//div[@class="catalog-page"]//section[@class="catalog-facets"]//section').count
        puts "Hay #{cant_facetas} de facetas"
        last_faceta = $driver.element(xpath: '//div[@class="catalog-page"]//section[@class="catalog-facets"]//section[' + cant_facetas.to_s + ']')
        @faceta =  $driver.element(xpath: '//div[@class="catalog-page"]//section[@class="catalog-facets"]//section[' + cant_facetas.to_s + ']/h5').text
        puts "La ultima faceta se llama #{@faceta}"
        puts "La clase de la faceta es #{last_faceta.attribute_value("class")}"
        if last_faceta.attribute_value("class") == "is-collapsed catalog-facet"
            $tools.click(last_faceta)
        end
        cant_filtros = $driver.elements(xpath: '//div[@class="catalog-page"]//section[@class="catalog-facets"]//section[' + cant_facetas.to_s + ']//li').count
        puts "La faceta #{@faceta} tiene #{cant_filtros} filtros"
        ultimo_filtro = $driver.element(xpath: '//div[@class="catalog-page"]//section[@class="catalog-facets"]//section[' + cant_facetas.to_s + ']//li[' + cant_filtros.to_s + ']')
        @filtro_name = $driver.element(xpath: '//div[@class="catalog-page"]//section[@class="catalog-facets"]//section[' + cant_facetas.to_s + ']//li[' + cant_filtros.to_s + ']/a').title
        puts "El ultimo filtro es #{@filtro_name}"
        $tools.click(ultimo_filtro)
    end

    def verificar_filtro_seleccionado
        filtro = $driver.element(xpath: '//div[@class="catalog-page"]//section[@class="applied-facets"]//span[contains(text(), "' + @filtro_name + '")]')
        if filtro.present?
            puts "Filtro de #{@faceta} #{@filtro_name} se muestra correctamente"
        else
            $tools.fallo("No se muestra Filtro de #{@faceta} #{@filtro_name}")
        end
    end

    def validar_facetas_distitas
        cant_facetas = $driver.elements(xpath: '//div[@class="catalog-page"]//section[@class="catalog-facets"]//section').count
        puts "Hay #{cant_facetas} de facetas"
        if cant_facetas == 0
            $tools.fallo("No se muestran facetas")
        else
            array_facetas = Array.new
            repetidos = Array.new
            i = 1
            while i <= cant_facetas
                faceta = $driver.element(xpath: '//div[@class="catalog-page"]//section[@class="catalog-facets"]//section[' + i.to_s + ']/h5').text
                puts "Validar #{faceta}"
                if $tools.elemento_presente_array(faceta, array_facetas)
                    repetidos.push(faceta)
                else
                    array_facetas.push(faceta)
                end
                i += 1
            end

            if repetidos.any?
                repetidos.each do |i|
                    puts i
                end
                $tools.fallo("Existen facetas repetidas")
            else
                puts "No existen facetas repetidas"
            end
        end
    end

    def filtrar_faceta(faceta)        

        $driver.execute_script "document.body.style['-webkit-transform'] = \"scale(0.5)\";"
        $driver.send_keys :down
        $driver.send_keys :down
        $driver.send_keys :down

        if $mobile
            btn_filtrar = $driver.element(xpath: '//div[2]//div[2]//button[@class="btn-clear slideout-filters-toggle catalog-filters-toggle"]')
            $tools.click(btn_filtrar)
            sleep 4

            marca = $driver.element(xpath: '//div[@id="catalog-page"]/div/div/div/div/aside/section/div/section/h5[contains(text(), "Marca")]')
            precio = $driver.element(xpath: '//div[@id="catalog-page"]/div/div/div/div/aside/section/div/section/h5[contains(text(), "Precio")]')
        else
            marca = $driver.element(xpath: '//div[@class="col-md-3 hidden-md-down"]//h5[contains(text(), "Marca")]')
            precio = $driver.element(xpath: '//div[@class="col-md-3 hidden-md-down"]//h5[contains(text(), "Precio")]')
        end
            $tools.click(marca)
            $tools.click(precio)
        if faceta == "Random"
            if $mobile
                cant_facetas = $driver.elements(xpath: '//div[@class="slideout__body"]//section[@class="catalog-facets"]//section').count
                random_num = rand(1..cant_facetas)
                @faceta = $driver.element(xpath: '//div[@class="slideout__body"]//section[@class="catalog-facets"]//section[' + random_num.to_s + ']/h5').text
                puts "Faceta seleccionada Random es #{@faceta}"
            else
                cant_facetas = $driver.elements(xpath: '//div[@class="catalog-page"]//section[@class="catalog-facets"]//section').count
                random_num = rand(1..cant_facetas)
                @faceta = $driver.element(xpath: '//div[@class="catalog-page"]//section[@class="catalog-facets"]//section[' + random_num.to_s + ']/h5').text
                puts "Faceta seleccionada Random es #{@faceta}"
            end
        else
            @faceta = faceta
        end
        if $mobile
            section_faceta = $driver.element(xpath: '//div[@class="slideout__body"]//h5[contains(text(), "' + @faceta + '")]/parent::section')
            if section_faceta.attribute_value("class") == "is-collapsed catalog-facet"
                pre_select = $driver.element(xpath: '//div[@class="slideout__body"]//h5[contains(text(), "' + @faceta + '")]')
                $tools.click(pre_select)  
            end     
        else
            section_faceta = $driver.element(xpath: '//div[@class="catalog-page"]//h5[contains(text(), "' + @faceta + '")]/parent::section')
            if section_faceta.attribute_value("class") == "is-collapsed catalog-facet"
                pre_select = $driver.element(xpath: '//div[@class="catalog-page"]//h5[contains(text(), "' + @faceta + '")]')
                $tools.click(pre_select)
            end
        end
        if $mobile
            lista_filtros = $driver.elements(xpath: '//div[@class="slideout__body"]//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li')
            cantidad_filtros = lista_filtros.count
            puts "Cantidad de filtros de #{@faceta} es #{cantidad_filtros}"            
        else
            lista_filtros = $driver.elements(xpath: '//div[@class="catalog-page"]//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li')
            cantidad_filtros = lista_filtros.count
            puts "Cantidad de filtros de #{@faceta} es #{cantidad_filtros}"
        end
        random_num = rand(1..cantidad_filtros)
        puts "Numero de #{@faceta} seleccionada #{random_num}"

        if $mobile
            filtro_selected = $driver.element(xpath: '//div[@class="slideout__body"]//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + random_num.to_s + ']')
            @filtro_name = $driver.element(xpath: '//div[@class="slideout__body"]//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + random_num.to_s + ']/div').title
            puts "Nombre de la #{@faceta} seleccionada: #{@filtro_name}"                
            @filtro_count = $driver.element(xpath: '//div[@class="slideout__body"]//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + random_num.to_s + ']//span[@class="ripley-checkbox"]').text
        else
            filtro_selected = $driver.element(xpath: '//div[@class="catalog-page"]//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + random_num.to_s + ']')
            @filtro_name = $driver.element(xpath: '//div[@class="catalog-page"]//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + random_num.to_s + ']/div').title
            puts "Nombre de la #{@faceta} seleccionada: #{@filtro_name}"            
            @filtro_count = $driver.element(xpath: '//div[@class="catalog-page"]//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + random_num.to_s + ']//span[@class="ripley-checkbox"]').text
            puts "Cantidad de productos con la faceta #{@faceta}: #{@filtro_count}"       
        end
        if @aceptar_cookies.present?
            $tools.click(@aceptar_cookies)
        end
        $tools.click(filtro_selected)

        click_aplicar_filtro
        
        while filtro_selected.present?
            puts "Pagina cargando"
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

    def verificar_cantidad_items_filtrado
        cantidad_total_productos = @filtro_count
        pagina = 1
        total_items = 0
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
        puts "Cantidad de Productos en la pagina #{pagina} es #{cant_productos_pagina}"
        total_items = total_items + cant_productos_pagina
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

    def sumar_cantidad_en_filtro(faceta)
        if faceta == "Random"
            cant_facetas = $driver.elements(xpath: '//div[@class="catalog-page"]//section[@class="catalog-facets"]//section').count
            random_num = rand(1..cant_facetas)
            @faceta = $driver.element(xpath: '//div[@class="catalog-page"]//section[@class="catalog-facets"]//section[' + random_num.to_s + ']/h5').text
            puts "Faceta seleccionada Random es #{@faceta}"
        else
            @faceta = faceta
        end
        section_faceta = $driver.element(xpath: '//div[@class="catalog-page"]//h5[contains(text(), "' + @faceta + '")]/parent::section')
        if section_faceta.attribute_value("class") == "is-collapsed catalog-facet"
            pre_select = $driver.element(xpath: '//div[@class="catalog-page"]//h5[contains(text(), "' + @faceta + '")]')
            $tools.click(pre_select)
        end

        cantidad_filtros = $driver.elements(xpath: '//div[@class="catalog-page"]//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li').count
        puts "La faceta #{@faceta} contiene #{cantidad_filtros} filtros"
        @cantidad_productos_filtro = 0
        item = 1
        while item <= cantidad_filtros
            filtro_item_cant = $driver.element(xpath: '//div[@class="catalog-page"]//h5[contains(text(), "' + @faceta + '")]/following-sibling::div/ul/li[' + item.to_s + ']//span[@class="badge-count"]').text
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

    def verificar_items_filtro_seleccionado
        productos_ok = Array.new
        productos_nok = Array.new
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/a').count
        cantidad_total_productos_revisados = 0
        pagina = 1
        @btn_pagina_siguiente_inf_deshabilitada = $driver.element(xpath: @selectors["result_4"]["btn_pagina_siguiente_inf_deshabilitada"])
        while ((pagina <= 4 && pagina != 1 && !@btn_pagina_siguiente_inf_deshabilitada.present?) || pagina == 1)
            if pagina != 1
                @btn_pagina_siguiente_inf_habilitada = $driver.element(xpath: @selectors["result_4"]["btn_pagina_siguiente_inf_habilitada"])
                $tools.click(@btn_pagina_siguiente_inf_habilitada)
                pagina_activa = $driver.element(xpath: '//div[@class="catalog-page__footer-pagination"]//a[@class="is-active" and contains(text(), "' + pagina.to_s + '")]')
                timeout = 0
                while(!pagina_activa.present? && (timeout < 60))
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
                #informacion en la ficha del producto
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

    def validar_filtro_aplicado
        case @faceta
        when "Marca" then result = validar_filtro_marca_producto_catalog(@faceta, @filtro_name)
        when "Precio" then result = validar_filtro_precio_producto_catalogo(@faceta, @filtro_name)
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

    def eliminar_filtro
        filtro_eliminar = $driver.element(xpath: '//div[@id="catalog-page"]//div[2]//section[@class="applied-facets"]//span[contains(text(), "' + @filtro_name + '")] ')
        $tools.click(filtro_eliminar)
        while filtro_eliminar.present?
            puts "Pagina cargando"
            sleep 2
        end
        puts "Eliminado el filtro"
    end

    def verificar_cantidad_antes_despues_eliminar_filtro
        filtro_eliminar = $driver.element(xpath: '//div[@id="catalog-page"]//div[2]//section[@class="applied-facets"]//span[contains(text(), "' + @filtro_name + '")] ')
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
        filtro_aplicado = $driver.element(xpath: '//div[2]//div[2]/div/select[@name="orderBy"]/option[@selected and contains(text(), "' + metodo + '")]')
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

    def click_producto_random
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/div').count
        
        item = rand(1..cant_productos_pagina)
        item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/a/div[@class="proportional-image-wrapper catalog-product__image-preview"]')
        item_agotado = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/a[@class="proportional-image-wrapper catalog-product__image-preview catalog-product__image-preview--disabled"]')
        
        while item_agotado.present?
            item = rand(1..cant_productos_pagina)
            item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/a[' + item.to_s + ']/a/div[@class="proportional-image-wrapper catalog-product__image-preview"]')
            item_agotado = $driver.element(xpath: '//div[@class="catalog-container"]/a[' + item.to_s + ']/a/div[@class="proportional-image-wrapper catalog-product__image-preview catalog-product__image-preview--disabled"]') 
        end
        capturar_datos_producto(item)
        $tools.click(item_selected)       
    end

    def capturar_datos_producto(item)
        nombre_element = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/a/div[@class="catalog-product-details"]//div[@class="catalog-product-details__name"]')
        nombre = nombre_element.text
        puts "Nombre: " + nombre
        
        precio_normal = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/a/div[@class="catalog-product-details"]//div[@class="catalog-product-details__prices"]//li[@title="Precio Normal"]')

        if precio_normal.present? 
            text_precio_normal =  precio_normal.text
            puts "Precio Normal: " + text_precio_normal
        else 
            puts "No hay precio normal"
        end

        precio_internet = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/a/div[@class="catalog-product-details"]//div[@class="catalog-product-details__prices"]//li[@title="Precio Internet"]')

        if precio_internet.present? 
            text_precio_internet = precio_internet.text 
            puts "Precio Internet: " + text_precio_internet
        else
            puts "No hay precio internet"
        end

        precio_ripley = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/a/div[@class="catalog-product-details"]//div[@class="catalog-product-details__prices"]//li[@title="Precio Ripley"]')

        if precio_ripley.present? 
            text_precio_ripley = precio_ripley.text 
            puts "Precio Ripley: " + text_precio_ripley
        else
            puts "No hay precio ripley"
        end
        
        $producto = Producto.new("", nombre, "", precio_normal, precio_internet, precio_ripley, "", "", "", "", "", "")
        $lista_productos << $producto
    end

    def cambio_segunda_pagina
        sleep 5
        esperar_loading
        if @aceptar_cookies.present?
            $tools.click(@aceptar_cookies)
        end
        case $mobile
        when true        
            clickBtnSecondPage = $driver.execute_script("return arguments[0].click();", @btn_second_page)    
        else
            $tools.click(@btn_second_page)   
        end
    end

    def valido_cambio_pagina
        case $mobile
        when true
            $tools.esperar_elemento(@btn_second_page_active)
        else
            $tools.esperar_elemento(@btn_second_page_active)
        end 
        if @btn_second_page_active.present?
            puts "Se realiza cambio de página correctamente"
        else
            $tools.fallo("No se realiza el cambio de página")      
        end
    end

    def esperar_loading
        loading = $driver.element(xpath: '//div[@class="loading-screen"]')
        timeout = 0
        while(loading.present? && (timeout < 60))
            sleep 1
            timeout += 1
            puts "Cargando boton agregar a la bolsa"
        end
    end
end