@micuenta 
Feature: F03 Menu Lateral

    Scenario: TC009 Validar muestre categoría de cliente correspondiente
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F03_TC009"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Baja"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F03_TC009"
        And Valido que se muestre pagina Mis Datos
        Then Valido que este presente la categoria del cliente

    Scenario: TC010 Validar se muestren los Puntos Go del Cliente correspondiente
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F03_TC010"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Gold"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F03_TC010"
        And Valido que se muestre pagina Mis Datos
        Then Valido los rpuntos del cliente

    Scenario: TC011 Validar al realizar click en Mi Cuenta se muestre página de Mi Cuenta
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F03_TC011"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F03_TC011"
        And Valido que se muestre pagina Mis Datos 
        And Realizo click en Menu lateral en opcion "Mis Compras"
        And Valido que se muestre pagina Mis Compras "Sin Compras"
        And Realizo click en Menu lateral en opcion "Mis Datos"
        Then Valido que se muestre pagina Mis Datos 

    Scenario: TC012 Validar al realizar click en Mis Compras se muestre la pagina correspondiente
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F03_TC012"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F03_TC012"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Menu lateral en opcion "Mis Compras"
        Then Valido que se muestre pagina Mis Compras "Sin Compras"

    Scenario: TC013 Validar al realizar click en Mis Ripley Puntos Go se muestre la pagina correspondiente
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F03_TC013"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F03_TC013"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Menu lateral en opcion "Mis Ripley Puntos Go"
        And Valido que se muestre pagina Mis Ripley Puntos Go

    Scenario: TC015 Validar al realizar click en Cerrar Sessión se realice la acción correctamente y muestre la pagina de Home deslogueada
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F03_TC015"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F03_TC015"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Menu lateral en opcion "Cerrar Sesión"
        Then Verifico se muestre Home principal