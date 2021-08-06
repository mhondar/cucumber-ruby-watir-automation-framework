require './features/page_objects/tienda_virtual/search_result_comun_page.rb'
class SearchResultPage < SearchResultComunPage
 
    def initialize
        selectors = JSON.parse(File.read("./features/selectors/search_result_selectors.json"))
        @list_items_products = $driver.elements(xpath: selectors["search"]["list_item_product"])
        @no_search = $driver.element(xpath: selectors["search"]["no_search"])
        @result_msg_algolia = $driver.element(xpath: selectors["search"]["result_msg"])
    end

    def validar_elimina_palabra_desconocida (criterio, palabraDesonocida)
        sleep 5
        $tools.esperar_elemento(@result_msg_algolia)
        resultado = @result_msg_algolia.text

        if resultado.include? palabraDesonocida
            $tools.fallo "No se elimina palabra desconocida"
        else
            puts "Se elimina palabra desconocida"
        end

        if resultado.include? criterio
            puts "OK Mensaje de resultados de #{criterio}"
        else
            $tools.fallo "No se muestra resultados para #{criterio}, mensaje mostrado #{resultado}"
        end

    end

    def validar_msg_resultados(dato)
        # begin
            sleep 5
            $tools.esperar_elemento(@result_msg_algolia)
            resultado = @result_msg_algolia.text
            if resultado.include? dato
                puts "OK Mensaje de resultados de #{dato}"
            else
                $tools.fallo "No se muestra resultados para #{dato}, mensaje mostrado #{resultado}"
            end
        # rescue
        #     if @no_search.present?
        #         $tools.fallo("No se encontraron resultados para esta busqueda")
        #     else
        #         $tools.fallo("Caso no mapeado")
        #     end
        # end
    end

    def validar_items_productos_contenidos_argolia
        cantidad_items_pagina = @list_items_products.count
        if cantidad_items_pagina > 0
            puts "Se muestran #{cantidad_items_pagina} productos en la primera pagina"
        else
            $tools.fallo("No se muestran producto en la pagina #{cantidad_items_pagina}")
        end
    end

    def guardar_estadistica_busqueda(dato)
        cantidad = @result_msg_algolia.text.gsub(/[^0-9]/, '')
        puts "Se encontraron #{cantidad} resultados para #{dato}"
        $tools.ask_and_crear_file("features/logs", "search_result_argolia.csv")
        CSV.open("features/logs/search_result_argolia.csv", "a+") do |csv|
            csv << [dato, cantidad]
        end
    end
end