When(/^Verifico que se muestren resultados de la categoria seleccionada "([^"]*)"$/) do |subcat|
    @search_result = SearchResultComunPage.new
    @search_result.validar_msg_resultados(subcat)
  end

When(/^Guardo cantidad de resultados de algolia "([^"]*)"$/) do |criterio|
    if criterio == "Texto"
        @search_result_algolia = SearchResultAlgoliaPage.new
        @search_result_algolia.guardar_estadistica_busqueda($sku)
    end
end

When(/^Guardo cantidad de resultados de catalogo "([^"]*)" "([^"]*)"$/) do |categoria, subcategoria|
    @search_result = SearchResultComunPage.new
    @search_result.guardar_estadistica_busqueda(categoria, subcategoria)
end


When("Capturo cantidad de productos listados") do 
    @search_result = SearchResultComunPage.new
    @search_result.capturo_cantidad_productos_listados
  end

  
When("Capturo cantidad de productos listados despues del filtro") do 
    @search_result = SearchResultComunPage.new
    @search_result.capturo_cantidad_productos_listados_despues_filtro
  end

  When("Capturo cantidad de productos listados despues de ordenamiento") do 
    @search_result = SearchResultComunPage.new
    @search_result.capturo_cantidad_productos_listados_despues_ordenamiento
  end

  Then(/^Verifico tipo de catalogo que se visualiza "([^"]*)"$/) do |columnas|
    @search_result = SearchResultComunPage.new
    @search_result.validar_columnas(columnas)
  end
  
  Then(/^Verifico activacion del quickview "([^"]*)"$/) do |quickview|
    @search_result.validar_quickview(quickview)
  end

  Then("Verifico que no se altero la cantidad de productos en el mensaje resultados") do
    @search_result.verificar_mantiene_cantidad_productos_despues_ordenamiento
  end