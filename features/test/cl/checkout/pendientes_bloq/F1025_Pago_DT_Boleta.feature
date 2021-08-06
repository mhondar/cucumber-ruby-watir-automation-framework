@checkout
Feature: F1025 Pago Documento Tributario Boleta

        Scenario: Validar seleccionada Boleta por defecto
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1025_TC1090"
                And Verifico se muestre Home principal
                When Realizo login con las credenciales "tarjeta_credito"
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
                And Realizo click en continuar al Pago
                Then Verifico que se muestre la pagina de Pago
                Then Verifico que se muestre documento tributario seleccionado "Boleta"
