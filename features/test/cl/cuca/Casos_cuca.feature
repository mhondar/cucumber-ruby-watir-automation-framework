Feature: CASOS CUCA

Scenario: TC01 Validar obtención del perfil.
    Given Abro la pagina de ripley en ambiente "prd" de "cl" "XXXX"
    And Verifico se muestre Home principal
    And Cierro PopUp de Notificaciones
    When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
    Then Verifico login exitoso
    And Realizo click en Tu cuenta del Menu Mi Cuenta
    And Cierro Pop up de notificaciones Actualizar Datos Personales
    And Realizo click en Menu lateral en opcion "Mis Compras"
    And Valido que se muestre pagina Mis Compras "Sin Compras"
    And Valido que este presente la categoria del cliente

Scenario: TC02 Validar edición del perfil.
    Given Abro la pagina de ripley en ambiente "prd" de "cl" "XXXX"
    And Verifico se muestre Home principal
    And Cierro PopUp de Notificaciones
    When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
    Then Verifico login exitoso
    And Realizo click en Tu cuenta del Menu Mi Cuenta
    And Cierro Pop up de notificaciones Actualizar Datos Personales
    And Valido que se muestre pagina Mi Cuenta
    And Realizo click en Editar datos
    Then Valido se muestre formulario para Modificar los Datos
    And Modifico datos del Perfil
    And Realizo click en Guardar Modificar Cambios
    Then Verifico Modificacion de los Datos del Perfil
    And Reestablezco Datos del Perfil Originales

Scenario: TC03 Validar obtención de direcciones.
    Given Abro la pagina de ripley en ambiente "prd" de "cl" "XXXX"
    And Verifico se muestre Home principal
    And Cierro PopUp de Notificaciones
    When Realizo login con las credenciales "mi_cuenta" "Contraseña"
    Then Verifico login exitoso
    And Realizo click en Tu cuenta del Menu Mi Cuenta
    And Cierro Pop up de notificaciones Actualizar Datos Personales
    And Realizo click en Menu lateral en opcion "Direcciones"

Scenario: TC04 Validar creación de direcciones.
    Given Abro la pagina de ripley en ambiente "prd" de "cl" "XXXX"
    And Verifico se muestre Home principal
    And Cierro PopUp de Notificaciones
    When Realizo login con las credenciales "mi_cuenta" "Contraseña"
    Then Verifico login exitoso
    And Realizo click en Tu cuenta del Menu Mi Cuenta
    And Cierro Pop up de notificaciones Actualizar Datos Personales
    And Realizo click en Menu lateral en opcion "Direcciones"
    And Realizo Click en agregar Direccion
    And Valido que se muestren los campos para editar direccion
    And Completo los campos para crear direccion
    And Realizo click en guardar

Scenario: TC05 Validar edición de direcciones.
    Given Abro la pagina de ripley en ambiente "prd" de "cl" "XXXX"
    And Verifico se muestre Home principal
    And Cierro PopUp de Notificaciones
    When Realizo login con las credenciales "mi_cuenta" "Contraseña"
    Then Verifico login exitoso
    And Realizo click en Tu cuenta del Menu Mi Cuenta
    And Cierro Pop up de notificaciones Actualizar Datos Personales
    And Realizo click en Menu lateral en opcion "Direcciones"
    And Realizo click en editar direccion con nombre
    And Valido que se muestren los campos para editar direccion
    And Actualizo datos de la direccion
    And Realizo click en guardar
    And Valido datos direccion actualizada
    And Reestablezco datos de direccion
    And Realizo doble click en guardar

Scenario: TC06 Validar eliminación de direcciones.
    Given Abro la pagina de ripley en ambiente "prd" de "cl" "XXXX"
    And Verifico se muestre Home principal
    And Cierro PopUp de Notificaciones
    When Realizo login con las credenciales "mi_cuenta" "Contraseña"
    Then Verifico login exitoso
    And Realizo click en Tu cuenta del Menu Mi Cuenta
    And Cierro Pop up de notificaciones Actualizar Datos Personales
    And Realizo click en Menu lateral en opcion "Direcciones"
    And Realizo Click en agregar Direccion
    And Valido que se muestren los campos para editar direccion
    And Completo los campos para crear direccion
    And Realizo click en guardar
    And Elimino direccion creada

# Scenario: TC07 Validar modificar contraseña.
#     Given Abro la pagina de ripley en ambiente "prd" de "cl" "XXXX"
#     And Verifico se muestre Home principal
#     And Cierro PopUp de Notificaciones
#     When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
#     Then Verifico login exitoso
#     And Realizo click en Tu cuenta del Menu Mi Cuenta
#     And Cierro Pop up de notificaciones Actualizar Datos Personales
#     And Valido que se muestre pagina Mi Cuenta
#     And Realizo click en Cambiar Contraseña
#     Then Verificar formulario de cambio de Contraseña visible

Scenario: TC08 Validar cerrar sesión.
    Given Abro la pagina de ripley en ambiente "prd" de "cl" "XXXX"
    And Verifico se muestre Home principal
    And Cierro PopUp de Notificaciones
    When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
    Then Verifico login exitoso
    And Realizo click en Tu cuenta del Menu Mi Cuenta
    And Cierro Pop up de notificaciones Actualizar Datos Personales
    And Realizo click en Menu lateral en opcion "Cerrar Sesión"
    Then Verifico se muestre Home principal

# Scenario: TC09 Validar realización de canjes.
#     Given Abro la pagina de ripley en ambiente "prd" de "cl" "XXXX"
#     And Verifico se muestre Home principal
#     And Cierro PopUp de Notificaciones
#     When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
#     Then Verifico login exitoso
#     And Realizo click en Tu cuenta del Menu Mi Cuenta
#     And Cierro Pop up de notificaciones Actualizar Datos Personales
#     And Realizo click en Menu lateral en opcion "Beneficios"
#     And Valido que se muestre pagina Mis Ripley Puntos Go
#     And Realizo click en Canjear
#     And Realizo click en leer terminos y condiciones
#     Then Valido que se muestra terminos y condiciones

Scenario: TC10 Validar obtención de canjes.
    Given Abro la pagina de ripley en ambiente "prd" de "cl" "XXXX"
    And Verifico se muestre Home principal
    And Cierro PopUp de Notificaciones
    When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
    Then Verifico login exitoso
    And Realizo click en Tu cuenta del Menu Mi Cuenta
    And Cierro Pop up de notificaciones Actualizar Datos Personales
    And Realizo click en Menu lateral en opcion "Mis Ripley Puntos Go"
    And Valido que se muestre pagina Mis Ripley Puntos Go
    And Realizo click en Menu lateral en opcion "Canjes realizados"
    Then Valido se muestren los canjes realizados

#Scenario: TC11 Validar Cambiar endpoint para la obtención de imágenes.