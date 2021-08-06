@monitorPE
Feature: E2E_MONITOR_PERU_F14

  Scenario: E2E_MONITOR_PERU_F14
        Given Abro la pagina de ripley en ambiente "prd_pe" de "pe" "E2E_MONITOR_PERU_F14"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "tarjeta_ripley"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "Variaciones"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Indico ir a la Bolsa
        And Realizo click en continuar con mi compra old
        And Selecciono tipo de despacho old "Retiro en tienda"
        And Selecciono tienda con retiro old "Disponible"
        And Realizo click en continuar en despacho Old
        And Indico quien retira en tienda old "Yo" 
        And Verifico que se muestre la pagina de Pago old
        And Selecciono el medio de pago old
        And Selecciono comprobante de pago Old "Factura"
        #And Completo datos de la Factura Old
        And Realizo click en Continuar old
        Then Valido pagina de confirmacion exitosa old
        And Acepto las condiciones de compra old
        And Realizo click en continuar para confirmar old
        Then Valido pagina de ingreso de datos de pago old
        And Ingreso los datos del medio de Pago old "tarjeta_ripley" 