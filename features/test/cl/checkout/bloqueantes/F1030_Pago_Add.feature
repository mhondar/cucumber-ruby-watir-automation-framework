@checkout
Feature: F1030 Pago Caja de Precio Agregar Mas productos
 
        Scenario: TC1122 Validar al seleccionar Agregar mas productos se muestre la pagina del Home
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1030_TC1122"
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
                And Realizo click en Agregar mas productos en Pago
                Then Verifico se muestre Home principal
       
        Scenario: TC1123 Validar al Agregar mas productos se muestre la pagina del Pago el producto agregado
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1030_TC1123"
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
                And Verifico que se muestre la pagina de Pago
                And Realizo click en Agregar mas productos en Pago
                Then Verifico se muestre Home principal
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
                Then Verifico que se muestren los productos agregados en pago