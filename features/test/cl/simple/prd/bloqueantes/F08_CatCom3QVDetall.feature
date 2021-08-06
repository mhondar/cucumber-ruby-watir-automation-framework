@simple
Feature: F08 Ver Ficha del Producto

@smoke_test
    Scenario Outline: TC-14 Validar en QuickView el Nombre del Producto coincida con la Ficha
        Given Abro la pagina de ripley en ambiente "prd" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Abro el QuickView de un producto random
        And Realizo click en titulo del producto
        And Verifico que este disponible para comprar
        Then Verifico datos del producto en la ficha "Nombre"

        Examples:
            | CDP                | Categoria     | Subcategoria2doNivel | Subcategoria3erNivel |
            | "SIMPLE_F08_TC-14" | "Moda Hombre" | "Tops y chaquetas"   | "Parkas y abrigos"   |




    Scenario Outline: TC-15 Validar en QuickView los Precios del Producto coincidan con la Ficha
        Given Abro la pagina de ripley en ambiente "prd" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Segundo Nivel <Subcategoria2doNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria2doNivel>
        And Abro el QuickView de un producto que posea <Precio>
        And Realizo click en titulo del producto
        And Verifico que este disponible para comprar
        Then Verifico datos del producto en la ficha "Nombre"

        Examples:
            | CDP                  | Categoria     | Subcategoria2doNivel | Subcategoria3erNivel | Precio            |
            | "SIMPLE_F08_TC-15_a" | "Moda Hombre" | "Jeans y pantalones" | "Jeans"              | "Precio Normal"   |
            | "SIMPLE_F08_TC-15_b" | "Moda Hombre" | "Tops y chaquetas"   | "Poleras"            | "Precio Internet" |
            | "SIMPLE_F08_TC-15_c" | "Moda Hombre" | "Jeans y pantalones" | "Pantalones y buzos" | "Precio Ripley"   |
