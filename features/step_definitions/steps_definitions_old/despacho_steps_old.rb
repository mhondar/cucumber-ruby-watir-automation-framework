Then(/^Selecciono tipo de despacho old "([^"]*)"$/) do |despacho|
    @despacho = DespachoPageOld.new
    @despacho.seleccionar_tipo_despacho_old(despacho)
end

And("Verifico que se muestre la pagina de Despacho Old") do
    @despacho = DespachoPageOld.new
    @despacho.verifico_pagina_despacho
end

And ("Creo la direccion con despacho Old") do
    @despacho.crear_direccion_invitado
end

And ("Realizo click en continuar en despacho Old") do
    @despacho.click_continuar
end

And (/^Selecciono tienda con retiro old "([^"]*)"$/) do |retiro|
    @despacho.seleccionar_tienda(retiro)
end

Then(/^Indico quien retira en tienda old "([^"]*)"$/) do |retiro|
    @despacho.indicar_quien_retira(retiro)
end