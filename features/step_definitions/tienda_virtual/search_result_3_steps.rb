When("Realizo click en Filtrar") do
    @search_result_3 = SearchResult3Page.new
    @search_result_3.click_filtrar
end

When(/^Selecciono filtro de categoria Tercer Nivel "([^"]*)"$/) do |categoria|
  @search_result_3 = SearchResult3Page.new
    @search_result_3.filtrar_categoria_hija(categoria)
  end

  Then(/^Selecciono Filtro random de la faceta "([^"]*)"$/) do |faceta|
    @search_result_3.filtrar_faceta(faceta)
  end

  When(/^Selecciono Filtro "([^"]*)" de la faceta "([^"]*)"$/) do |filtro, faceta|
    @search_result_3.realizo_filtro_faceta(filtro, faceta)
  end

  When("Comparo la cantidad de productos mostrados con la cantidad indicada en el filtro") do
    @search_result_3.comparar_cantidad_filtro_resultado
end

When("Verifico que se muestre el filtrado seleccionado") do
    @search_result_3.verificar_filtro_seleccionado
end

When("Verifico que se listen la cantidad de productos que indica el filtro") do
    @search_result_3.verificar_cantidad_items_filtrado
end

When("Verifico que los productos quickview correspondan con el Filtro seleccionado") do
    @search_result_3.verificar_items_quickview_filtro_seleccionado
end

Then(/^Sumo cantidad de productos de todos los filtros de la faceta "([^"]*)"$/) do |faceta|
    @search_result_3.sumar_cantidad_en_filtro(faceta)
  end

  When("Verifico que la suma de sea correspondiente con el total de productos listados") do 
    @search_result_3.verificar_cantidad_filtro_vs_resultado
end

When("Elimino el filtro aplicado") do 
  @search_result_3.eliminar_filtro
end

When("Limpio los filtros") do 
  @search_result_3.limpiar_filtros
end

When("Verifico que el listado contenga la misma cantidad de productos anterior") do 
  @search_result_3.verificar_cantidad_antes_despues_eliminar_filtro
end

When("Selecciono ultima faceta del listado") do
  @search_result_3.seleccionar_ultimo_filtro_faceta
end

When("Verifico que todas las facetas sean distintas") do
  @search_result_3.validar_facetas_distitas
end

When(/^Selecciono metodo de ordenamiento "([^"]*)"$/) do |metodo|
  @search_result_3 = SearchResult3Page.new
  @search_result_3.seleccionar_ordenamiento(metodo)
end

Then(/^Verifico que efectivamente los productos esten ordenados "([^"]*)"$/) do |metodo|
  @search_result_3 = SearchResult3Page.new
  case metodo
  when "Mayor Precio"
      @search_result_3.verificar_orden_mayor_menor
  when "Menor Precio"
      @search_result_3.verificar_orden_menor_mayor
  end
end

When("Por el paginador superior voy a la ultima pagina") do
  @search_result_3 = SearchResult3Page.new
  @search_result_3.pag_sup_ultima_pag
end

When("Por el paginador inferior voy a la ultima pagina") do
  @search_result_3 = SearchResult3Page.new
  @search_result_3.pag_inf_ultima_pag
end

When("Verifico que una muestra de productos abra el quickview") do
  @search_result_3 = SearchResult3Page.new
  @search_result_3.verificar_abra_quick_view
end

When("Abro el QuickView de un producto random") do
  @search_result_3 = SearchResult3Page.new
  @search_result_3.abrir_quick_view_producto_random
end

When(/^Abro el QuickView de un producto que posea "([^"]*)"$/) do |precio|
  @search_result_3 = SearchResult3Page.new
  @search_result_3.abrir_quickview_producto_con_precio(precio)
end

And("Presiono Boton Volver desde el navegador") do
  @search_result_3 = SearchResult3Page.new
  @search_result_3.presionar_boton_back_browser
end

Then(/^Verifico que me regrese a la pagina anterior correspondiente "([^"]*)"$/) do |dato|
  @search_result_3.verificar_accion_boton_back_browser(dato)
end
  