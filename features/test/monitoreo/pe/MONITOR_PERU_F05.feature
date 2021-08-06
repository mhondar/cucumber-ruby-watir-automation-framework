@monitorPE
Feature: E2E_MONITOR_PERU_F05

  Scenario: E2E_MONITOR_PERU_F05
        Given Abro la pagina de ripley en ambiente "prd_pe" de "pe" "E2E_MONITOR_PERU_F05"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "prod MKP"
        Then Verifico que este disponible para comprar
        And Agrego el producto a la bolsa
        And Indico ir a la Bolsa
        And Realizo click en continuar con mi compra old
        Then Valido que se muestre pantalla de Bienvenida Old
        And Ingreso como invitado en pantalla de Bienvenida Old "tarjeta_ripley"
        Then Acepto las condiciones de compra Old
        And Verifico que se muestre la pagina de Despacho Old
        And Creo la direccion con despacho Old
        And Realizo click en continuar en despacho Old
        And Verifico que se muestre la pagina de Pago old
        And Selecciono el medio de pago old
        And Realizo click en Continuar old
        Then Valido pagina de confirmacion exitosa old
        And Acepto las condiciones de compra old
        And Realizo click en continuar para confirmar old
        Then Valido pagina de ingreso de datos de pago old
        And Ingreso los datos del medio de Pago old "tarjeta_ripley"
