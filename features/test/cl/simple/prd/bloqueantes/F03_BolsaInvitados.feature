@simple
@simple_mobile
Feature: F03 Bolsa Home invitados

@smoke_test
# @wip
     Scenario: TC-67 Validar con Invitado que un Producto se agregue a la Bolsa correctamente
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F03_TC-66"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Valido producto agregado en la bolsa del home

@smoke_test
    Scenario: TC-68 Validar con Invitado que el producto sea eliminado de la Bolsa al clickear en su cesto de basura
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F03_TC-68"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Valido producto agregado en la bolsa del home
        And Elimino todos los productos de la bolsa del home
        Then Valido que se encuentre vacia la bolsa del Home



    Scenario: TC-69 Validar con Invitado agregar el segundo producto se vean los dos productos en la Bolsa
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F03_SAQQ-TC-10"
        And Busco producto "Con Extragarantia"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        Then Valido producto agregado en la bolsa del home
        And Realizo click en cerrar la Bolsa
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        Then Valido producto agregado en la bolsa del home



    Scenario: TC-70 Validar con Invitado al seleccionar Ir a la Bolsa en esta se muestren los productos cargados
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F03_TC-70"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Valido que el producto de la Bolsa sea el correcto


@smoke_test
    Scenario: TC-71 Validar merge de productos al hacer login despues de vidrinear como invitado (Cliente tenia bolsa vacia)
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F03_TC-71"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        And Realizo Logout
        Then Verifico se realizo el logout correctamente
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Valido producto agregado en la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        Then Valido producto agregado en la bolsa del home


     Scenario: TC-6 Validar en la Bolsa producto agregado desde recomendaciones
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F03_TC-6"
        When Busco producto "Recomendaciones"
        And Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Valido producto agregado en la bolsa del home
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Valido que el producto de la Bolsa sea el correcto
        Then Agrego a la bolsa desde la recomendaciones 
        And Valido que se agregue el producto correctamente de recomendaciones






