@checkout
Feature: F1034 Confirmacion Caja de Precios Lista de Productos

        Scenario: TC1137 Validar Mostrar Productos en Confirmacion
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1034_TC1137"
                And Verifico se muestre Home principal
                When Realizo login con las credenciales "tarjeta_credito"
                And Verifico login exitoso
                And Realizo click en la Bolsa de Productos
                And Elimino todos los productos de la bolsa del home
                And Realizo click en cerrar la Bolsa
                And Busco producto "Despacho a Domicilio"
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
                And Selecciono el medio de pago "tarjeta_credito"
                And Ingreso los datos del medio de Pago "tarjeta_credito"
                Then Verifico que se muestre informacion de la "tarjeta_credito" xxxx
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Verifico que se muestren los productos agregados en Confirmacion
     
        Scenario: TC1138 Validar Cantidad del Producto correcto
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1034_TC1138"
                And Verifico se muestre Home principal
                When Realizo login con las credenciales "tarjeta_credito"
                And Verifico login exitoso
                And Realizo click en la Bolsa de Productos
                And Elimino todos los productos de la bolsa del home
                And Realizo click en cerrar la Bolsa
                And Busco producto "Despacho a Domicilio"
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
                And Selecciono el medio de pago "tarjeta_credito"
                And Ingreso los datos del medio de Pago "tarjeta_credito"
                Then Verifico que se muestre informacion de la "tarjeta_credito" xxxx
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Verifico que se muestren los productos agregados en Confirmacion
                And Verifico cantidad del producto en Confirmacion
        
        Scenario: TC1139 Validar Precio unidad del producto correcto
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1034_TC1139"
                And Verifico se muestre Home principal
                When Realizo login con las credenciales "tarjeta_credito"
                And Verifico login exitoso
                And Realizo click en la Bolsa de Productos
                And Elimino todos los productos de la bolsa del home
                And Realizo click en cerrar la Bolsa
                And Busco producto "Internet"
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
                And Selecciono el medio de pago "tarjeta_credito"
                And Ingreso los datos del medio de Pago "tarjeta_credito"
                Then Verifico que se muestre informacion de la "tarjeta_credito" xxxx
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Verifico que se muestren los productos agregados en Confirmacion
                And Verifico precio unidad en confirmacion del producto "Internet"
         
        Scenario: TC1140 Validar Precio Unidad con Tarjeta Ripley
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1034_TC1140"
                And Verifico se muestre Home principal
                When Realizo login con las credenciales "tarjeta_credito"
                And Verifico login exitoso
                And Realizo click en la Bolsa de Productos
                And Elimino todos los productos de la bolsa del home
                And Realizo click en cerrar la Bolsa
                And Busco producto "Ripley"
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
                And Selecciono el medio de pago "tarjeta_credito"
                And Ingreso los datos del medio de Pago "tarjeta_credito"
                Then Verifico que se muestre informacion de la "tarjeta_credito" xxxx
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Verifico que se muestren los productos agregados en Confirmacion
                And Verifico precio unidad en confirmacion del producto "Ripley"