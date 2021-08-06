Then(/^Ingreso los datos del medio de Pago Transbank "([^"]*)"$/) do |medio|
    @transbank = TransbankPage.new
    @transbank.ingreso_datos_medio_pago_transbank(medio)
end

Then(/^Ingreso los datos de tarjeta de credito en cuotas "([^"]*)" "([^"]*)"$/) do |medio, cuotas|
    @transbank = TransbankPage.new
    @transbank.ingreso_datos_tarjeta_credito_con_cuotas(medio, cuotas)
end

Then("Valido se abra pasarela de pago de Redbank") do 
    @transbank = TransbankPage.new
    @transbank.validar_pasarela_webpay
end

Then("Valido se abra pasarela de pago de Webpay") do 
    @transbank = TransbankPage.new
    @transbank.validar_pasarela_transbank
end

Then("Verifico mensaje indicando que validara el medio de pago con Webpay") do 
    @transbank = TransbankPage.new
    @transbank.validar_mensaje_validacion_webpay
end

Then("Indico Continuar en mensaje de validacion de Webpay") do 
    @transbank.click_continuar_mensaje_validacion
end


