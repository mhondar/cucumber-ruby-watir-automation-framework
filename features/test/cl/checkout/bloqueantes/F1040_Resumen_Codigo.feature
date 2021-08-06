@checkout
Feature: F1040 Pantalla Resumen Datos de la Compra con DD Codigo de Reserva
         
        Scenario: TC1169 Datos de la Compra Tarjeta de Crédito (Sin Transbank) Validar se muestre mensaje Listo! Con el Codigo de Confirmacion de la compra
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1040_TC1169"
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
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Realizo click en continuar para confirmar
                Then Verifico se muestre pantalla de resumen
                And Verifico se muestre codigo de confirmacion de la compra
 
        Scenario: TC1183 Datos de la Compra Tarjeta Ripley (Sin Transbank) Validar se muestre mensaje Listo! Con el Codigo de Confirmacion de la compra
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1040_TC1183"
                And Verifico se muestre Home principal
                When Realizo login con las credenciales "tarjeta_ripley"
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
                And Selecciono el medio de pago "tarjeta_ripley"
                And Ingreso los datos del medio de Pago "tarjeta_ripley"
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Realizo click en continuar para confirmar
                Then Verifico se muestre pantalla de resumen
                And Verifico se muestre codigo de confirmacion de la compra

        Scenario: TC1176 Datos de la Compra Tarjeta de Débito Validar se muestre mensaje Listo! Con el Codigo de Confirmacion de la compra
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1040_TC1176"
                And Verifico se muestre Home principal
                When Realizo login con las credenciales "tarjeta_debito"
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
                And Selecciono el medio de pago "tarjeta_debito"
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Realizo click en continuar para confirmar
                And Ingreso los datos del medio de Pago Transbank "tarjeta_debito"
                Then Verifico se muestre pantalla de resumen
                And Verifico se muestre codigo de confirmacion de la compra
 
        Scenario: TC1190 Datos de la Compra Tarjeta de Credito (Con Webpay) Validar se muestre mensaje Listo! Con el Codigo de Confirmacion de la compra
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1040_TC1190"
                And Verifico se muestre Home principal
                When Realizo login con las credenciales "tarjeta_credito_rechazar"
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
                And Selecciono el medio de pago "tarjeta_credito_rechazar"
                And Ingreso los datos del medio de Pago "tarjeta_credito_rechazar"
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Realizo click en continuar para confirmar
                And Ingreso los datos del medio de Pago Transbank "tarjeta_credito_rechazar"
                Then Verifico se muestre pantalla de resumen
                And Verifico se muestre codigo de confirmacion de la compra