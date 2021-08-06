Then("Verifico que se muestre la pagina de Pago") do 
    @pago = PagoPage.new
    @pago.verifico_pagina_pago
end

Then(/^Selecciono el medio de pago "([^"]*)"$/) do |medio|
    @pago.selecciono_medio_pago(medio)
end

Then(/^Selecciono el Documento Tributario "([^"]*)"$/) do |doc_tributario|
    @pago.seleccionar_doc_tributario(doc_tributario)
end

Then("Registro Factura") do 
    @pago.registrar_factura
end

Then("Modifico la Factura") do 
    @pago.modificar_factura
end

Then("Verifico que se muestren los productos agregados en pago") do 
    @pago.verificar_productos_pago
end

Then("Realizo click en Debito") do 
    @pago.click_debito_webpay
end

Then(/^Ingreso los datos del medio de Pago "([^"]*)"$/) do |medio|
    @pago.ingreso_datos_medio_pago(medio)
end

Then(/^Ingreso los datos del medio de Pago Webpay "([^"]*)"$/) do |medio|
    @pago.ingreso_datos_medio_pago_wp(medio)
end

Then(/^Ingreso cvv y cuotas de tarjeta guardada "([^"]*)" "([^"]*)"$/) do |medio, cuotas|
    @pago.ingreso_cvv_cuotas_tarjeta_guardada(medio, cuotas)
end

Then(/^Selecciono Pago Diferido "([^"]*)"$/) do |pago|
    @pago.selecciono_pago_diferido(pago)
end

Then(/^Selecciono la cantidad de cuotas "([^"]*)"$/) do |cuotas|
    @pago.selecciono_cuotas(cuotas)
end

Then(/^Verifico que este seleccionado el medio de Pago "([^"]*)"$/) do |medio|
    @pago.verifico_medio_pago_seleccionado(medio)
end

Then("Verifico concistencia de los precios en pago") do 
    @pago.verifico_consistencia_precios
end

Then("Verifico Subtotal del Pago") do 
    @pago.verifico_subtotal_caja_precio
end

Then("Verifico Costo de Despacho del Pago") do 
    @pago.verifico_despacho_caja_precio
end

Then("Verifico Total normal del Pago") do 
    @pago.verifico_total_normal_caja_precio
end

Then("Verifico Total Tarjeta Ripley del Pago") do 
    @pago.verifico_total_ripley_caja_precio
end

Then("Realizo click en Modificar compra en Pago") do
    @pago.click_modificar_compra
  end

  Then("Realizo click en Agregar mas productos en Pago") do
    @pago.click_agregar_mas_productos
  end

  Then(/^Verifico que se muestre informacion de la "([^"]*)" xxxx$/) do |medio|
        @pago.verificar_tarjeta_terminada_xxxx(medio)
  end

Then(/^Verifico que se muestre documento tributario seleccionado "([^"]*)"$/) do |documento|
    @pago.verificar_documento_seleccionado(documento)
end

Then("Verifico cantidad del producto en Pago") do
    @pago.verifico_cantidad_pago
end


Then("Verifico cupon de descuento en pago") do 
    @pago.verificar_cupon_de_descuento
end

Then(/^Verifico precio unidad en pago del producto "([^"]*)"$/) do |precio|
    @pago.verifico_precio_unidad_caja_precio(precio)
  end
  
  Then("Realizo click en Despacho de la Miga de Pan") do
    @pago.click_miga_despacho
  end

Then("Realizo click en Continuar") do
    @pago.click_continuar
  end
