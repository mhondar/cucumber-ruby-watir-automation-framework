
    
When("Verifico que la cantidad del producto no puede ser menor a 1") do
    @quickview = QuickViewPage.new
    @quickview.verifico_cantidad_no_menor_uno
  end
  
  When("Ingreso la cantidad de producto random y valido en el QuickView") do
    @quickview = QuickViewPage.new
    @quickview.ingreso_cantidad_random_quickview
  end
  
  When(/^Ingreso la cantidad de producto en el QuickView (\d+)$/) do |cantidad|
    @quickview = QuickViewPage.new
    @quickview.ingresar_cantidad_quickview(cantidad)
  end
  
  When(/^Ingreso cantidad sin restricciones de producto en el QuickView (\d+)$/) do |cantidad|
    @quickview = QuickViewPage.new
    @quickview.ingresar_cantidad_sin_restricciones_quickview(cantidad)
  end
  
  Then("Valido que no se ingreso cantidad mayor a nueve") do
    @quickview = QuickViewPage.new
    @quickview.validar_cantidad_quickview_no_mayor_nueve
  end
  
  Then("Verifico que se muestre label Selecciona opciones") do
    @quickview = QuickViewPage.new
    @quickview.validar_label_selecciona_opciones
  end
  
  Then("Selecciono opcion del producto en QuickView random") do
    @quickview = QuickViewPage.new
    @quickview.seleccionar_opciones_producto_quickview_random
  end
  
  Then("Valido se active boton Agregar a la bolsa del QuickView") do
    @quickview = QuickViewPage.new
    @quickview.validar_activacion_button_add_bolsa
  end
  
  Then("Realizo click en Agregar a la bolsa del QuickView") do
    @quickview = QuickViewPage.new
    @quickview.agregar_a_bolsa_quick_view
  end

  Then("Realizo click en Ver mas detalles") do
    @quickview = QuickViewPage.new
    @quickview.click_ver_mas_detalles
  end

  Then("Realizo click en titulo del producto") do
    @quickview = QuickViewPage.new
    @quickview.click_titulo_producto
  end

  