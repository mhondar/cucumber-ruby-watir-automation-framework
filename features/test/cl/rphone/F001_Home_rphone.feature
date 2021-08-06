@rphone
Feature: F001 Catalogo de 3 columnas


    Scenario: TC001 Validar que al ingresar a rphone cargue correctamente el home
        Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F001_TC001"
        Then Verifico se muestre Home principal de rphone


    Scenario: TC002 Validar que al darle click al boton Celular + Plan me redireccione a catálogo de productos
        Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F001_TC002"
        And Verifico se muestre Home principal de rphone
        When Realizo clic en boton Equipo + Plan
        Then Confirmo que me encuentro en catalogo de productos rphone

#caso de prueba ua no aplica
    Scenario: TC003 Validar que al darle click al boton Ver detalles me redireccione a ficha de productos
        Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F001_TC003"
        And Verifico se muestre Home principal de rphone
        When Realizo clic en botón Ver detalles
        Then Confirmo que me encuentro en ficha de productos rphone

#caso de prueba ua no aplica
    Scenario: TC005 Validar que al darle click a la imagen del Producto me redireccione a ficha de productos
        Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F001_TC003"
        And Verifico se muestre Home principal de rphone
        When Realizo clic en imagen de producto
        Then Confirmo que me encuentro en ficha de productos rphone