And("Valido que este presente la categoria del cliente") do
  @micuenta = MiCuentaHomePage.new
  @micuenta.validar_categoria_cliente
end


Then("Valido la categoria del cliente sea {string}") do |categoria|
  @micuenta = MiCuentaHomePage.new
  @micuenta.validar_categoria_cliente_set(categoria)
end


And("Valido los rpuntos del cliente") do
  @micuenta = MiCuentaHomePage.new
  @micuenta.validar_rpuntos
end

Then("Valido que el cliente posee {int} Puntos Go") do |puntos|
  @micuenta = MiCuentaHomePage.new
  @micuenta.validar_cantidad_rpuntos(puntos)
end

Then("Realizo click en Menu lateral en opcion {string}") do |menu|
    @micuenta_home = MiCuentaHomePage.new
    @micuenta_home.click_menu_lateral(menu)
end

Then("Realizo click en Menu Superior en opcion {string}") do |menu|
    @micuenta_home = MiCuentaHomePage.new
    @micuenta_home.click_menu_superior(menu)
end

