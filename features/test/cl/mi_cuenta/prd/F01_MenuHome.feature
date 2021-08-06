@micuenta
Feature: F01 Menu Home

@wip
    Scenario: TC001 Validar link de tu cuenta en Home de Ripley.com redireccione a la página de Mis Compras en Mi Cuenta
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F01_TC001"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Sin CategorÍA"
        Then Verifico login exitoso
        And Realizo click en Tu cuenta del Menu Mi Cuenta
        And Cierro Pop up de notificaciones Actualizar Datos Personales

        And Realizo click en Menu lateral en opcion "Mis Compras"

        And Valido que se muestre pagina Mis Compras "Sin Compras"