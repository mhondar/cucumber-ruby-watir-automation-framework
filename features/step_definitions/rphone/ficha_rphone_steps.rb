Then("Confirmo que me encuentro en ficha de productos rphone") do
    @home_rphone = RPhoneFichaPage.new 
    @home_rphone.valida_ficha_producto
end

Then("Valido que se muestre ficha con informacion del plan elegido") do
    @home_rphone = RPhoneFichaPage.new 
    @home_rphone.valida_plan_producto_seleccionado
end

Then ("Valido que se muestre el precio normal del producto rphone") do
    @home_rphone = RPhoneFichaPage.new 
    @home_rphone.valida_precio_normal
end


Then("Valido que se muestre el precio descuento del producto") do
    @home_rphone.valida_precio_descuento
end

Then("Valido que se muestre el precio Valor Celular con Plan del producto") do
    @home_rphone.valida_precio_valor_celular
end

Then("Realizo clic en link Elegir Otro Plan") do
    @home_rphone = RPhoneFichaPage.new 
    @home_rphone.valida_link_elegir_plan
end


Then("Valido que se despliegue sección Elige tu Plan") do
    @home_rphone.valida_seccion_elegir_plan
end

And("Presiono link Ver Caracteristicas") do
    @home_rphone.presiona_link_caracteristicas
end

Then("Valido que se despliegue sección Caracteristicas del Celular") do
    @home_rphone.valida_seccion_caracteristicas
end

Then("Selecciono un nuevo Plan random") do
    @home_rphone.selecciona_nuevo_plan
end

Then("Valido que se actualice la información correctamente") do
    @home_rphone.valida_actualizacion_datos_plan
end

Then ("Verifico que se abra la ficha del producto que corresponda") do
    @home_rphone = RPhoneFichaPage.new 
    @home_rphone.veriicar_abra_ficha_productos
end
