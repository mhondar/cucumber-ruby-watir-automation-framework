@micuenta
Feature: F06 Mis Ripley Puntos Go

    Scenario: TC044 Validar que se muestren los puntos correspondientes
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F06_TC044"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Gold"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F06_TC044"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Menu lateral en opcion "Mis Ripley Puntos Go"
        And Valido que se muestre pagina Mis Ripley Puntos Go
        Then Valido que se muestren los RPuntosGo del cliente

    Scenario: TC045 Validar al seleccionar Canjear GiftCard se muestren los productos habilitadas de canje de puntos acorde a los puntos
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F06_TC045"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Gold"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F06_TC045"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Menu lateral en opcion "Mis Ripley Puntos Go"
        And Valido que se muestre pagina Mis Ripley Puntos Go
        And Busco la Categoria de canje "Gift Card"
        And Realizo click en Canjear
        Then Validar listado de productos disponibles para canjear

    Scenario: TC047 Validar al seleccionar Leer términos y condiciones se muestren los mismos
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F06_TC047"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Gold"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F06_TC047"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Menu lateral en opcion "Mis Ripley Puntos Go"
        And Valido que se muestre pagina Mis Ripley Puntos Go
        And Realizo click en Canjear
        And Realizo click en leer terminos y condiciones
        Then Valido que se muestra terminos y condiciones 
    
    Scenario: TC048 Validar al seleccionar Beneficios se muestren los correspondientes a la categoría
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F06_TC048"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Gold"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F06_TC048"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Menu lateral en opcion "Mis Ripley Puntos Go"
        And Valido que se muestre pagina Mis Ripley Puntos Go
        And Realizo click en Menu lateral en opcion "Beneficios"
        Then Valido se muestren los beneficios
  
    Scenario: TC049 Validar al seleccionar Beneficios se muestren los correspondientes a la categoría
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "MICUENTA_F06_TC049"
        And Verifico se muestre Home principal
        And Cierro PopUp de Notificaciones
        When Realizo login con las credenciales "mi_cuenta" "Gold"
        Then Verifico login exitoso
        And Abro la pagina de ripley en ambiente "micuenta_qa" de "cl" "MICUENTA_F06_TC049"
        And Valido que se muestre pagina Mis Datos
        And Realizo click en Menu lateral en opcion "Mis Ripley Puntos Go"
        And Valido que se muestre pagina Mis Ripley Puntos Go
        And Realizo click en Menu lateral en opcion "Canjes realizados"
        Then Valido se muestren los canjes realizados