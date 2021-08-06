Then("Verifico que se muestre la pagina de Pago old") do 
    @pago = PagoPageold.new
    @pago.verifico_pagina_pago
end

Then("Selecciono el medio de pago old") do 
    @pago.click_tarjeta_Ripley
end

Then("Realizo click en Continuar old") do
    @pago.click_continuar
end

And(/^Selecciono comprobante de pago Old "([^"]*)"$/) do |comprobante|
    @pago.seleccionar_comprobante(comprobante)
end

Then("Completo datos de la Factura Old") do
    @pago.completo_datos_factura
  end



