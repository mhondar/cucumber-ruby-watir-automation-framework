@monitor
Feature: E2E CHECKOUT PREPROD F04
@storykey=QCT-3

  Scenario: E2E_CHECKOUT_PREP_F04
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "E2E_CHECKOUT_PREP_F04"
        And Verifico se muestre Home principal
        When Realizo login con las credenciales "tarjeta_credito_rechazar"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "SKU Proveedor"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        And Selecciono otra opcion de despacho por defecto
        And Realizo click en continuar al Pago
        And Verifico que se muestre la pagina de Pago
        And Selecciono el medio de pago "tarjeta_credito_rechazar"
        And Ingreso los datos del medio de Pago "tarjeta_credito_rechazar"
        And Realizo click en Continuar
        Then Verifico mensaje indicando que validara el medio de pago con Webpay
        And Indico Continuar en mensaje de validacion de Webpay
        Then Valido pagina de confirmacion exitosa
        And Acepto las condiciones de compra
        And Realizo click en continuar para confirmar
        And Valido se abra pasarela de pago de Webpay
        And Ingreso los datos de tarjeta de credito en cuotas "tarjeta_credito_rechazar" "3"
        Then Verifico se muestre pantalla de resumen
        # # And Verifico Estado de la Compra en SGO