@simple
@simple_mobile
Feature: F02 Login


    Scenario: TC-5 Login exitoso usuario registrado
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F03_TC-5"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso

