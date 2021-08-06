@micuenta 
Feature: F02 Menu Superior


    Scenario: TC002 Validar que redireccione a pagina de Ripley.com al clickear icono de Ripley
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F02_TC002"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F02_TC002"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Menu Superior en opcion "Icono Ripley"
        Then Verifico se muestre Home principal

    Scenario: TC003 Validar que redireccione a pagina de Ripley.com al seleccionar menu Ripley.com
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F02_TC003"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F02_TC003"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Menu Superior en opcion "Ripley.com"
        Then Verifico se muestre Home principal