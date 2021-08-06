When(/^Selecciono categoria Tercer Nivel "([^"]*)"$/) do |categoria|
    @search_result_4 = SearchResult4Page.new
    @search_result_4.filtrar_categoria_hija(categoria)
end

When(/^Selecciono filtro de categoria Tercer Nivel Mobile "([^"]*)"$/) do |filtrocategoria|
    @search_result_4 = SearchResult4Page.new
    @search_result_4.filtrar_categoria_hija_mobile(filtrocategoria)
end

When("Selecciono ultimo filtro") do
    @search_result_4 = SearchResult4Page.new
    @search_result_4.seleccionar_ultimo_filtro_faceta
end

When("Verifico que el filtro este seleccionado") do
    @search_result_4.verificar_filtro_seleccionado
end

When("Verifico que las facetas sean distintas") do
    @search_result_4 = SearchResult4Page.new
    @search_result_4.validar_facetas_distitas
end

And(/^Selecciono un Filtro random de la faceta "([^"]*)"$/) do |faceta|
    @search_result_4 = SearchResult4Page.new
    @search_result_4.filtrar_faceta(faceta)
end

When("Comparo cantidad de productos mostrados vs cantidad indicada en el filtro") do
    @search_result_4.comparar_cantidad_filtro_resultado
end

When("Verifico si se listan la cantidad de productos que indico el filtro") do
    @search_result_4.verificar_cantidad_items_filtrado
end

Then(/^Sumo la cantidad de productos de todos los filtros de la faceta "([^"]*)"$/) do |faceta|
    @search_result_4.sumar_cantidad_en_filtro(faceta)
  end

  When("Verifico que la suma sea correspondiente con el total de productos listados") do 
    @search_result_4.verificar_cantidad_filtro_vs_resultado
end

When("Verifico que los productos correspondan con el Filtro seleccionado") do
  @search_result_4.verificar_items_filtro_seleccionado
end

When("Elimino filtro aplicado") do 
  @search_result_4.eliminar_filtro
end

When("Verifico el listado que contenga la misma cantidad de productos anterior") do 
  @search_result_4.verificar_cantidad_antes_despues_eliminar_filtro
end

When("Realizo click en Limpiar filtros") do 
  @search_result_4.limpiar_filtros
end

When(/^Selecciono un metodo de ordenamiento "([^"]*)"$/) do |metodo|
  @search_result_4 = SearchResult4Page.new
  @search_result_4.seleccionar_ordenamiento(metodo)
end

Then(/^Verifico que los productos esten ordenados "([^"]*)"$/) do |metodo|
  @search_result_4 = SearchResult4Page.new
  case metodo
  when "Mayor Precio"
      @search_result_4.verificar_orden_mayor_menor
  when "Menor Precio"
      @search_result_4.verificar_orden_menor_mayor
  end
end

When("Por el paginador inferior selecciono la ultima pagina") do
  @search_result_4 = SearchResult4Page.new
  @search_result_4.pag_inf_ultima_pag
end

When("Realizo click en Producto Random") do
  @search_result_4 = SearchResult4Page.new
  @search_result_4.click_producto_random
end

And("Cambio a la segunda página de resultado") do
  @search_result_4 = SearchResult4Page.new
  @search_result_4.cambio_segunda_pagina
end

When("Valido que la página cambia correctamente") do
  @search_result_4.valido_cambio_pagina
end