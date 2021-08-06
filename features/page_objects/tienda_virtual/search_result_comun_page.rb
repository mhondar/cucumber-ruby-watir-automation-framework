class SearchResultComunPage
    def initialize
        selectors = JSON.parse(File.read("./features/selectors/search_result_selectors.json"))
            case $mobile
            when true 
                @result_msg_catalog = $driver.element(xpath: selectors["mobile"]["result_msg_catalogo"])
            else    
                @list_items_products = $driver.elements(xpath: selectors["search"]["list_item_product"])
                @no_search = $driver.element(xpath: selectors["search"]["no_search"])
                @result_msg_catalog = $driver.element(xpath: selectors["comun"]["result_msg_catalogo"])
            end
    end

    def validar_msg_resultados(dato)
        timeout = 0
            sleep 3
        if $mobile 
            # lista_pagina = $driver.element(xpath: '//div[@class="tree-node tree-node-level-2 menu-transition-to-left-enter-done"]/section/div/a[contains(text(), "Ver todo")]')
            # # $tools.esperar_elemento(xpath: '//div[@class="tree-node tree-node-level-2 menu-transition-to-left-enter-done"]/section/div/a[contains(text(), "Ver todo")]')
            # if lista_pagina.present?
            #     puts "se lista categoria tercer nivel correctamente"
            #     else 
            #         $tools.fallo "No se lista categoria tercer nivel"
            #     end          
            $tools.esperar_elemento(@result_msg_catalog)
            resultado = @result_msg_catalog.text          
        else
            $tools.esperar_elemento(@result_msg_catalog)
            resultado = @result_msg_catalog.text
       
        if resultado.include? dato
            puts "OK Mensaje de resultados de #{dato}"
        else
            $tools.fallo "No se muestra resultados para #{dato}, mensaje mostrado #{resultado}"
        end
    end        
    end

    def guardar_estadistica_busqueda(categoria, subcategoria)

        if $mobile
            $tools.esperar_elemento(@result_msg_catalog)
            cantidad = @result_msg_catalog.text.gsub(/[^0-9]/, '')
            puts "Se encontraron #{cantidad} resultados para #{subcategoria} en #{categoria}"
            $tools.ask_and_crear_file("features/logs", "search_result_catalogo.csv")
            CSV.open("features/logs/search_result_catalogo.csv", "a+") do |csv|
            csv << [categoria, subcategoria, cantidad]
        end

        else


        $tools.esperar_elemento(@result_msg_catalog)
        cantidad = @result_msg_catalog.text.gsub(/[^0-9]/, '')
        puts "Se encontraron #{cantidad} resultados para #{subcategoria} en #{categoria}"
        $tools.ask_and_crear_file("features/logs", "search_result_catalogo.csv")
        CSV.open("features/logs/search_result_catalogo.csv", "a+") do |csv|
            csv << [categoria, subcategoria, cantidad]
        end
    end
    
    end

    def capturo_cantidad_productos_listados
        $tools.esperar_elemento(@result_msg_catalog)
        $cantidad_listado = @result_msg_catalog.text.gsub(/[^0-9]/, '').to_i
        puts "Se encontraron #{$cantidad_listado}"
    end

    
    def capturo_cantidad_productos_listados_despues_filtro
        $tools.esperar_elemento(@result_msg_catalog)
        $cantidad_listado_despues_filtro = @result_msg_catalog.text.gsub(/[^0-9]/, '').to_i
        puts "Se encontraron #{$cantidad_listado_despues_filtro}"
    end

    def capturo_cantidad_productos_listados_despues_ordenamiento
        $tools.esperar_elemento(@result_msg_catalog)
        $cantidad_listado_despues_ordenamiento = @result_msg_catalog.text.gsub(/[^0-9]/, '').to_i
        puts "Se encontraron #{$cantidad_listado_despues_ordenamiento}"
    end

    def verificar_mantiene_cantidad_productos_despues_ordenamiento
        if $cantidad_listado == $cantidad_listado_despues_ordenamiento
            puts "Coinciden las cantidades de productos antes y despues de ordenamiento"
        else
            $tools.fallo("No coinciden la cantidad de productos antes #{$cantidad_listado} y despues de ordenamiento #{$cantidad_listado_despues_ordenamiento}")
        end
    end


    def validar_columnas(columnas)
        case columnas
        when "4"
            resultado_esperado =$driver.element(xpath: '//div[@class="catalog-page"]//aside[@class="catalog-filters"]')
        when "3"
            resultado_esperado =$driver.element(xpath: '//section[@class="catalog-grid catalog-moda"]')
        end
        $tools.esperar_elemento(resultado_esperado)
    end

    def validar_quickview(quickview)
        item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/a[1]/div[@class="proportional-image-wrapper catalog-product__image-preview"]')
        $tools.click(item_selected)
        case quickview
        when "Si"
            resultado_esperado = $driver.button(xpath: '//button[@class="simple-modal-close-button"]')
        when "No"
            resultado_esperado = $driver.element(xpath: '//div[@class="react-product-page"]')
        end
        $tools.esperar_elemento(resultado_esperado)
    end
end