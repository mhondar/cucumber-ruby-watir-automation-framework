@monitor
Feature: E2E CHECKOUT PREPROD F01

  # Scenario: E2E_CHECKOUT_PREP_F01
  #       Given Abro la pagina de ripley en ambiente "preprod" de "cl" "E2E_CHECKOUT_PREP_F01"
  #       And Verifico se muestre Home principal
  #       When Realizo login con las credenciales "tarjeta_ripley_3"
  #       Then Verifico login exitoso
  #       And Realizo click en la Bolsa de Productos
  #       And Elimino todos los productos de la bolsa del home
  #       And Realizo click en cerrar la Bolsa
  #       When Busco producto "PRUEBA"
  #       Then Verifico que este disponible para comprar
  #       And Selecciono opcion del producto random
  #       And Agrego el producto a la bolsa
  #       And Realizo click en continuar en PopUp de Garantia Extendida
  #       And Indico ir a la Bolsa
  #       Then Valido que se cargue la Bolsa de productos
  #       And Realizo click en Continuar con mi compra
  #       Then Verifico que se muestre pagina de despacho
  #       And Selecciono tipo de despacho "A domicilio"
  #       And Realizo click en continuar al Pago
  #      # And Indico quien retira en tienda "Yo" 
  #       And Verifico que se muestre la pagina de Pago
  #       # And Selecciono el medio de pago "tarjeta_ripley"
  #       And Ingreso los datos del medio de Pago "tarjeta_ripley"
  #       And Selecciono Pago Diferido "Random"
  #       And Realizo click en Continuar
  #       Then Valido pagina de confirmacion exitosa
  #       And Acepto las condiciones de compra
  #       And Realizo click en continuar para confirmar
  #       Then Verifico se muestre pantalla de resumen
        # And Verifico Estado de la Compra en SGO

      Scenario: E2E_CHECKOUT_PREP_F01
            Given Abro la pagina de ripley en ambiente "preprod" de "cl" "E2E_CHECKOUT_PREP_F01"
            And Verifico se muestre Home principal
            When Realizo login con las credenciales "tarjeta_ripley"
            Then Verifico login exitoso
            And Realizo click en la Bolsa de Productos
            And Elimino todos los productos de la bolsa del home
            And Realizo click en cerrar la Bolsa
            When Busco producto "SKU Ripley RT"
            Then Verifico que este disponible para comprar
            And Selecciono opcion del producto random
            And Agrego el producto a la bolsa
            And Realizo click en continuar en PopUp de Garantia Extendida
            And Indico ir a la Bolsa
            Then Valido que se cargue la Bolsa de productos
            And Realizo click en Continuar con mi compra
            Then Verifico que se muestre pagina de despacho
            And Selecciono tipo de despacho "Retiro en tienda"
            And Selecciono tienda con retiro "Disponible"
            And Realizo click en continuar al Pago
            And Indico quien retira en tienda "Yo" 
            And Verifico que se muestre la pagina de Pago
            And Selecciono el medio de pago "tarjeta_ripley"
            And Ingreso los datos del medio de Pago "tarjeta_ripley"
            And Selecciono Pago Diferido "Random"
            And Realizo click en Continuar
            Then Valido pagina de confirmacion exitosa
            And Acepto las condiciones de compra
            And Realizo click en continuar para confirmar
            Then Verifico se muestre pantalla de resumen
            # And Verifico Estado de la Compra en SGO
