@simple
Feature: F06 Item del Producto

@rerun
    Scenario Outline: TC-11 Validar en Catálogo 3 Columnas QV al clickear el item se despliegue Quick View
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Realizo click en Filtrar
        And Selecciono Filtro <Filtro> de la faceta <Faceta>
        Then Verifico que una muestra de productos abra el quickview

        Examples:
            | CDP                  | Categoria    | Subcategoria2doNivel | Subcategoria3erNivel  | Faceta  | Filtro |
            # | "SIMPLE_F06_TC-11_a" | "Moda Mujer" | "Tops y chaquetas"   | "Blusas y poleras"    | "Talla" | "L"    |
            | "SIMPLE_F06_TC-11_b" | "Moda Mujer" | "Tops y chaquetas"   | "Chaquetas y blazers" | "Marca" | "CAT"  |
            # | "SIMPLE_F06_TC-11_c" | "Moda Mujer" | "Tops y chaquetas"   | "Polerones"           | "Color" | "Gris" |