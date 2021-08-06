@simple
@simple_mobile
Feature: F16 Ficha del Producto - Add Bolsa


    Scenario: TC-47 Validar en la Ficha de Productos al clickear Agregar a la bolsa se añada a la bolsa el producto
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F16_TC-47"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        Then Valido producto agregado en la bolsa del home

@smoke_test
    Scenario: TC-48 Validar en la Bolsa producto agregado desde carrusel del home
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_F16_TC-48"
        And Busco producto "Recomendaciones"
        Then Verifico que este disponible para comprar
        And Agrego el primer producto desde las recomendaciones 
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        Then Valido producto agregado desde carrusel en la bolsa del home