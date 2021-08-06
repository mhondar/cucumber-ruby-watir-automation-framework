@checkout
Feature: F1035 Confirmacion Caja de Precios Precios

        Scenario: TC1141 Validar Calculo del Subtotal
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1035_TC1141"
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
                Then Verifico Subtotal del Pago en Confirmacion
                
        Scenario: TC1142 Validar Costo Despacho 
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1035_TC1142"
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
                Then Verifico Costo de Despacho en Confirmacion
                     
        Scenario: TC1143 Validar Calculo Total Nomal 
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1035_TC1143"
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
                Then Verifico Total normal en Confirmacion
        
        Scenario: TC1144 Validar Calculo Total Tarjeta Ripley
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1035_TC1144"
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
                Then Verifico Total Tarjeta Ripley en Confirmacion