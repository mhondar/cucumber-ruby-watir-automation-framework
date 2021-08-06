@monitor
Feature: E2E CHECKOUT PREPROD F03
#@storykey=QCT-3


  Scenario: E2E_CHECKOUT_PREP_F03
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "E2E_CHECKOUT_PREP_F03"
        And Verifico se muestre Home principal
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        And Realizo Logout
        When Busco producto "SKU Ripley STS"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        And Realizo inicio de sesion en pantalla de Bienvenida "tarjeta_credito"
        Then Verifico que se muestre pagina de despacho
        And Realizo click en Bolsa de compra de la Miga de Pan
        Then Valido que se cargue la Bolsa de productos
        And Elimino todos los cupones de descuentos aplicados
        And Ingreso Cupon de Descuento "DESPACHOGRATIS"
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        And Realizo click en continuar al Pago
        And Verifico que se muestre la pagina de Pago
        And Selecciono el medio de pago "tarjeta_credito"
        And Ingreso los datos del medio de Pago "tarjeta_credito"
        #And Ingreso cvv y cuotas de tarjeta guardada "tarjeta_credito" "Sin cuotas"
        And Selecciono el Documento Tributario "Factura"
        And Realizo click en Continuar
        Then Valido pagina de confirmacion exitosa
        And Acepto las condiciones de compra
        And Realizo click en continuar para confirmar
        Then Verifico se muestre pantalla de resumen
        # # And Verifico Estado de la Compra en SGO