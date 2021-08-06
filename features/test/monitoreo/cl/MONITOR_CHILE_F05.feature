@monitor 
@matrix
Feature: E2E MONITOR CHILE F05

  Scenario: E2E_MONITOR_CHILE_F05
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "E2E_MONITOR_CHILE_F05"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Busco producto "Prod MKP"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la PreBolsa
        #And Indico ir a la Bolsa
        Then Valido que se cargue la PreBolsa de productos
        And Realizo click en ir a la Bolsa
        #And Compruebo si existe Popup
        And Realizo click en Continuar con mi compra
        And Ingreso como invitado en pantalla de Bienvenida "tarjeta_ripley_gold"
        Then Verifico que se muestre pagina de despacho para crear direccion
        And Realizo click en Bolsa de compra de la Miga de Pan
        Then Valido que se cargue la Bolsa de productos
        And Elimino todos los cupones de descuentos aplicados
        And Ingreso Cupon de Descuento "DESPACHOGRATIS"
        And Realizo click en Continuar con mi compra
        And Realizo click en Ingresar de la Pantalla de Bienvenida
        Then Verifico que se muestre pagina de despacho para crear direccion
        And Creo la direccion nueva con despacho "Disponible"
        And Realizo click en continuar al Pago
        And Verifico que se muestre la pagina de Pago
        And Selecciono el medio de pago "tarjeta_ripley_gold"
        And Ingreso los datos del medio de Pago "tarjeta_ripley_gold"
        # Then Verifico cupon de descuento en pago
        And Realizo click en Continuar
        Then Valido pagina de confirmacion exitosa
        And Acepto las condiciones de compra
        And Realizo click en continuar para confirmar
        Then Verifico se muestre pantalla de resumen
        # And Verifico Descuento aplicado en Pagina de Resumen
        # And Verifico el Monto Total de la compra
        # And Verifico Estado de la Compra en SGO