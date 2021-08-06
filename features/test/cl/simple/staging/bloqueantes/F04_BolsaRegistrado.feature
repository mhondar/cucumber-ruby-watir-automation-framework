@simple
@simple_mobile
Feature: F04 Bolsa Home usuario registrado


    Scenario: TC-7 Validar con usuario logueado la Bolsa al Agregar 1 Producto
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F04_TC-7"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Valido producto agregado en la bolsa del home

@smoke_test
    Scenario: TC-8 Validar con usuario logueado al seleccionar Ir a la Bolsa en esta se muestren los productos cargados
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F04_TC-8"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Valido producto agregado en la bolsa del home
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Valido que el producto de la Bolsa sea el correcto

 