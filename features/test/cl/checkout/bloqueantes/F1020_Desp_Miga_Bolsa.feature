@checkout
Feature: F1020 Miga de Pan

        Scenario: TC1078 Despacho Miga de Pan Bolsa de compra Validar al seleccionar Bolsa en la Miga de pan redirecciona a la Bolsa
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1020_TC1078"
                And Verifico se muestre Home principal
                When Realizo login con las credenciales "tarjeta_credito"
                Then Verifico login exitoso
                And Realizo click en la Bolsa de Productos
                And Elimino todos los productos de la bolsa del home
                And Realizo click en cerrar la Bolsa
                When Busco producto "Disponible"
                Then Verifico que este disponible para comprar
                And Selecciono opcion del producto random
                And Agrego el producto a la bolsa
                And Realizo click en continuar en PopUp de Garantia Extendida
                And Indico ir a la Bolsa
                Then Valido que se cargue la Bolsa de productos
                And Realizo click en Continuar con mi compra
                Then Verifico que se muestre pagina de despacho
                And Realizo click en Bolsa de compra de la Miga de Pan
                Then Valido que se cargue la Bolsa de productos
 
        Scenario: TC1125 Pago Miga de Pan Bolsa Validar redirecciona a la Bolsa
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1020_TC1125"
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
                And Selecciono tipo de despacho "A domicilio"
                And Realizo click en continuar al Pago
                And Verifico que se muestre la pagina de Pago
                And Realizo click en Bolsa de compra de la Miga de Pan
                Then Valido que se cargue la Bolsa de productos
 
        Scenario: TC1126 Pago Miga de Pan Despacho Validar redirecciona al Despacho
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1020_TC1126"
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
                And Selecciono tipo de despacho "A domicilio"
                And Realizo click en continuar al Pago
                And Verifico que se muestre la pagina de Pago
                And Realizo click en Despacho de la Miga de Pan
                Then Verifico que se muestre pagina de despacho