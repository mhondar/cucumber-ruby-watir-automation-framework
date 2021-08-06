@simple
Feature: F11 Layout Horizontal


    Scenario Outline: TC-20 Validar en la Bolsa agregar Producto c/EG sin la misma
        Given Abro la pagina de ripley en ambiente "prd" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Realizo click en Producto Random de catalogo Layout
        And Verifico que este disponible para comprar
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        Then Valido que se muestre PopUp de Garantia Extendida
        When Realizo click en continuar en PopUp de Garantia Extendida
        When Realizo click en la Bolsa de Productos
        Then Valido producto agregado en la bolsa del home

        Examples:
            | CDP                | Categoria | Subcategoria2doNivel | Subcategoria3erNivel |
            | "SIMPLE_F11_TC-20" | "Tecno"   | "Computación"        | "Notebooks"          |



    Scenario Outline: TC-21 Validar en la Bolsa agregar Producto c/EG seleccionada desde el popup de EG
        Given Abro la pagina de ripley en ambiente "prd" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Realizo click en Producto Random de catalogo Layout
        And Verifico que este disponible para comprar
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        Then Valido que se muestre PopUp de Garantia Extendida
        When Selecciono extragaratia del popup "Si"
        When Realizo click en continuar en PopUp de Garantia Extendida
        When Realizo click en la Bolsa de Productos
        Then Valido producto agregado en la bolsa del home


        Examples:
            | CDP                | Categoria | Subcategoria2doNivel | Subcategoria3erNivel |
            | "SIMPLE_F11_TC-21" | "Tecno"   | "Computación"        | "Notebooks"          |


    #Pendiente, corregido
    @smoke_test
    Scenario Outline: TC-22 Validar al realizar Click en el Producto se muestre la Ficha del mismo
        Given Abro la pagina de ripley en ambiente "prd" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Realizo click en Producto Random de catalogo Layout
        And Verifico que este disponible para comprar
        Then Verifico datos del producto en la ficha "Nombre"

        Examples:
            | CDP                | Categoria    | Subcategoria2doNivel | Subcategoria3erNivel |
            | "SIMPLE_F11_TC-22" | "Dormitorio" | "Colchones"          | "King y Super King"  |



    Scenario Outline: TC-23 Validar en la Bolsa agregar Producto s/EG donde no se debe mostrar popup de EG
        Given Abro la pagina de ripley en ambiente "prd" de "cl" <CDP>
        And Verifico se muestre Home principal
        When Realizo click en Menu de Categorias
        And Realizo click en Categoria de Primer Nivel <Categoria>
        And Realizo click en Categoria de Tercer Nivel <Subcategoria2doNivel> <Subcategoria3erNivel>
        And Verifico que se muestren resultados de la categoria seleccionada <Subcategoria3erNivel>
        And Realizo click en Producto Random de catalogo Layout
        And Verifico que este disponible para comprar
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en la Bolsa de Productos
        Then Valido producto agregado en la bolsa del home

        Examples:
            | CDP                | Categoria | Subcategoria2doNivel | Subcategoria3erNivel |
            | "SIMPLE_F11_TC-23" | "Tecno"   | "Computación"        | "Almacenamiento"     |