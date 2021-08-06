Then("Valido que se muestre pantalla de Bienvenida") do
  @login_invitado = LoginInvitadoPage.new
  @login_invitado.validar_pantalla_bienvenida
end

Then(/^Realizo inicio de sesion en pantalla de Bienvenida "([^"]*)"$/) do |medio|
    @login_invitado = LoginInvitadoPage.new
    @login_invitado.ingresar_credenciales_login(medio)
  end

  Then(/^En Bienvenido a Riple Ingreso el Rut "([^"]*)"$/) do |rut|
    @login_invitado.ingresar_rut_bienvenido(rut)
  end

  Then(/^En Bienvenido a Riple Ingreso el Password "([^"]*)"$/) do |pass|
    @login_invitado.ingresar_pass_bienvenido(pass)
  end

  Then("Relizo click en Iniciar Sesion") do
    @login_invitado.click_iniciar_sesion
  end

  Then("Realizo click en Olvidaste tu contraseña de Pantalla de Bienvenida") do
    @login_invitado.click_forgot_password
  end

  Then(/^Ingreso como invitado en pantalla de Bienvenida "([^"]*)"$/) do |medio|
    @login_invitado = LoginInvitadoPage.new
    @login_invitado.ingresar_invitado_medio(medio)
    $invitado_nuevo = true
  end

  Then("Realizo click en Ingresar de la Pantalla de Bienvenida") do
    @login_invitado = LoginInvitadoPage.new
    @login_invitado.click_ingresar
  end

  Then("Realizo inicio de sesion en pantalla de bienvenida generado") do
    @login_invitado = LoginInvitadoPage.new
    rut = JSON.parse(File.read("./features/data/datagen_E2E.json"))
    cdp = $name[0, 5] 
    @login_invitado.ingreso_credenciales(rut[cdp], "1234")
  end

  Then("Ingreso como invitado en pantalla de bienvenida generado") do
    @login_invitado = LoginInvitadoPage.new
    rut = JSON.parse(File.read("./features/data/datagen_E2E.json"))
    cdp = $name[0, 5] 
    @login_invitado.ingresar_invitado(rut[cdp])
    $invitado_nuevo = true
  end

  Then("Realizo click en Crea tu cuenta") do
    @login_invitado.click_crea_tu_cuenta
  end
  
  Then("Realizo click en O puedes registrarte aqui") do
    @login_invitado.click_registrate_aqui
  end