@simple
@simple_mobile
Feature: F20 Registro de Usuarios desde el Checkout


    Scenario: TC-56 Validar en Pantalla de Bienvenida al crear cuenta redirecciona a pantalla de registro
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F20_TC-56"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        And Realizo click en Continuar con mi compra
        Then Valido que se muestre pantalla de Bienvenida
        And Realizo click en Crea tu cuenta
        Then Verifico se redirecione a la pagina de registro de usuarios

