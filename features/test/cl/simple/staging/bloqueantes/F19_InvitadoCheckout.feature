@simple
@simple_mobile
Feature: F19 Pantalla de Bienvenida a Ripley


    Scenario: TC-55 Validar en Pantalla de Bienvenida ingresar como invitado
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F19_TC-55"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Valido que se muestre pantalla de Bienvenida
        And Ingreso como invitado en pantalla de Bienvenida "tarjeta_credito"
        Then Verifico que se muestre pagina de despacho para crear direccion

