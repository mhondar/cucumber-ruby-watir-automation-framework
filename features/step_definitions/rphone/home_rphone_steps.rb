And("Verifico se muestre Home principal de rphone") do
  @home_rphone = RPhoneHomePage.new 
  @home_rphone.verificar_open_home_rphone
end

When("Realizo clic en boton Equipo + Plan") do
  @home_rphone = RPhoneHomePage.new 
  @home_rphone.clic_ir_plan
end  


When("Realizo clic en botón Ver detalles") do
  @home_rphone = RPhoneHomePage.new 
  @home_rphone.clic_ver_detalles
end

And("Realizo clic en imagen de producto") do
  @home_rphone = RPhoneHomePage.new 
  @home_rphone.clic_imagen_producto
end
