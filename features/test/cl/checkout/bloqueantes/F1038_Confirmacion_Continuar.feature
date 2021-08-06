@checkout
Feature: F1038 Confirmacion Caja de Precios Precios

        Scenario: TC1147 Validar sin Aceptar condiciones de compra al hacer click en Pagar muestre mensaje de alerta/Pendiente permita avanzar
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1038_TC1147"
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
                And Realizo click en continuar para confirmar
                Then Verifico mensaje de alerta "Debe aceptar los términos y condiciones de uso."
                Then Valido pagina de confirmacion exitosa

        Scenario: TC1148 Continuar con mi compra (TC - Transaccion Completa) Validar al Aceptar condiciones de compra y hacer click en pagar muestre pagina de Resumen
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1038_TC1148"
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
                And Realizo click en continuar para confirmar
                Then Verifico se muestre pantalla de resumen

        Scenario: TC1149 Continuar con mi compra (TD - Redbank) Validar al Aceptar condiciones de compra y hacer click en pagar muestre pasarela de pago Redbank
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1038_TC1149"
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
                Then Valido se abra pasarela de pago de Redbank
 
        Scenario: TC1164 Continuar con mi compra (TC - Transaccion Completa Rechazo) Validar al Aceptar condiciones de compra y hacer click en pagar muestre pasarela de pago Webpay
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1038_TC1164"
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
                And Selecciono el medio de pago "tarjeta_credito"
                And Ingreso los datos del medio de Pago "tarjeta_credito"
                Then Verifico que se muestre informacion de la "tarjeta_credito" xxxx
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Realizo click en continuar para confirmar
                Then Valido se abra pasarela de pago de Webpay