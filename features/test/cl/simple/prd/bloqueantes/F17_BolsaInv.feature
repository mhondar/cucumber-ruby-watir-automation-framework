@simple
@simple_mobile
Feature: F17 Bolsa invitados


    Scenario: TC-49 Validar en la Bolsa al navegar como invitado al continuar redireccione a pantalla de Bienvenida de Ripley
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F17_TC-49"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Valido que se muestre pantalla de Bienvenida

#Pendiente el caso es correcto, no se modifica step

@smoke_test
    Scenario: TC-50 Validar en la Bolsa se muestre Precio Internet de producto correctamente
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F17_TC-50"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        Then Valido que precio internet de ficha sea igual a precio Total normal en la Bolsa

@smoke_test
    Scenario: TC-51 Validar en la Bolsa el Subtotal con invitado
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F17_TC-51"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        Then Valido que se muestre el SubTotal

#Pendiente, corregido
@smoke_test
    Scenario: TC-52 Validar en la Bolsa el Total Normal
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F17_TC-52"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        Then Valido que se muestre el precio Total Normal

@smoke_test
    Scenario: TC-53 Validar en la Bolsa el Total Tarjeta Ripley o Chek
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F17_TC-53"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        Then Valido que se muestre el precio Ripley