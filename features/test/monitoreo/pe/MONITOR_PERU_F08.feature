@monitorPE
Feature: E2E_MONITOR_PERU_F08

  Scenario: E2E_MONITOR_PERU_F08
        Given Abro la pagina de ripley en ambiente "prd_pe" de "pe" "E2E_MONITOR_PERU_F08"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "tarjeta_ripley"
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        When Busco producto "2074240937684"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Ingreso la cantidad de productos 2
        And Agrego el producto a la bolsa
        And Indico ir a la Bolsa
