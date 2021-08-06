@monitor 
@matrix
Feature: E2E MONITOR CHILE F06


  Scenario: E2E_MONITOR_CHILE_F06
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "E2E_MONITOR_CHILE_F06"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "tarjeta_ripley_gold"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        And Realizo Logout
        Then Verifico se realizo el logout correctamente
        When Busco producto "Prod MKP"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        #And Realizo click en continuar en PopUp de Garantia Extendida
        #And Indico seguir comprando
        When Busco producto "Extragarantia"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono extragaratia "Si"
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la PreBolsa
        #And Indico ir a la Bolsa
        Then Valido que se cargue la PreBolsa de productos
        And Realizo click en ir a la Bolsa
        And Realizo click en Continuar con mi compra
        And Realizo inicio de sesion en pantalla de Bienvenida "tarjeta_ripley_gold"
        Then Verifico que se muestre pagina de despacho
        And Realizo click en Bolsa de compra de la Miga de Pan
        Then Valido que se cargue la Bolsa de productos
        And Elimino todos los cupones de descuentos aplicados
        # And Ingreso Cupon de Descuento "DESPACHOGRATIS"
        # Then Verifico cupon de descuento aplicado
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        And Realizo click en continuar al Pago
        And Verifico que se muestre la pagina de Pago
        And Selecciono el medio de pago "tarjeta_ripley_gold"
        And Ingreso los datos del medio de Pago "tarjeta_ripley_gold"
        And Realizo click en Continuar
        Then Valido pagina de confirmacion exitosa
        And Acepto las condiciones de compra
        And Realizo click en continuar para confirmar
        Then Verifico se muestre pantalla de resumen
        # And Verifico Estado de la Compra en SGO