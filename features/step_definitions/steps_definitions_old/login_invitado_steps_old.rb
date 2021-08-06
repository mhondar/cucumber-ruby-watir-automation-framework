Then("Valido que se muestre pantalla de Bienvenida Old") do
    @login_invitado = LoginInvitadoPageOld.new
    @login_invitado.validar_pantalla_bienvenida
  end

  Then(/^Ingreso como invitado en pantalla de Bienvenida Old "([^"]*)"$/) do |medio|
    @login_invitado = LoginInvitadoPageOld.new
    @login_invitado.ingresar_invitado_medio(medio)
  end

Then("Acepto las condiciones de compra Old") do
    @login_invitado.aceptar_condiciones
end

Then(/^Realizo inicio de sesion en pantalla de Bienvenida Old "([^"]*)"$/) do |medio|
    @login_invitado = LoginInvitadoPageOld.new
    @login_invitado.ingresar_credenciales_login(medio)
  end