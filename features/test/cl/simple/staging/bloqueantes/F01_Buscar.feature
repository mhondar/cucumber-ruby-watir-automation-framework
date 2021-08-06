@simple
@simple_mobile
Feature: F01 Caja de Busqueda

    @smoke_test
    Scenario Outline: TC-1 Validar al buscar SKU existente se muestre ficha del producto
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F01_TC-1"
        And Verifico se muestre Home principal
        When Busco producto <Sku>
        Then Verifico que se muestren resultados de la busqueda ingresada "Sku"

        Examples:
            | CDP                 | Sku                          |
            | "SIMPLE_F01_TC-1_a" | "Internet"                   |
            | "SIMPLE_F01_TC-1_b" | "Variaciones"                |
            | "SIMPLE_F01_TC-1_c" | "Variacion Sin Seleccionar"  |
            | "SIMPLE_F01_TC-1_d" | "Variaciones Marketplace"    |
            | "SIMPLE_F01_TC-1_e" | "Variacion Marketplace"      |
            | "SIMPLE_F01_TC-1_f" | "Descuento Ripley"           |
            | "SIMPLE_F01_TC-1_g" | "Tarjeta Ripley o Check MKP" |
            | "SIMPLE_F01_TC-1_h" | "Internet Marketplace"       |
            | "SIMPLE_F01_TC-1_i" | "Simple Marketplace"         |
            | "SIMPLE_F01_TC-1_j" | "Simple Ripley"              |



    Scenario Outline: TC-2 Validar al buscar por texto se muestre Catálogo de Resultados
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Busco producto <Criterio>
        Then Verifico que se muestren resultados de la busqueda ingresada "Texto"



        Examples:
            | CDP                 | Criterio           |
            | "SIMPLE_F01_TC-2_a" | "poleron"          |
            | "SIMPLE_F01_TC-2_b" | "pantuflas"        |
            | "SIMPLE_F01_TC-2_c" | "mesa de centro"   |
            | "SIMPLE_F01_TC-2_d" | "silla escritorio" |



    Scenario Outline: TC-3 Validar al buscar productos con datos de entrada inválidos, no se muestren resultados
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Busco producto <Dato>
        But Verifico que no se muestren resultados <Criterio>

        Examples:
            | CDP                 | Criterio | Dato                   |
            | "SIMPLE_F02_TC-3_a" | "Sku"    | "12345678901234567890" |
            | "SIMPLE_F02_TC-3_b" | "Texto"  | "xxxxxxxx"             |



    Scenario Outline: TC-4 Validar en Buscador se limpie las palabras que no son validas
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Busco producto con Palabra invalida <Criterio> <PalabraInvalida>
        Then Verifico que se muestren resultados eliminando palabra invalida <Criterio> <PalabraInvalida>

        Examples:
            | CDP               | Criterio        | PalabraInvalida |
            | "SIMPLE_F02_TC-4" | "poleron color" | " desconocido"  |