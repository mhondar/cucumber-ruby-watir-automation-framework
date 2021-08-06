Then("Valido que se cargue la PreBolsa de productos") do
  @bolsa = BolsaCompraPage.new 
  @bolsa.validar_prebolsa_cargada_ok
end

Then("Valido que se cargue la Bolsa de productos") do
@bolsa = BolsaCompraPage.new 
  @bolsa.validar_bolsa_cargada_ok
end

Then(/^Ingreso la cantidad del producto en la Bolsa (\d+)$/) do |cant|
    @bolsa.ingresar_cantidad_productos(cant)
  end

  Then(/^Valido que se muestra la cantidad seleccionada (\d+)$/) do |cant|
    @bolsa.validar_cantidad_productos(cant)
  end

Then(/^Elimino producto de la bolsa (\d+)$/) do |num_producto|
  @bolsa.elimino_producto_bolsa(num_producto)
end

Then("Elimino todos los productos de la bolsa") do
  @bolsa.elimino_todos_productos_bolsa
end

Then("Elimino todos los cupones de descuentos aplicados") do
  @bolsa.elimino_todos_cupones_de_descuento
end

Then(/^Ingreso Cupon de Descuento "([^"]*)"$/) do |cupon|
  @bolsa.ingreso_cupon_descuento(cupon)
end

Then(/^Ingreso codigo RClubes "([^"]*)"$/) do |codigo|
  @bolsa.ingreso_codigo_rclubes(codigo)
end

Then("Verifico codigo RClubes aplicado") do
  @bolsa.verifico_cupon_rclubes_aplicado
end

Then("Verifico cupon de descuento aplicado") do
  @bolsa.verifico_cupon_descuento_aplicado
end

Then("Verifico que la bolsa este vacia") do
  @bolsa.verificar_empty_bag
end

Then("Elimino producto decrementando la cantidad") do 
  @bolsa.elimino_producto_decrementando_cantidad(1)
end

Then("Valido consistencia de datos de detalle de producto vs bolsa") do
  @bolsa.validar_datos_detalle_vs_bolsa
end

Then("Valido lista de productos en la bolsa") do
  @bolsa.validar_lista_productos
end

Then(/^Garantizo que la Bolsa solo contenga la cantidad "([^"]*)"$/) do |cant_limite|
  cant =  @bolsa.cantidad_elementos_bolsa
  cant_borrar = cant - cant_limite.to_i
  if cant != cant_limite.to_i
    for i in(1..cant_borrar)
      puts "Borro #{i}"
      @bolsa.elimino_producto_bolsa(1)
      sleep 3
    end 
  end
end

Then("Realizo click en Continuar con mi compra") do
  @bolsa = BolsaCompraPage.new  
  @bolsa.click_continuar_compra
end

Then("Compruebo si existe Popup") do
  @bolsa.popup_sorpresas
end

Then("Realizo clik en icono de Ripley") do
  @bolsa.click_ripley_icon
end

Then("Valido que el producto de la Bolsa sea el correcto") do
  @bolsa.validar_producto_bolsa
end

Then("Agrego a la bolsa desde la recomendaciones") do
  @bolsa.agregar_bolsa_recomendaciones
end

Then("Valido en Bolsa el Item del Producto contenga precio correcto") do
  @bolsa.validar_precio_producto_bolsa
end

Then("Valido en Bolsa en Caja de Precio el Subtotal") do
  @bolsa.validar_caja_precio_subtotal
end

Then("Valido en Bolsa en Caja de Precio Total sin agregar Descuentos") do
  @bolsa.validar_caja_precio_total_sin_descuentos
end

Then("Valido en Bolsa en Caja de Precio Ripley sin agregar Descuentos") do
  @bolsa.validar_caja_precio_ripley_sin_descuentos
end

Then("Valido la cantidad del producto en la Bolsa") do
  @bolsa.validar_cantidad_producto
end

Then("Valido que precio internet de ficha sea igual a precio Total normal en la Bolsa") do
  @bolsa.validar_precio_Internet
end

Then("Valido que se muestre el SubTotal") do
  @bolsa.validar_sub_Total
end


Then("Valido que se muestre el precio Total Normal") do
  @bolsa.validar_precio_total_normal
end

Then("Valido que se muestre el precio Ripley") do
  @bolsa.validar_precio_ripley
end

Then("Valido que se agregue el producto correctamente de recomendaciones") do 
  @bolsa.validar_producto_recomendacion
end

