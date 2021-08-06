Then("Valido pagina de confirmacion exitosa") do
    @confirmacion = ConfirmacionPage.new
    @confirmacion.verificar_pagina_confirmacion_presente
end

Then("Acepto las condiciones de compra") do
    @confirmacion.aceptar_condiciones
end

Then("Realizo click en continuar para confirmar") do
    @confirmacion.click_continuar
end

Then("Realizo click en Debito para confirmar") do
    @confirmacion.click_Debito
end

Then("Realizo click en Modificar Despacho") do
    @confirmacion.click_modificar_despacho
end

Then("Realizo click en Modificar Pago") do
    @confirmacion.click_modificar_pago
end

Then("Verifico direccion de despacho en Confirmacion sea correcta") do
    @confirmacion.verificar_direccion_despacho
end

Then("Verifico fecha de despacho en Confirmacion sea correcta") do
    @confirmacion.verificar_fecha_despacho
end

Then("Verifico horario de despacho en Confirmacion sea correcta") do
    @confirmacion.verificar_horario_despacho
end

Then("Verifico nombre del producto de despacho en Confirmacion sea correcta") do
    @confirmacion.verificar_nombre_producto_despacho
end

Then("Verifico Documento Tributario sea correcto") do 
    @confirmacion.verifico_documento_tributario
end

Then("Verifico el Email de destino del documento sea correcto") do 
    @confirmacion.verifico_correo_tributario
end

Then("Verifico que el Tipo de Medio de Pago sea correcto") do 
    @confirmacion.verifico_tipo_medio_pago
end

Then("Verifico que se muestren los productos agregados en Confirmacion") do 
    @confirmacion.verificar_productos_confirmacion
end

Then("Verifico cantidad del producto en Confirmacion") do
    @confirmacion.verifico_cantidad_confirmacion
end

Then(/^Verifico precio unidad en confirmacion del producto "([^"]*)"$/) do |precio|
    @confirmacion.verifico_precio_unidad_caja_precio(precio)
end

Then("Verifico Subtotal del Pago en Confirmacion") do 
    @confirmacion.verifico_subtotal_caja_precio
end

Then("Verifico Costo de Despacho en Confirmacion") do 
    @confirmacion.verifico_despacho_caja_precio
end

Then("Verifico Total normal en Confirmacion") do 
    @confirmacion.verifico_total_normal_caja_precio
end

Then("Verifico Total Tarjeta Ripley en Confirmacion") do 
    @confirmacion.verifico_total_ripley_caja_precio
end

Then("Realizo click en Agregar mas productos en Confirmacion") do
    @confirmacion.click_agregar_mas_productos
  end

  Then(/^Verifico mensaje de alerta "([^"]*)"$/) do |mensaje|
    @confirmacion.verificar_alerta_debe_aceptar(mensaje)
  end

And("Realizo click en tarjeta de debito") do
    @confirmacion.click_tarjeta_de_debito
end

  

  











