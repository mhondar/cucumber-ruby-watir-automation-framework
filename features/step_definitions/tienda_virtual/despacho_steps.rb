Then("Verifico que se muestre pagina de despacho") do
    @despacho = DespachoPage.new
    @despacho.verificar_despacho_cargado
end

Then("Verifico que se muestre pagina de despacho para crear direccion") do
    @despacho = DespachoPage.new
    @despacho.verificar_despacho_new_dir_cargado
end

Then("Realizo click en continuar al Pago") do
    @despacho.click_continuar
end

Then("Verifico descuento aplicado por el cupon de descuento") do
    @despacho.verifico_cupon_descuento_aplicado
  end

Then(/^Creo la direccion con despacho "([^"]*)"$/) do |despacho|
    @despacho.crear_direccion_despacho(despacho)
end

Then(/^Creo la direccion nueva con despacho "([^"]*)"$/) do |despacho|
    @despacho.crear_direccion_despacho_nueva(despacho)
end

Then("Selecciono otra direccion registrada") do
    @despacho.seleccionar_otra_direccion
end

Then(/^Agrego nueva direccion con despacho "([^"]*)"$/) do |despacho|
    @despacho.agregar_nueva_direccion(despacho)
end

Then(/^Modifico la direccion principal con despacho "([^"]*)"$/) do |despacho|
    @despacho.modificar_direccion_principal(despacho)
end

Then(/^Selecciono tipo de despacho "([^"]*)"$/) do |despacho|
    @despacho.seleccionar_tipo_despacho(despacho)
end

Then(/^Indico quien retira en tienda "([^"]*)"$/) do |retiro|
    @despacho.indicar_quien_retira(retiro)
end

Then("Selecciono otra opcion de despacho por defecto") do
    @despacho.seleccionar_otra_opcion_entrega
end

Then(/^Selecciono tienda con retiro "([^"]*)"$/) do |retiro|
    @despacho.seleccionar_tienda(retiro)
end

Then("Selecciono Retiro en Tienda") do
    @despacho.seleccionar_retiro_tienda
end

Then(/^Selecciono zona de despacho "([^"]*)"$/) do |criterio|
    @despacho.seleccionar_zona(criterio)
end

Then(/^Valido que se muestren tiendas "([^"]*)"$/) do |criterio|
    @despacho.validar_tiendas(criterio)
end

Then(/^Selecciono una tienda "([^"]*)"$/) do |criterio|
    @despacho.seleccionar_tienda_criterio(criterio)
end

Then(/^Valido que la tienda quede seleccionada$/) do
    @despacho.validar_tienda_seleccionada
  end

  Then(/^Realizo click en Selecciona otra Tienda "([^"]*)"$/) do |criterio|
    @despacho.click_seleccionar_otra_tienda(criterio)
  end

Then("Selecciono mas opciones de entrega") do
    @despacho.seleccionar_mas_opciones_entrega
end

Then("Verifico concistencia en los precios en despacho") do
    @despacho.verificar_concistencia_precios
end

Then("Verifico el Total de la compra") do
    @despacho.verificar_total_compra
end

Then("Verifico que se muestren los productos agregados en despacho") do
    @despacho.verificar_productos_despacho
end

Then("Realizo click en Modificar compra de Depacho") do
    @despacho.click_modificar_compra
end

Then("Realizo click en Agregar mas productos") do
    @despacho.click_agregar_productos
end

Then("Verifico cantidad del producto en Despacho") do
    @despacho.verifico_cantidad_despacho
end

Then(/^Verifico "([^"]*)" del producto en caja de precios$/) do |variacion|
    @despacho.verifico_variacion_caja_precio(variacion)
end

Then(/^Verifico precio unidad en despacho del producto "([^"]*)"$/) do |precio|
    @despacho.verifico_precio_unidad_caja_precio(precio)
  end

  Then(/^Verifico Subtotal del despacho$/) do
    @despacho.verifico_subtotal_caja_precio
  end

  Then(/^Verifico Total normal del despacho$/) do
    @despacho.verifico_total_normal_caja_precio
  end

  Then(/^Verifico Total Tarjeta Ripley del despacho$/) do
    @despacho.verifico_total_ripley_caja_precio
  end

  Then(/^Verifico Precio del Despacho$/) do
    @despacho = DespachoPage.new
    @despacho.verifico_despacho_caja_precio
  end

  Then(/^Realizo click en Bolsa de compra de la Miga de Pan$/) do
    @despacho = DespachoPage.new
    @despacho.click_bolsa_compras
  end