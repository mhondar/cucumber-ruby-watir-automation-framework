Then("Valido pagina de confirmacion exitosa old") do
    @confirmacion = ConfirmacionPageold.new
    @confirmacion.verificar_pagina_confirmacion_presente
end

And("Acepto las condiciones de compra old") do
    @confirmacion.click_aceptar_terminos
end

And("Realizo click en continuar para confirmar old") do
    @confirmacion.click_Continuar
end
