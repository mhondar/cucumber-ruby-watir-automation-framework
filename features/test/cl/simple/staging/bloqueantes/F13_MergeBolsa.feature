@simple
@simple_mobile
Feature: F13 Merge de Productos

@rerun
# @wip
    Scenario: TC-27 Validar en Despacho los productos agregados antes de loguearse en la Pantalla de Bienvenida
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F13_TC-27"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Realizo click en la Bolsa de Productos
        And Elimino todos los productos de la bolsa del home
        And Realizo click en cerrar la Bolsa
        And Realizo Logout
        Then Verifico se realizo el logout correctamente
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
        And Realizo inicio de sesion en pantalla de Bienvenida "tarjeta_credito"
        Then Verifico que se muestre pagina de despacho
        And Verifico que se muestren los productos agregados en despacho


@smoke_test
# Bloqueado
    Scenario: TC-28 Validar en Despacho los productos agregados antes y después se realizar login en Pantalla de Bienvenida
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "SIMPLE_F13_TC-28"
        And Busco producto "Disponible"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        And Selecciono comuna o tienda mas cercana
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        And Busco producto "Ripley"
        Then Verifico que este disponible para comprar
        And Selecciono opcion del producto random
        Then Valido se active boton Agregar a la bolsa
        And Agrego el producto a la bolsa
        And Realizo click en continuar en PopUp de Garantia Extendida
        And Realizo click en la Bolsa de Productos
        And Realizo click en ir a la Bolsa
        Then Valido que se cargue la Bolsa de productos
        And Realizo click en Continuar con mi compra
        Then Verifico que se muestre pagina de despacho
        And Verifico que se muestren los productos agregados en despacho
