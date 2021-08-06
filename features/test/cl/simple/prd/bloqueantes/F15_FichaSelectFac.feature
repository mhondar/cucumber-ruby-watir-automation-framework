@simple
@simple_mobile
Feature: F15 Ficha del Producto - Add Bolsa

@smoke_test
    Scenario: TC-40 Validar en la Ficha de Productos al cambiar de color se cambie la imagen del producto
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F15_TC-40"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Verifico que cargue la imagen principal del producto
        And Consulto nombre de imagen principal
        When Selecciono otra imagen random del producto
        Then Verifico que se haya modificado la imagen del producto



    Scenario: TC-41 Validar en la Ficha de Productos al seleccionar la talla y color se habilite botón Agregar a la bolsa
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F15_TC-41"
        And Busco producto "Variaciones"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa



    Scenario Outline: TC-42 Validar en la Ficha de Productos que muestre paleta de colores
        Given Abro la pagina de ripley en ambiente "prd" de "cl" <CDP>
        And Busco producto <Variedad_Colores>
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        Then Valido que se muestre paleta de colores

        Examples:
            | CDP                | Variedad_Colores |
            | "SIMPLE_F15_TC-42" | "2000375841664"  |



    Scenario: TC-43 Validar en la Ficha de Productos se muestren tallas disponibles
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F15_TC-43"
        And Busco producto "Variaciones"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        Then Valido que se muestren las tallas disponibles


    Scenario: TC-44 Validar en la Ficha la opción de conoce tu talla
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F15_TC-44"
        When Busco producto "Variacion_Calzado"
        And Verifico que este disponible para comprar
        Then Realizo Click en Conoce tu talla
        And Valido que se muestre conoce tu talla


    Scenario: TC-45 Validar en la Ficha la guía de tallas
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F15_TC-45"
        When Busco producto "Variacion_Calzado"
        And Verifico que este disponible para comprar
        Then Realizo Click guia de tallas
        And Valido que se muestre guia de tallas



    Scenario Outline: TC-46 Validar en la Ficha cambio de TAB
        Given Abro la pagina de ripley en ambiente "prd" de "cl" <CDP>
        And Busco producto "Disponible"
        When Selecciono de la ficha producto tab <NombreTab>
        Then Verifico que se cambie de tab correctamente <NombreTab>
        When Selecciono de la ficha producto tab <NombreTab2>
        Then Verifico que se cambie de tab correctamente <NombreTab2>
        When Selecciono de la ficha producto tab <NombreTab3>
        Then Verifico que se cambie de tab correctamente <NombreTab3>

        Examples:
            | CDP                | NombreTab          | NombreTab2    | NombreTab3 |
            | "SIMPLE_F15_TC-46" | "Especificaciones" | "Comentarios" | "Garantía" |



    Scenario Outline: TC-72 validar en la Ficha que se levante el iframe de Realidad Aumentada
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F15_TC-72"
        And Busco producto <Realidad aumentada>
        And Verifico que este disponible para comprar
        When Realizo Click Ver con realidad aumentada
        Then Valido que se despliegue iframe de realidad aumentada

        Examples:
            | CDP                | Realidad aumentada | 
            | "SIMPLE_F87_TC000" | "2000380462229" | 