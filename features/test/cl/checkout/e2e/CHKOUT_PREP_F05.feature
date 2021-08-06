@monitor
Feature: E2E CHECKOUT PREPROD F05
@storykey=QCT-3


  Scenario: E2E_CHECKOUT_PREP_F05
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "E2E_CHECKOUT_PREP_F05"
        And Verifico se muestre Home principal
        When Busco producto "SKU Ripley RT"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono extragaratia "Si"
        And Agrego el producto a la bolsa
        And Indico ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        And Ingreso como invitado en pantalla de Bienvenida "tarjeta_credito"
        Then Verifico que se muestre pagina de despacho
        And Selecciono tipo de despacho "Retiro en tienda"
        And Selecciono tienda con retiro "Disponible"
        And Realizo click en continuar al Pago
        And Indico quien retira en tienda "Yo" 
        And Verifico que se muestre la pagina de Pago
        And Selecciono el medio de pago "tarjeta_credito"
        And Ingreso los datos del medio de Pago "tarjeta_credito"
        And Realizo click en Continuar
        Then Valido pagina de confirmacion exitosa
        And Acepto las condiciones de compra
        And Realizo click en continuar para confirmar
        Then Verifico se muestre pantalla de resumen
        # And Verifico Estado de la Compra en SGO