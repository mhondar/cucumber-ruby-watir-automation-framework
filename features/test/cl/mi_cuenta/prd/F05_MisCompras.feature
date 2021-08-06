@micuenta
Feature: F05 Mis Compras


    Scenario: TC035 Listado de Compras Validar se muestre listado de las compras realizadas
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F05_TC035"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Gold"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta 
        And Cierro Pop up de notificaciones Actualizar Datos Personales

        And Realizo click en Menu lateral en opcion "Mis Compras"

        And Valido que se muestre pagina Mis Compras "Con Compras"
        And Valido que se muestre listado de compras



    Scenario: TC038 Seguir Mi Compra Validar al seleccionar Seguir mi Compra de un Item se muestre el Traking de la Compra
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F05_TC038"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Gold"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta 
        And Cierro Pop up de notificaciones Actualizar Datos Personales

        And Realizo click en Menu lateral en opcion "Mis Compras"

        And Valido que se muestre pagina Mis Compras "Con Compras"
        And Realizo click en seguir pedido
        And Valido que se muestre el traking del producto


    Scenario: TC040 Problemas con mi compra Validar al seleccionar Problemas con mi compra se muestre en otra pestaña formulario ¿En qué podemos ayudarte?
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F05_TC040"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Gold"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta 
        And Cierro Pop up de notificaciones Actualizar Datos Personales

        And Realizo click en Menu lateral en opcion "Mis Compras"

        And Valido que se muestre pagina Mis Compras "Con Compras"
        # And Realizo click en Menu lateral en opcion "Solicitudes de atencion"
        And Realizo click en Reportar inconveniente
        And Valido que se muestre formulario de reportar inconveniente