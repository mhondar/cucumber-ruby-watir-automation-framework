@rphone
Feature: F003 Oferta de planes


Scenario: TC007 Validar que se muestre información del plan del producto seleccionado 
    Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F002_TC004"
    And Verifico se muestre Home principal de rphone
    And Realizo clic en boton Equipo + Plan
    And Confirmo que me encuentro en catalogo de productos rphone
    When Selecciono un producto desde el catalogo de productos
    And Verifico que se abra la ficha del producto que corresponda
    Then Valido que se muestre ficha con informacion del plan elegido



Scenario: TC008 Validar que se muestre Precio Normal 
    Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F002_TC004"
    And Verifico se muestre Home principal de rphone
    And Realizo clic en boton Equipo + Plan
    And Confirmo que me encuentro en catalogo de productos rphone
    When Selecciono un producto desde el catalogo de productos
    And Confirmo que me encuentro en ficha de productos rphone
    And Verifico que se abra la ficha del producto que corresponda
    Then Valido que se muestre el precio normal del producto rphone


Scenario: TC009 Validar que se muestre Precio Descuento 
    Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F002_TC004"
    And Verifico se muestre Home principal de rphone
    And Realizo clic en boton Equipo + Plan
    And Confirmo que me encuentro en catalogo de productos rphone
    When Selecciono un producto desde el catalogo de productos
    And Verifico que se abra la ficha del producto que corresponda
    And Confirmo que me encuentro en ficha de productos rphone
    Then Valido que se muestre el precio descuento del producto


Scenario: TC010 Validar que se muestre Precio Valor Celular con Plan 
    Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F002_TC004"
    And Verifico se muestre Home principal de rphone
    And Realizo clic en boton Equipo + Plan
    And Confirmo que me encuentro en catalogo de productos rphone
    When Selecciono un producto desde el catalogo de productos
    And Confirmo que me encuentro en ficha de productos rphone
    And Verifico que se abra la ficha del producto que corresponda
    Then Valido que se muestre el precio Valor Celular con Plan del producto


Scenario: TC011 Validar que al darle clic al link Elegir Otro Plan me despliegue información de planes
    Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F002_TC004"
    And Verifico se muestre Home principal de rphone
    And Realizo clic en boton Equipo + Plan
    And Confirmo que me encuentro en catalogo de productos rphone
    And Selecciono un producto desde el catalogo de productos
    And Confirmo que me encuentro en ficha de productos rphone
    When Verifico que se abra la ficha del producto que corresponda
    And Realizo clic en link Elegir Otro Plan
    Then Valido que se despliegue sección Elige tu Plan


Scenario: TC012 Validar que al darle clic al link Ver Caracteristicas me despliegue caracteristicas del producto
    Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F002_TC004"
    And Verifico se muestre Home principal de rphone
    And Realizo clic en boton Equipo + Plan
    And Confirmo que me encuentro en catalogo de productos rphone
    And Selecciono un producto desde el catalogo de productos
    And Confirmo que me encuentro en ficha de productos rphone
    And Verifico que se abra la ficha del producto que corresponda
    And Realizo clic en link Elegir Otro Plan 
    When Valido que se despliegue sección Elige tu Plan
    And Presiono link Ver Caracteristicas
    Then Valido que se despliegue sección Caracteristicas del Celular


Scenario: TC013 Validar que al elegir un nuevo Plan se actualice la información en ficha de producto
    Given Abro la pagina de ripley en ambiente "rphone_staging" de "cl" "RPHONE_F002_TC004"
    And Verifico se muestre Home principal de rphone
    And Realizo clic en boton Equipo + Plan
    And Confirmo que me encuentro en catalogo de productos rphone
    And Selecciono un producto desde el catalogo de productos
    And Verifico que se abra la ficha del producto que corresponda
    And Valido que se muestre ficha con informacion del plan elegido
    And Realizo clic en link Elegir Otro Plan 
    When Valido que se despliegue sección Elige tu Plan
    And Selecciono un nuevo Plan random
    Then Valido que se actualice la información correctamente
