@checkout  
Feature: F1032 Confirmacion Despacho 

        Scenario: TC1127 Validar al seleccionar Modificar Despacho redireccione a la pagina de despacho
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1032_TC1127"
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
                And Realizo click en Modificar Despacho
                Then Verifico que se muestre pagina de despacho

        # Scenario: TC1128 Validar Direccion de Despacho correcto
        #         Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1032_TC1128"
        #         And Verifico se muestre Home principal
        #         When Realizo login con las credenciales "tarjeta_credito"
        #         And Verifico login exitoso
        #         And Realizo click en la Bolsa de Productos
        #         And Elimino todos los productos de la bolsa del home
        #         And Realizo click en cerrar la Bolsa
        #         And Busco producto "Despacho a Domicilio"
        #         Then Verifico que este disponible para comprar
        #         And Selecciono opcion del producto random
        #         And Agrego el producto a la bolsa
        #         And Realizo click en continuar en PopUp de Garantia Extendida
        #         And Indico ir a la Bolsa
        #         Then Valido que se cargue la Bolsa de productos
        #         And Realizo click en Continuar con mi compra
        #         Then Verifico que se muestre pagina de despacho
        #         And Selecciono tipo de despacho "A domicilio"
        #         And Realizo click en continuar al Pago
                # And Verifico que se muestre la pagina de Pago
                # And Selecciono el medio de pago "tarjeta_credito"
                # And Ingreso los datos del medio de Pago "tarjeta_credito"
                # Then Verifico que se muestre informacion de la "tarjeta_credito" xxxx
                # And Realizo click en Continuar
                # Then Valido pagina de confirmacion exitosa
                # And Verifico direccion de despacho en Confirmacion sea correcta
 
        Scenario: TC1130 Validar Fecha estimada conforme a la fecha seleccionada
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1032_TC1130"
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
                And Verifico fecha de despacho en Confirmacion sea correcta

        Scenario: TC1131 Validar Hora de Despacho conforme a la seleccionada
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1032_TC1131"
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
                And Verifico horario de despacho en Confirmacion sea correcta

        Scenario: TC1132 Validar Nombre del Producto Despachado
                Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CHKOUT_F1032_TC1132"
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
                And Verifico nombre del producto de despacho en Confirmacion sea correcta