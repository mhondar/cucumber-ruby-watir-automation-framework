@simple
Feature: F12 Ver mas detalles


    Scenario Outline: TC-24 Validar en Catálogo 4 columnas que al clickear producto redireccione a la Ficha y se mantenga el Nombre
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Realizo click en Producto Random
        And Verifico que este disponible para comprar
        Then Verifico datos del producto en la ficha "Nombre"

        Examples:
            | CDP                  | Categoria         | Subcategoria2doNivel | Subcategoria3erNivel |
            | "SIMPLE_F12_TC-24_a" | "Electro"         | "Refrigeración"      | "Side by Side"       |
            | "SIMPLE_F12_TC-24_b" | "Muebles y hogar" | "Oficina"            | "Escritorios"        |



    Scenario Outline: TC-25 Validar en Catálogo 4 columnas que al clickear producto redireccione a la Ficha y se mantenga los Precios
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Realizo click en Producto Random
        And Verifico que este disponible para comprar
        Then Verifico datos del producto en la ficha "Nombre"

        Examples:
            | CDP                  | Categoria | Subcategoria2doNivel | Subcategoria3erNivel      | Precio            |
            | "SIMPLE_F12_TC-25_a" | "Electro" | "Lavandería"         | "Lavadoras"               | "Precio Normal"   |
            | "SIMPLE_F12_TC-25_b" | "Electro" | "Climatización"      | "Calientacamas"           | "Precio Internet" |
            | "SIMPLE_F12_TC-25_c" | "Electro" | "Aseo"               | "Aspiradoras de Arrastre" | "Precio Ripley"   |
            | "SIMPLE_F12_TC-25_d" | "Electro" | "Smart home"         | "Robots de cocina"        | "Precio Ripley"   |



    Scenario Outline: TC-26 Validar en Catálogo 4 columnas el paginado a la segunda página
        Given Abro la pagina de ripley en ambiente "staging" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Busco producto <Criterio>
        And Verifico que se muestren resultados de la busqueda ingresada "Texto"
        And Cambio a la segunda página de resultado
        Then Valido que la página cambia correctamente

        Examples:
            | CDP                  | Criterio           |
            | "SIMPLE_F12_TC-26_a" | "polera azul"      |
            | "SIMPLE_F12_TC-26_b" | "pantuflas"        |
            | "SIMPLE_F12_TC-26_c" | "mesa de centro"   |
            | "SIMPLE_F12_TC-26_d" | "silla escritorio" |
