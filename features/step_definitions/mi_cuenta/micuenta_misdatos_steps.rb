And("Valido que se muestre pagina Mi Cuenta") do
  @misdatospage = MisDatosPage.new
  @misdatospage.verificar_pagina
end

Then("Valido que se muestre pagina Mis Datos") do
  @misdatospage = MisDatosPage.new
  @misdatospage.verificar_pagina
end

And("Realizo click en Editar datos") do
  @misdatospage.click_editar_datos
end

And("Valido se muestre formulario para Modificar los Datos") do
  @misdatospage.validar_formulario_modificar_datos_presente
end

And("Modifico datos del Perfil") do
  @misdatospage.editar_datos_perfil
end

And("Espero mensaje de Perfil Actualizado") do
  @misdatospage.esperar_mensaje_perfil_actualizado
end

And("Realizo click en Guardar Modificar Cambios") do
  @misdatospage.click_guardar_modificar_cambios
end

And("Verifico Modificacion de los Datos del Perfil") do
  @misdatospage.verificar_modificacion_datos_perfil
end

And("Reestablezco Datos del Perfil Originales") do
  @misdatospage.reestablecer_datos_originales
end

And("Realizo click en Cancelar Modificar Datos") do
  @misdatospage.click_cancelar_modificar_datos
end

And("Capturo datos de perfil originales") do
  @misdatospage.capturar_datos_perfil_originales
end

And("Verifico datos de perfil originales") do
  @misdatospage.verificar_datos_perfil_originales
end

Then("Realizo click en Cambiar Contraseña") do
  @misdatospage.click_cambiar_contrasenna
end

Then("Verificar formulario de cambio de Contraseña visible") do
  @misdatospage.verificar_formulario_cambio_contrasenna
end

Then("Ingreso password actual en Contraseña anterior") do
  @misdatospage.ingresar_password_actual
end

Then("Ingreso nueva password alternativa en Nueva contraseña") do
  @misdatospage.ingresar_password_nueva
end

Then("Confirmo nueva password alternativa") do
  @misdatospage.ingresar_confirmar_password_nueva
end

Then("Realizo click en Guardar") do
  @misdatospage.click_guardar_password
end

Then("Verifico cambio de contrasenna exitoso") do
  if @misdatospage.verificar_cambio_password_exitoso == true
    puts "Ok cambio de password"
  else
    $tools.fallo("No se actualizó el password correctamente")
  end
end

Then("Reestrablezco contraseña anterior") do
  @misdatospage.reestablecer_contrasenna_original
end

Then("Ingreso contraseña anterior inválida") do
  @misdatospage.ingreso_password_anterior_invalido
end

Then("Valido mensaje de Contraseña anterior incorrecta") do
  @misdatospage.validar_mensaje_error_cambio_password
end

Then("Ingreso password erronea en Confirmación") do
  @misdatospage.ingreso_password_confirmacion_invalida
end

Then("Valido mensaje indicando que deben coincidir las contraseñas") do
  @misdatospage.valido_msg_deben_coincidir_contrasennas
end

Then("Realizo tab fuera del formulario") do
  @misdatospage.tab_fuera_formulario_password
end

Then("Realizo click en editar direccion con nombre") do
  @misdatospage = MisDatosPage.new
  @misdatospage.click_editar_direccion
end

Then("Valido que se muestren los campos para editar direccion") do
  @misdatospage.valido_campos_editar_direccion
end

Then("Actualizo datos de la direccion") do
  @misdatospage.actualizar_direccion
end

Then("Realizo click en guardar") do
  @misdatospage.click_guardar_password
end

Then("Realizo doble click en guardar") do
  @misdatospage.doble_click_guardar
end

Then("Valido datos direccion actualizada") do
  @misdatospage.validar_datos_Direccion_actualizada
end

Then("Reestablezco datos de direccion") do
  @misdatospage.restablecer_direccion
end

Then("Valido que datos no fueron actualizados") do
  @misdatospage.validar_Direccion
end

Then("Realizo Click en agregar Direccion") do
  @misdatospage = MisDatosPage.new
  @misdatospage.click_agregar_direccion
end

Then("Valido que no se muestren direcciones agregadas") do
  @misdatospage.validar_direcciones_sin_agregar
end

Then("Valido que no se muestren direcciones de facturacion agregadas") do
  @misdatospage.validar_direcciones_facturacion_sin_agregar
end

Then("Completo los campos para crear direccion") do
  @misdatospage.completar_direccion_nueva
end

Then("Elimino direccion creada") do
  @misdatospage.eliminarDireccionPrueba
end 

Then("Realizo Click en agregar Direccion de Facturacion") do
  @misdatospage.click_agregar_direccion_facturacion
end

Then("Valido se muestre el Formulario para añadir direccion de facturacion") do
  @misdatospage.validar_formulario_direccion_facturacion
end

Then("Completo formulario para agregar direccion") do
  @misdatospage.completo_formulario_direccion_facturacion
end

Then("Realizo Click en Guardar Direccion de facturacion") do
  @misdatospage.click_guardar_direccion_facturacion
end

Then("Valido que se muestre la direccion de facturacion agregada") do
  @misdatospage.validar_direccion_de_facturacion_agregada
end

Then("Elimino la direccion agregada") do
  @misdatospage.delete_direccion_facturacion
end