@simple
Feature: F10 Filtros de Catalogo Commerce 4 columnas sin QuickView


    Scenario Outline: TC-18 Validar en Catálogo 4 columnas al aplicar filtro de categoria arroje resultados
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Segundo Nivel <Subcategoria2doNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria2doNivel>
        And Selecciono categoria Tercer Nivel <SubCat3erNivel>
        Then Verifico que se muestren resultados de la categoria seleccionada <SubCat3erNivel>
        And Guardo cantidad de resultados de catalogo <Categoria> <SubCat3erNivel>

        Examples:
            | CDP                  | Categoria | Subcategoria2doNivel | SubCat3erNivel    |
            | "SIMPLE_F10_TC-18_a" | "Electro" | "Refrigeración"      | "Side by Side"    |
            | "SIMPLE_F10_TC-18_b" | "Tecno"   | "Computación Gamer"  | "Notebooks Gamer" |

@smoke_test
    Scenario Outline: TC-19 Validar en Catálogo 4 columnas al aplicar filtro random muestre n resultados
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Segundo Nivel <Subcategoria2doNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria2doNivel>
        And Selecciono categoria Tercer Nivel <SubCat3erNivel>
        Then Verifico que se muestren resultados de la categoria seleccionada <SubCat3erNivel>
        And Selecciono un Filtro random de la faceta <Faceta>
        Then Verifico que se muestren resultados de la categoria seleccionada <SubCat3erNivel>

        Examples:
            | CDP                  | Categoria | Subcategoria2doNivel | SubCat3erNivel | Faceta   |
            | "SIMPLE_F10_TC-19_a" | "Electro" | "Refrigeración"      | "Side by Side" | "Random" |
            | "SIMPLE_F10_TC-19_b" | "Tecno"   | "Televisión"         | "Smart TV"     | "Random" |

