Then(/^Ingreso el rut para buscar mi cuenta "([^"]*)"$/) do |rut|
    @recover_pass = RecoverPassPage.new
    @recover_pass.ingreso_rut_forgot_password(rut)
  end

  Then("Realizo click en buscar cuenta") do
    @recover_pass.click_buscar_cuenta
  end
  
  Then(/^Valido mensaje Revisa tu correo, enviamos un email a "([^"]*)"$/) do |correo|
    @recover_pass.validar_mensaje_correo(correo)
  end

  Then("Valido se muestre pantalla Ingresa con tu contraseña temporal") do
    @recover_pass.validar_pantalla_ingreso_password_temporal
  end
  
  Then("Reviso manualmente el correo y capturo la contraseña temporal") do
   puts "Revisa el correo el mensaje del sistema donde se encuentra contraseña temporal"
  end

  Then(/^Ingreso contraseña en pantalla de recuperacion manualmente, sleep (\d+)$/) do |time|
    puts "PEGA PASSWORD  TEMPORAL"
    sleep time
  end

  Then("Realizo click en Ingresar") do
    @recover_pass.click_ingresar
  end
  
  Then("Valido se muestre pantalla de Crear una nueva contraseña") do
    @recover_pass.validar_pagina_crear_contraseña
  end
  
  Then(/^Ingreso nueva contraseña "([^"]*)"$/) do |pass|
    @recover_pass.ingresar_nueva_contrasenna(pass)
  end
  
  Then(/^Ingreso repetir nueva contraseña "([^"]*)"$/) do |pass|
    @recover_pass.ingresar_repetir_contrasenna(pass)
  end
  
  Then("Realizo click en Guardar contraseña") do
    @recover_pass.click_guardar_password
  end
  
  Then("Valido cambio de contrasenna con exito") do
    @recover_pass.validar_cambio_password_exitoso
  end

  Then("Realizo click en ir a mi cuenta") do
    @recover_pass.click_ir_a_mi_cuenta
  end

  