@simple
Feature: F07 Boton Agregar a la bolsa

    @smoke_test
    Scenario Outline: TC-12 Validar en QuickView al seleccionar la talla y color se habilite botón Agregar a la bolsa
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Abro el QuickView de un producto random
        And Selecciono opcion del producto en QuickView random
        Then Valido se active boton Agregar a la bolsa del QuickView

        Examples:
            | CDP                | Categoria    | Subcategoria2doNivel      | Subcategoria3erNivel |
            | "SIMPLE_F07_TC-12" | "Moda Mujer" | "Ropa Interior y Pijamas" | "Batas y pantuflas"  |



    @smoke_test
    @rerun
    # @wip
    Scenario Outline: TC-13 Validar en QuickView al agregar a la bolsa se realice correctamente
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Abro el QuickView de un producto random
        And Selecciono opcion del producto en QuickView random
        And Valido se active boton Agregar a la bolsa del QuickView
        And Realizo click en Agregar a la bolsa del QuickView
        And Realizo click en la Bolsa de Productos
        Then Valido producto agregado en la bolsa del home

        Examples:
            | CDP                | Categoria     | Subcategoria2doNivel | Subcategoria3erNivel |
            | "SIMPLE_F07_TC-13" | "Moda Hombre" | "Tops y chaquetas"   | "Polerones"          |



@smoke_test
    Scenario Outline: TC-73 Validar en QV al dar click en boton Back del browser me regrese al catalogo de productos
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Abro el QuickView de un producto random
        When Presiono Boton Volver desde el navegador
        Then Verifico que me regrese a la pagina anterior correspondiente <Subcategoria3erNivel>

        # Then Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>

        Examples:
            | CDP                | Categoria     | Subcategoria2doNivel | Subcategoria3erNivel |
            | "SIMPLE_F07_TC-73" | "Moda Hombre" | "Tops y chaquetas"   | "Polerones"          |