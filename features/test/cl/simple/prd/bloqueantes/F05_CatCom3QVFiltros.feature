@simple 
Feature: F05 Filtros de Catalogo Commerce 3 columnas con QuickView

@smoke_test
    Scenario: TC-9 Validar en Catálogo 3 Columnas QV al aplicar filtro de categoría arroje resultados
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F05_TC-9"
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel "Moda Mujer"
        And Realizo click en Categoria de Segundo Nivel "Tops y chaquetas"
        And Verifico que se muestren resultados de la categoria seleccionada "Tops y chaquetas"
        And Realizo click en Filtrar
        And Selecciono filtro de categoria Tercer Nivel "Sweaters y chalecos"
        Then Verifico que se muestren resultados de la categoria seleccionada "Sweaters y chalecos"
        And Guardo cantidad de resultados de catalogo "Moda Mujer" "Sweaters y chalecos"

#Pendiente revision error elemento obscured
    Scenario: TC-10 Validar en Catálogo 3 Columnas QV al aplicar filtro random muestre n resultados
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F05_TC-10"
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel "Moda Mujer"
        And Realizo click en Categoria de Segundo Nivel "Jeans y Pantalones"
        And Verifico que se muestren resultados de la categoria seleccionada "Jeans y Pantalones"
        And Realizo click en Filtrar
        And Selecciono filtro de categoria Tercer Nivel "Jeans"
        Then Verifico que se muestren resultados de la categoria seleccionada "Jeans"
        And Realizo click en Filtrar
        And Selecciono Filtro random de la faceta "Random"
        Then Verifico que se muestren resultados de la categoria seleccionada "Jeans"