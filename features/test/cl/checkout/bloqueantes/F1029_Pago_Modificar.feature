@checkout
Feature: F1029 Pago Caja de Precio Modificar compra
 
        Scenario: TC1119 Validar al seleccionar Modificar compra muestre la Bolsa de Compras
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1029_TC1119"
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
                And Realizo click en Modificar compra en Pago
                Then Valido que se cargue la Bolsa de productos
  
        Scenario: TC1120 Validar al cambiar Cantidad del Producto en Bolsa y seguir hasta pagina de Pago se mantenga el cambio
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1029_TC1120"
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
                And Realizo click en Modificar compra en Pago
                Then Valido que se cargue la Bolsa de productos
                And Ingreso la cantidad del producto en la Bolsa 2
                And Realizo click en Continuar con mi compra
                Then Verifico que se muestre pagina de despacho
                And Selecciono tipo de despacho "A domicilio"
                And Realizo click en continuar al Pago
                And Verifico que se muestre la pagina de Pago
                And Verifico cantidad del producto en Pago
        
        Scenario: TC1121 Validar al eliminar un Producto en Bolsa y seguir hasta pagina de Pago se elimine este
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1029_TC1121"
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
                And Indico seguir comprando
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
                And Realizo click en Modificar compra en Pago
                Then Valido que se cargue la Bolsa de productos
                And Elimino producto de la bolsa 1
                And Realizo click en Continuar con mi compra
                Then Verifico que se muestre pagina de despacho
                And Realizo click en continuar al Pago
                And Verifico que se muestre la pagina de Pago
                Then Verifico que se muestren los productos agregados en pago