@checkout
Feature: F1033 Confirmacion Pago

        Scenario: TC1133 Validar al seleccionar Modificar Pago redireccione a la pagina de pago
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1033_TC1133"
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
                And Realizo click en Modificar Pago
                Then Verifico que se muestre la pagina de Pago

        Scenario Outline: TC1134 Validar Documento Tributario correcto
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" <CDP>
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
                And Selecciono el Documento Tributario <Documento>
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Verifico Documento Tributario sea correcto

                Examples:
                        | CDP                    | Documento |
                        | "CHKOUT_F1033_TC1134a" | "Boleta"  |
                        | "CHKOUT_F1033_TC1134b" | "Factura" |
 
        Scenario: TC1135 Validar email del destino del documento
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1033_TC1135"
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
                And Verifico el Email de destino del documento sea correcto
 
        Scenario Outline: TC1136ab Validar medio de pago seleccionado
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
                And Verifico que el Tipo de Medio de Pago sea correcto
                Examples:
                        | CDP                    | Medio             |
                        | "CHKOUT_F1033_TC1136a" | "tarjeta_credito" |
                        | "CHKOUT_F1033_TC1136b" | "tarjeta_ripley"  |
        
        Scenario Outline: TC1136c Validar medio de pago seleccionado
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
                And Realizo click en Continuar
                Then Valido pagina de confirmacion exitosa
                And Verifico que el Tipo de Medio de Pago sea correcto
                Examples:
                        | CDP                    | Medio             |
                        | "CHKOUT_F1033_TC1136c" | "tarjeta_debito"  |