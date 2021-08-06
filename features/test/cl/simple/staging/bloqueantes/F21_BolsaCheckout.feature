@simple
Feature: F21 Bolsa de Usuarios registrados

    @smoke_test
    Scenario: TC-57 Validar en la Bolsa al eliminar todos los Productos quede vacía
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F21_TC-57"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Valido lista de productos en la bolsa
        And Elimino todos los productos de la bolsa
        Then Verifico que la bolsa este vacia


    Scenario: TC-58 Validar en la Bolsa se pueda eliminar productos por el cesto de basura
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F21_TC-58"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
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
        And Valido que el producto de la Bolsa sea el correcto
        And Elimino todos los productos de la bolsa
        Then Verifico que la bolsa este vacia


    Scenario: TC-59 Validar en la Bolsa se agregue 1 Producto
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F21_TC-59"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
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
        And Valido que el producto de la Bolsa sea el correcto



    Scenario: TC-60 Validar en la Bolsa se agreguen 2 productos
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F21_TC-60"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Valido lista de productos en la bolsa

    Scenario: Limpiar Bolsa
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_Limpiar_Bolsa"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        Then Valido que se encuentre vacia la bolsa del Home
        And Realizo click en cerrar la Bolsa


    Scenario Outline: TC-61 Validar en la Bolsa el Subtotal con usuario logueado
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Busco producto <Sku>
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        Then Valido en Bolsa en Caja de Precio el Subtotal

        Examples:
            | CDP                  | Sku          |
            | "SIMPLE_F21_TC-61_a" | "Internet"   |
            | "SIMPLE_F21_TC-61_b" | "Disponible" |
            | "SIMPLE_F21_TC-61_c" | "Ripley"     |



    Scenario: Limpiar Bolsa
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_Limpiar_Bolsa"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        Then Valido que se encuentre vacia la bolsa del Home
        And Realizo click en cerrar la Bolsa


    Scenario: TC-62 Validar en la Bolsa el Precio Total sin agregar Descuentos
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F21_TC-62"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        Then Valido que se encuentre vacia la bolsa del Home
        And Realizo click en cerrar la Bolsa
        And Busco producto "Internet"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        Then Valido en Bolsa en Caja de Precio Total sin agregar Descuentos


    @smoke_test
    # @wip
    Scenario Outline: TC-63 Validar en la Bolsa el Total Tarjeta Ripley Precio sin agregar Descuentos
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        Then Valido que se encuentre vacia la bolsa del Home
        And Realizo click en cerrar la Bolsa
        And Busco producto <sin descuento>
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        Then Valido en Bolsa en Caja de Precio Ripley sin agregar Descuentos

        Examples:
            | CDP                | sin descuento    |
            | "SIMPLE_F21_TC-63" | "2000368076516P" |


    Scenario: TC-64 Validar en Despacho los productos agregados
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F21_TC-64"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        Then Valido que se encuentre vacia la bolsa del Home
        And Realizo click en cerrar la Bolsa
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
        Then Verifico que se muestre pagina de despacho
        And Verifico que se muestren los productos agregados en despacho


    Scenario: TC-65 Validar ir a la Bolsa desde el pop up
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F21_TC-65"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        Then Valido que se encuentre vacia la bolsa del Home
        And Realizo click en cerrar la Bolsa
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en pop up de Ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
