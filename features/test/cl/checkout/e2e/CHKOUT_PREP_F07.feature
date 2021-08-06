@monitor
Feature: E2E CHECKOUT PREPROD F07
#@storykey=QCT-3

  Scenario: E2E_CHECKOUT_PREP_F07
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "E2E_CHECKOUT_PREP_F07"
        And Verifico se muestre Home principal
        When Realizo click en Iniciar Sesion
        And Realizo click en Crea tu Cuenta
        When Registro un usuario nuevo
        And Verificar Menu Mi cuenta
        When Busco producto "SKU MKP"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        # And Ingreso codigo RClubes "Novios"
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho para crear direccion
        And Creo la direccion nueva con despacho "Disponible"
        And Selecciono otra opcion de despacho por defecto
        And Realizo click en continuar al Pago
        And Verifico que se muestre la pagina de Pago
        And Selecciono el medio de pago "tarjeta_debito"
        And Realizo click en Continuar
        Then Valido pagina de confirmacion exitosa
        And Acepto las condiciones de compra
        And Realizo click en continuar para confirmar
        And Realizo click en Debito
    And Ingreso los datos del medio de Pago Webpay "tarjeta_debito"
        Then Verifico se muestre pantalla de resumen
        # # And Verifico Estado de la Compra en SGO