@micuenta 
Feature: F08 Cliente Nuevo


    Scenario: TC051 Categoría Validar se muestre el cliente nuevo Sin Categoría
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F08_TC051"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Cliente Nuevo"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta
        And Cierro Pop up de notificaciones Actualizar Datos Personales
        And Realizo click en Menu lateral en opcion "Mis Compras"
        And Valido que se muestre pagina Mis Compras "Sin Compras"
        Then Valido la categoria del cliente sea "Sin CategorÍA"

        

    Scenario: TC052 Puntos Go Validar que posea 0 Puntos Go
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F08_TC052"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Cliente Nuevo"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta        
        And Cierro Pop up de notificaciones Actualizar Datos Personales
        And Realizo click en Menu lateral en opcion "Mis Compras"
        And Valido que se muestre pagina Mis Compras "Sin Compras"
        Then Valido que el cliente posee 0 Puntos Go


    Scenario: TC053 Mi Cuenta Validar que no se muestren Direcciones agregadas
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F08_TC053"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Cliente Nuevo"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta
        And Cierro Pop up de notificaciones Actualizar Datos Personales
        And Realizo click en Menu lateral en opcion "Mis Compras"
        And Valido que se muestre pagina Mis Compras "Sin Compras"
        And Realizo click en Menu lateral en opcion "Mi Cuenta"
        And Valido que se muestre pagina Mi Cuenta
        And Realizo click en Menu lateral en opcion "Direcciones"
        Then Valido que no se muestren direcciones agregadas


    Scenario: TC054 Mi Cuenta Validar que no se muestren Direcciones de Facturación agregadas
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F08_TC054"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Cliente Nuevo"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta
        And Cierro Pop up de notificaciones Actualizar Datos Personales
        And Realizo click en Menu lateral en opcion "Mis Compras"

        And Valido que se muestre pagina Mis Compras "Sin Compras"
        And Realizo click en Menu lateral en opcion "Mi Cuenta"
        And Valido que se muestre pagina Mi Cuenta
        And Realizo click en Menu lateral en opcion "Direcciones"
        Then Valido que no se muestren direcciones de facturacion agregadas


    Scenario: TC056 Mi Cuenta Validar agregar nueva dirección de facturación a cliente nuevo y esta se cree correctamente
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F08_TC056"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Cliente Nuevo"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta
        And Cierro Pop up de notificaciones Actualizar Datos Personales
        And Realizo click en Menu lateral en opcion "Mis Compras"
        And Valido que se muestre pagina Mis Compras "Sin Compras"
        And Realizo click en Menu lateral en opcion "Mi Cuenta"
        And Valido que se muestre pagina Mi Cuenta
        And Realizo click en Menu lateral en opcion "Direcciones"
        

        Then Valido que no se muestren direcciones de facturacion agregadas
        And Realizo Click en agregar Direccion de Facturacion
        Then Valido se muestre el Formulario para añadir direccion de facturacion
        And Completo formulario para agregar direccion
        And Realizo Click en Guardar Direccion de facturacion
        Then Valido que se muestre la direccion de facturacion agregada
        And Elimino la direccion agregada
        Then Valido que no se muestren direcciones de facturacion agregadas


    Scenario: TC057 Mis Compras	Validar no se muestre listado de compras sino el boton Quiero comprar
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F08_TC057"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Cliente Nuevo"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta
        And Cierro Pop up de notificaciones Actualizar Datos Personales
        And Realizo click en Menu lateral en opcion "Mis Compras"
        Then Valido que se muestre pagina Mis Compras "Sin Compras"


    Scenario: TC059 Mis Ripley Puntos Go Validar se muestren 0 Puntos 
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F08_TC059"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Cliente Nuevo"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta
        And Cierro Pop up de notificaciones Actualizar Datos Personales
        And Realizo click en Menu lateral en opcion "Mis Compras"
        And Valido que se muestre pagina Mis Compras "Sin Compras"
        And Realizo click en Menu lateral en opcion "Mis Ripley Puntos Go"
        And Valido que se muestre pagina Mis Ripley Puntos Go
        Then Valido que se muestren 0 Ripley Puntos Go 
