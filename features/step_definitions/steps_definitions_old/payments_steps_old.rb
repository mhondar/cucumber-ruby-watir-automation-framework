Then("Valido pagina de ingreso de datos de pago old") do 
    @pago = PaymentsOld.new
    @pago.verifico_pagina_pago
end

Then(/^Ingreso los datos del medio de Pago old "([^"]*)"$/) do |medio|
    @pago = PaymentsOld.new
    @pago.ingreso_datos_medio_pago (medio)
end