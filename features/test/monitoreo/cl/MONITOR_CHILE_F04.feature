@monitor 
@matrix
Feature: E2E MONITOR CHILE F04

  Scenario: E2E_MONITOR_CHILE_F04
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "E2E_MONITOR_CHILE_F04"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "tarjeta_ripley_gold"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "Prod Ripley"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        #And Ingreso la cantidad de productos 2
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la PreBolsa
        #And Indico ir a la Bolsa
        Then Valido que se cargue la PreBolsa de productos
        #And Ingreso la cantidad del producto en la Bolsa 2
        And Realizo click en ir a la Bolsa
        And Ingreso la cantidad del producto en la Bolsa 2
        And Elimino todos los cupones de descuentos aplicados
        # And Ingreso Cupon de Descuento "DESPACHOGRATIS"
        # Then Verifico cupon de descuento aplicado
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        And Selecciono tipo de despacho "A domicilio"
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
        And Verifico Descuento aplicado en Pagina de Resumen
        And Verifico el Monto Total de la compra
        # # And Verifico Estado de la Compra en SGO