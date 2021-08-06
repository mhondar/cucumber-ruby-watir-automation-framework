And("Valido que se muestre pagina Mis Ripley Puntos Go") do
  @misrpuntos = MiCuentaRpuntos.new
  @misrpuntos.verificar_pagina
end

And("Valido que se muestren los RPuntosGo del cliente") do
  @misrpuntos.verificar_puntos_go
end

Then("Valido que se muestren {int} Ripley Puntos Go") do |puntos|
  @misrpuntos.verificar_cant_puntos_go(puntos)
end
  
And("Realizo click en Canjear") do
  @misrpuntos.click_canjear
end

And("Busco la Categoria de canje {string}") do |categoria|
  @misrpuntos.buscar_categoria_canje(categoria)
end

And("Validar listado de productos disponibles para canjear") do
  @misrpuntos.validar_productos_habilitados_canje
end

  And("Realizo click en revisar beneficios") do
    @misrpuntos = MiCuentaRpuntos.new
    @misrpuntos.click_RevisarBeneficios
  end

  And("Realizo click en leer terminos y condiciones") do
    @misrpuntos = MiCuentaRpuntos.new
    @misrpuntos.click_terminos_y_condiciones
  end

  Then("Valido que se muestra terminos y condiciones") do
    @misrpuntos.validar_terminos_y_condiciones
  end

  Then("Valido se muestren los beneficios") do
    @misrpuntos.validar_beneficios
  end

  Then("Valido se muestren los canjes realizados") do
    @misrpuntos.validar_canjes_realizados
  end


  

