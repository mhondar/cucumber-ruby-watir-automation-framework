@rphone
Feature: F002 Catalogo de Productos


Scenario: TC005 Validar que al ingresar al catalogo se cargen los productos correctamente
    Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F002_TC004"
    And Verifico se muestre Home principal de rphone
    And Realizo clic en boton Equipo + Plan
    When Confirmo que me encuentro en catalogo de productos rphone
    Then Valido que se carguen los productos en el catalogo de rphone


Scenario: TC006 Validar que al seleccionar un producto me redireccione a la ficha correcta
    Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F002_TC004"
    And Verifico se muestre Home principal de rphone
    And Realizo clic en boton Equipo + Plan
    And Confirmo que me encuentro en catalogo de productos rphone
    When Selecciono un producto desde el catalogo de productos
    And Confirmo que me encuentro en ficha de productos rphone
    Then Verifico que se abra la ficha del producto que corresponda