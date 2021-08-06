@checkout
Feature: F1022 Pago Medio de Pago Seleccionar Tarjeta Ripley
         
        Scenario: TC1080 Validar Ingreso de Datos de tarjeta Validos
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1022_TC1080"
                And Verifico se muestre Home principal
                When Realizo login con las credenciales "tarjeta_ripley"
                Then Verifico login exitoso
                And Realizo click en la Bolsa de Productos
                And Elimino todos los productos de la bolsa del home
                And Realizo click en cerrar la Bolsa
                When Busco producto "Despacho a Domicilio"
                Then Verifico que este disponible para comprar
                And Selecciono opcion del producto random
                And Agrego el producto a la bolsa
                And Realizo click en continuar en PopUp de Garantia Extendida
                And Indico ir a la Bolsa
                Then Valido que se cargue la Bolsa de productos
                And Realizo click en Continuar con mi compra
                Then Verifico que se muestre pagina de despacho
                And Selecciono tipo de despacho "A domicilio"
                And Realizo click en continuar al Pago
                And Verifico que se muestre la pagina de Pago
                And Selecciono el medio de pago "tarjeta_ripley"
                And Ingreso los datos del medio de Pago "tarjeta_ripley"
                Then Verifico que se muestre informacion de la "tarjeta_ripley" xxxx