@simple
Feature: F09 Item del Producto


    Scenario Outline: TC-16 Validar en Catalogo 3 Columnas sin QV que al clickear item redireccione a la Ficha del mismo producto
        Given Abro la pagina de ripley en ambiente "prd" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Realizo click en Producto Random
        And Verifico que este disponible para comprar
        Then Verifico datos del producto en la ficha "Nombre"

        Examples:
            | CDP                  | Categoria       | Subcategoria2doNivel | Subcategoria3erNivel |
            | "SIMPLE_F09_TC-16_a" | "Moda infantil" | "Ropa de bebé"       | "Bebés"              |
            | "SIMPLE_F09_TC-16_b" | "Moda infantil" | "Babyshower"         | "Packs"              |



@smoke_test
    Scenario Outline: TC-17 Validar en QuickView la consistencia de Precios del Producto en la Ficha
        Given Abro la pagina de ripley en ambiente "prd" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Abro el QuickView de un producto que posea <Precio>
        And Realizo click en titulo del producto
        Then Verifico datos del producto en la ficha <Precio>

        Examples:
            | CDP                  | Categoria    | Subcategoria2doNivel | Subcategoria3erNivel | Precio             |
            | "SIMPLE_F09_TC-17_a" | "Moda Mujer" | "Tops y chaquetas"   | "Blusas y poleras"   | "Precio Normal"    |
            | "SIMPLE_F09_TC-17_b" | "Moda Mujer" | "Tops y chaquetas"   | "Blusas y poleras"   | "Precio Internet"  |
            | "SIMPLE_F09_TC-17_c" | "Moda Mujer" | "Tops y chaquetas"   | "Blusas y poleras"   | "Precio Ripley"    |
            | "SIMPLE_F09_TC-17_d" | "Moda Mujer" | "Tops y chaquetas"   | "Blusas y poleras"   | "Precio Descuento" |

