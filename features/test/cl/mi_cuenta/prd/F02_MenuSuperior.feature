@micuenta 
Feature: F02 Menu Superior

    Scenario: TC002 Validar que redireccione a pagina de Ripley.com al clickear icono de Ripley
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F02_TC002"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta
        And Cierro Pop up de notificaciones Actualizar Datos Personales

        And Realizo click en Menu lateral en opcion "Mis Compras"

        And Valido que se muestre pagina Mis Compras "Sin Compras"
        And Realizo click en Menu Superior en opcion "Icono Ripley"
        # Then Verifico se muestre Home principal
        Then Verifico se muestre Home principal en nueva pestaña del navegador


    Scenario: TC003 Validar que redireccione a pagina de Ripley.com al seleccionar menu Ripley.com
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F02_TC003"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta
        And Cierro Pop up de notificaciones Actualizar Datos Personales
        
        And Realizo click en Menu lateral en opcion "Mis Compras"
        
        And Valido que se muestre pagina Mis Compras "Sin Compras"
        And Realizo click en Menu Superior en opcion "Ripley.com"
        Then Verifico se muestre Home principal en nueva pestaña del navegador