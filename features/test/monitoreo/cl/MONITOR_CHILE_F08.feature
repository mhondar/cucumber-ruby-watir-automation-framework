@monitor
Feature: E2E MONITOR CHILE F08
NO SE POSEE CUPON

  Scenario: E2E_MONITOR_CHILE_F08
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "E2E_MONITOR_CHILE_F08"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Busco producto "Extragarantia"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Selecciono extragaratia del popup "Si"
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la PreBolsa    
        Then Valido que se cargue la PreBolsa de productos
        And Realizo click en ir a la Bolsa
        And Realizo click en Continuar con mi compra
        And Ingreso como invitado en pantalla de Bienvenida "tarjeta_ripley"
        And Realizo click en Bolsa de compra de la Miga de Pan
        Then Valido que se cargue la Bolsa de productos
        And Elimino todos los cupones de descuentos aplicados
        # And Ingreso Cupon de Descuento "XXX"
        # Then Verifico cupon de descuento aplicado
        And Realizo click en Continuar con mi compra
        And Realizo click en Ingresar de la Pantalla de Bienvenida
        Then Verifico que se muestre pagina de despacho para crear direccion
        And Creo la direccion nueva con despacho "Disponible"
        And Selecciono tipo de despacho "Retiro en tienda"
        And Selecciono tienda con retiro "Disponible"
        And Realizo click en continuar al Pago
        And Indico quien retira en tienda "Yo" 
        And Verifico que se muestre la pagina de Pago
        And Selecciono el medio de pago "tarjeta_ripley"
        And Ingreso los datos del medio de Pago "tarjeta_ripley"
        # Then Verifico cupon de descuento en pago
        And Realizo click en Continuar
        Then Valido pagina de confirmacion exitosa
        And Acepto las condiciones de compra
        And Realizo click en continuar para confirmar
        Then Verifico se muestre pantalla de resumen
        # And Verifico Descuento aplicado en Pagina de Resumen
        And Verifico el Monto Total de la compra
        # And Verifico Estado de la Compra en SGO