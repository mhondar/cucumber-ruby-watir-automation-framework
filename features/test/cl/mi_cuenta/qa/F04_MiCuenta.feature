@micuenta
Feature: F04 Mis Datos
 
    Scenario: TC016 Validar al seleccionar Editar Datos se muestre Formulario para Modificar los Datos
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC016"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC016"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Editar datos
        Then Valido se muestre formulario para Modificar los Datos

    Scenario: TC017 Validar al modificar Datos y Guardar los datos del Perfil se almacenen correctamente
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC017"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC017"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Editar datos
        Then Valido se muestre formulario para Modificar los Datos
        And Modifico datos del Perfil
        And Realizo click en Guardar Modificar Cambios
        And Espero mensaje de Perfil Actualizado
        Then Verifico Modificacion de los Datos del Perfil
        And Reestablezco Datos del Perfil Originales
        Then Verifico datos de perfil originales

    Scenario: TC018 Validar al cancelar no se guarden los datos y se minimice el formulario
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC018"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC018"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Editar datos
        Then Valido se muestre formulario para Modificar los Datos
        And Capturo datos de perfil originales
        And Modifico datos del Perfil
        And Realizo click en Cancelar Modificar Datos
        Then Verifico datos de perfil originales

    Scenario: TC019 Validar al seleccionar Cambiar se muestre formulario de Cambio de Contraseña
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC019"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC019"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Cambiar Contraseña
        Then Verificar formulario de cambio de Contraseña visible

    Scenario: TC020 Validar al Ingresar Password anterior válido y Nueva Contraseña y Confirmación Valida al Guardar se Guarde la misma
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC020"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Contraseña"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC020"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Cambiar Contraseña
        Then Verificar formulario de cambio de Contraseña visible
        And Ingreso password actual en Contraseña anterior
        And Ingreso nueva password alternativa en Nueva contraseña
        And Confirmo nueva password alternativa
        And Realizo click en Guardar
        Then Verifico cambio de contrasenna exitoso
        And Reestrablezco contraseña anterior

    Scenario: TC021 Validar al Guardar Contraseña exitosamente se puede hacer login con la contraseña actualizada
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC021"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Contraseña"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC021"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Cambiar Contraseña
        Then Verificar formulario de cambio de Contraseña visible
        And Ingreso password actual en Contraseña anterior
        And Ingreso nueva password alternativa en Nueva contraseña
        And Confirmo nueva password alternativa
        And Realizo click en Guardar
        Then Verifico cambio de contrasenna exitoso
        And Realizo click en Menu lateral en opcion "Cerrar Sesión"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Contraseña"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC021"
        And Valido que se muestre pagina Mis Datos
        And Reestrablezco contraseña anterior

 
#error real cambia de password con cualquiera
    Scenario: TC022 Validar al ingresar password anterior invalido no permita cambiar contraseña
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC022"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Contraseña"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC022"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Cambiar Contraseña
        Then Verificar formulario de cambio de Contraseña visible
        And Ingreso contraseña anterior inválida
        And Ingreso nueva password alternativa en Nueva contraseña
        And Confirmo nueva password alternativa
        And Realizo click en Guardar
        Then Valido mensaje de Contraseña anterior incorrecta

    Scenario: TC023 Validar al Ingresar confirmar contraseña no coincidente con la nueva no permita guardar
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC023"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Contraseña"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC023"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Cambiar Contraseña
        Then Verificar formulario de cambio de Contraseña visible
        And Ingreso password actual en Contraseña anterior
        And Ingreso nueva password alternativa en Nueva contraseña
        And Ingreso password erronea en Confirmación
        And Realizo tab fuera del formulario
        Then Valido mensaje indicando que deben coincidir las contraseñas

    Scenario: TC026  Validar al seleccionar Editar Dirección se muestre Formulario de Modificación de Dirección
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC026"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Contraseña"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC026"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en editar direccion con nombre "Direccion Test"
        And Valido que se muestren los campos para editar direccion

    Scenario: TC027 Mis Direcciones Validar al Cambiar los Datos de Dirección y Guardar esta se actualice correctamente
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC027"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Contraseña"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC027"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en editar direccion con nombre "Direccion Test"
        And Valido que se muestren los campos para editar direccion
        And Actualizo datos de la direccion
        And Realizo click en guardar
        And Valido datos direccion actualizada
        And Restablesco datos de direccion
        And Realizo click en guardar

    Scenario: TC028 Mis Direcciones Validar al cancelar no se guarden los datos y se minimice el formulario
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC028"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Contraseña"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC028"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en editar direccion con nombre "Direccion Test"
        And Valido que se muestren los campos para editar direccion
        And Actualizo datos de la direccion
        And Realizo click en Cancelar Modificar Datos
        And Valido que datos no fueron actualizados

    Scenario: TC029 Mis Direcciones Validar al seleccionar Aagregar Dirección se muestre formulario de Agregar Nueva Dirección
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC029"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Contraseña"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC029"
        And Valido que se muestre pagina Mis Datos
        And Realizo Click en agregar Direccion
        And Valido que se muestren los campos para editar direccion

    Scenario: TC030 Mis Direcciones Validar al ingresar datos de nueva dirección y guardar se añada satisfactoriamente
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC030"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Contraseña"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC030"
        And Valido que se muestre pagina Mis Datos
        And Realizo Click en agregar Direccion
        And Valido que se muestren los campos para editar direccion
        And Completo los campos para crear direccion
        And Realizo click en guardar

    Scenario: TC031 Mis Direcciones Validar eliminar una dirección previamente agregada
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F04_TC031"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Contraseña"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F04_TC031"
        And Valido que se muestre pagina Mis Datos
        And Elimino direccion creada