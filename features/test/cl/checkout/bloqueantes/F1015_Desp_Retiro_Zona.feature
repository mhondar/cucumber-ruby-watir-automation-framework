@checkout
Feature: F1015 Despacho Retiro en Tienda Disponible Seleccionar Zona
     
    Scenario: TC1060 Validar al Seleccionar Zona se muestre Retiro en Tienda Disponible
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1015_TC1060"
        And Verifico se muestre Home principal
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "Retiro en Tienda"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        And Selecciono tipo de despacho "Retiro en tienda"
        And Selecciono zona de despacho "Disponible"
        Then Valido que se muestren tiendas "Disponible"

    Scenario: TC1061 Validar al seleccionar Zona se muestre Retiro en Tienda Pendiente Disponible
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1015_TC1061"
        And Verifico se muestre Home principal
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "Retiro en Tienda"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Ingreso la cantidad de productos 2
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico seguir comprando
        When Busco producto "Sin Retiro en Tienda"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Ingreso la cantidad de productos 1
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        And Selecciono tipo de despacho "Retiro en tienda"
        And Selecciono zona de despacho "Disponible"
        Then Valido que se muestren tiendas "Pendientes Disponibles"