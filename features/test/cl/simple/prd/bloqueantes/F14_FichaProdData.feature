@simple
@simple_mobile
Feature: F14 Ficha del Producto


    Scenario: TC-29 Validar en la Ficha del Productos que se muestre nombre del producto
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F14_TC-29"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Valido que se muestre el nombre del producto


    Scenario: TC-30 Validar en la Ficha de Productos que se muestre SKU del producto
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F14_TC-30"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Valido que se muestre el sku del producto


    Scenario: TC-31 Validar en la Ficha de Productos que se muestre calificación del Producto
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F14_TC-31"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Valido que se muestre la calificacion del producto


    Scenario: TC-32 Validar en la Ficha de Productos que se muestre Descripción corta del producto
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F14_TC-32"
        And Busco producto "Ripley"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        Then Valido que se muestre la descripcion del producto
        And Valido que se muestre el container correctamente


    Scenario: TC-33 Validar en la Ficha de Productos que se muestre Precio Normal
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F14_TC-33"
        And Busco producto "Ripley"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Valido que se muestre el precio normal del producto



    Scenario: TC-34 Validar en la Ficha de Productos que se muestre Precio Internet
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F14_TC-34"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Valido que se muestre el precio internet del producto


    Scenario: TC-35 Validar en la Ficha de Productos que se muestre Precio Tarjeta Ripley
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F14_TC-35"
        And Busco producto "Ripley"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Valido que se muestre el precio ripley del producto


    Scenario: TC-36 Validar en la Ficha de Productos se muestre % de descuento acorde a los precios mostrados
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F14_TC-36"
        And Busco producto "Ripley"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Valido que se muestre el descuento correcto

    Scenario: TC-37 Validar en la Ficha de Productos se muestre la cantidad de Ripley Puntos Go que acumulas
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F14_TC-37"
        And Busco producto "Ripley"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Valido que se muestre la cantidad de ripley puntos Go del producto


@no_meta1
    Scenario: TC-38 Validar en la Ficha al seleccionar una comuna se muestre la disponibilidad de despacho y/o retiro
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F14_TC-38"
        And Busco producto "Internet"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        And Valido que se muestre el despacho a domicilio correctamente

@no_meta1
@smoke_test
    Scenario: TC-39 Validar en la Ficha al cambiar comuna se muestre la disponibilidad de despacho y/o retiro
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F14_TC-39"
        And Busco producto "Internet"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        And Valido que se muestre el despacho a domicilio correctamente
        And Realizo click en boton de cambiar comuna
        And Selecciono comuna siguiente
        And Valido que se muestre el despacho a domicilio correctamente