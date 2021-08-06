And("Valido que se muestre pagina Mis Compras {string}") do |compras|
    @micuenta_miscompras = MiCuentaMisCompras.new
    @micuenta_miscompras.verificar_pagina(compras)
  end

 
  And("Valido que se muestre listado de compras") do 
    @micuenta_miscompras.validarListadoCompras
  end
  
  And("Realizo click en seguir pedido") do 
    @micuenta_miscompras.click_seguir_Compra
  end

  And("Valido que se muestre el traking del producto") do 
    @micuenta_miscompras.validar_tracking
  end

  And("Realizo click en Reportar inconveniente") do 
    @micuenta_miscompras = MiCuentaMisCompras.new
    @micuenta_miscompras.click_reportar_inconveniente
  end

  And("Valido que se muestre formulario de reportar inconveniente") do 
    @micuenta_miscompras.validar_formulario_reportar_inconveniente
  end
