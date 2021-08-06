@checkout
Feature: F1014 Despacho Caja de Precios Precios
 
    Scenario: TC1056 Validar el Calculo del Subtotal
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1014_TC1056"
        And Verifico se muestre Home principal
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "Despacho a Domicilio"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Ingreso la cantidad de productos 2
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        Then Verifico Subtotal del despacho
 
    Scenario: TC1057 Validar Costo de Despacho (Solo A Domicilio)
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1014_TC1057"
        And Verifico se muestre Home principal
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "Internet"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Ingreso la cantidad de productos 4
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        Then Verifico Precio del Despacho
 
    Scenario: TC1058 Validar Calculo Total Normal
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1014_TC1058"
        And Verifico se muestre Home principal
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "Internet"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Ingreso la cantidad de productos 2
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico seguir comprando
        When Busco producto "Ripley"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Ingreso la cantidad de productos 1
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        Then Verifico Total normal del despacho

    Scenario: TC1059 Validar Calculo Total Tarjeta Ripley
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1014_TC1059"
        And Verifico se muestre Home principal
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "Internet"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Ingreso la cantidad de productos 9
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico seguir comprando
        When Busco producto "Ripley"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Ingreso la cantidad de productos 4
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        Then Verifico Total Tarjeta Ripley del despacho