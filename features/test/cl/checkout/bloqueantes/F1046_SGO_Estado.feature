@checkout
Feature: F1046 Pantalla Resumen Datos de la Compra con DD Monto Total
 
        Scenario Outline: Datos de la Compra Tarjeta de Crédito (Sin Transbank) Validar Monto Total
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" <CDP>
                And Verifico se muestre Home principal
                When Realizo login con las credenciales <Medio>
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
                And Selecciono el medio de pago <Medio>
                And Ingreso los datos del medio de Pago <Medio>
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Realizo click en continuar para confirmar
                Then Verifico se muestre pantalla de resumen
                And Verifico Estado de la Compra en SGO

                Examples:
                        | CDP                   | Medio            |
                        | "CHKOUT_F1046_TC1175" | "tarjeta_credito" |
                        | "CHKOUT_F1046_TC1189" | "tarjeta_ripley" |
 
        Scenario: TC1182 Datos de la Compra Tarjeta de Débito Validar Monto Total
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1046_TC1182"
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
                And Verifico Estado de la Compra en SGO
 
        Scenario: TC1196 Datos de la Compra Tarjeta de Credito (Con Webpay) Validar Monto Total
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1046_TC1196"
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
                And Verifico Estado de la Compra en SGO
 
        Scenario: TC1203 Datos de la Compra Tarjeta de Credito (Con Webpay) Validar Monto Total
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1046_TC1203"
                And Verifico se muestre Home principal
                When Realizo login con las credenciales "gifcard_empresas"
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
                And Selecciono el medio de pago "gifcard_empresas"
                And Ingreso los datos del medio de Pago "gifcard_empresas"
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Realizo click en continuar para confirmar
                Then Verifico se muestre pantalla de resumen
                And Verifico Estado de la Compra en SGO