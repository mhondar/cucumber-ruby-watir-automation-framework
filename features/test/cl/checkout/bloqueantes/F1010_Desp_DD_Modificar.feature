@checkout
Feature: F1010 Despacho A Domicilio	Modificar Compra

    Scenario: TC1044 Validar al seleccionar modificar compra se muestre la Bolsa de Productos
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1010_TC1044"
        And Verifico se muestre Home principal
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "Despacho a Domicilio"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        And Verifico que se muestren los productos agregados en despacho
        And Realizo click en Modificar compra de Depacho
        Then Valido que se cargue la Bolsa de productos

    Scenario: TC1045 Validar al seleccionar modificar compra en Bolsa no se cambie nada y regrese al despacho igual
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1010_TC1045"
        And Verifico se muestre Home principal
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "Despacho a Domicilio"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        And Verifico que se muestren los productos agregados en despacho
        And Realizo click en Modificar compra de Depacho
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        And Verifico que se muestren los productos agregados en despacho

    Scenario: TC1046 Validar al cambiar en Bolsa la cantidad del Producto y continuar se refleje el cambio en despacho
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1010_TC1046"
        And Verifico se muestre Home principal
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "Despacho a Domicilio"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        Then Valido la cantidad del producto en la Bolsa
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        Then Verifico que se muestren los productos agregados en despacho
        Then Verifico cantidad del producto en Despacho
        And Realizo click en Modificar compra de Depacho
        Then Valido que se cargue la Bolsa de productos
        And Ingreso la cantidad del producto en la Bolsa 2
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        Then Verifico cantidad del producto en Despacho
 
    Scenario: TC1047 Validar al eliminar uno de dos productos en Bolsa se actualice en Despacho
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1010_TC1047"
        And Verifico se muestre Home principal
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "Despacho a Domicilio"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico seguir comprando
        When Busco producto "Despacho a Domicilio"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        Then Verifico que se muestren los productos agregados en despacho
        And Realizo click en Modificar compra de Depacho
        Then Valido que se cargue la Bolsa de productos
        And Elimino producto de la bolsa 1
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        Then Verifico que se muestren los productos agregados en despacho
