@simple
@simple_mobile
Feature: F22 Logout

@smoke_test
    Scenario: TC-66 Validar Logout de Ripley.com
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F22_TC-66"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en Iniciar Sesion
        And Realizo Logout
        Then Verifico se realizo el logout correctamente


