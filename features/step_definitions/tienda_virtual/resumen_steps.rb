Then("Verifico se muestre pantalla de resumen") do
    @resumen = ResumenPage.new
    @resumen.verificar_pantalla_resumen
end

Then("Verifico se muestre codigo de confirmacion de la compra") do
  @resumen.verificar_codigo_confirmacion
end

Then("Verifico el Monto Total de la compra") do
  @resumen.verificar_monto_total
end

Then("Verifico Descuento aplicado en Pagina de Resumen") do
  @resumen.verificar_descuento
end

Then("Verifico el codigo Club utilizado en pantalla de resumen") do
  @resumen.verificar_codigo_club
end


  Then("Realizo click en boton Finalizar") do
    @resumen.click_finalizar
  end
  
  