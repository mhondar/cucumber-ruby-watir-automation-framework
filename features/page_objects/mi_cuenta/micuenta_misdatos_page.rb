
class MisDatosPage
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/mi_cuenta/micuenta_misdatos_selectors.json"))
        @data_usuario = JSON.parse(File.read("./features/data/usuarios_mi_cuenta.json"))
        # body
        @title_bienvenido = $driver.element(xpath: @selectors["body"]["title_bienvenido"])
        @title_datospersonales = $driver.element(xpath: @selectors["body"]["title_datos_personales"])
        @title_password = $driver.element(xpath: @selectors["body"]["title_contrasenia"])
        @title_direcciones = $driver.element(xpath: @selectors["body"]["title_direcciones"])
        @cantidad_direcciones = $driver.element(xpath: @selectors["body"]["cantidad_direcciones"]) 
       # @loading_screen = $driver.element(xpath: @selectors["body"]["loading"])
        @mensajePerfilActualizado = $driver.element(xpath: @selectors["body"]["mensajePerfilActualizado"])
        @msj_exito = $driver.element(xpath: @selectors["body"]["msj_exito"])
        #datos
        @btn_editar_datos = $driver.element(xpath: @selectors["datos"]["btn_editar_datos"])
        @form_modificar_datos = $driver.element(xpath: @selectors["datos"]["form_modificar_datos"])
        @text_Nombre = $driver.element(xpath: @selectors["datos"]["text_Nombre"])
        @text_apellidos = $driver.element(xpath: @selectors["datos"]["text_apellidos"])
        @text_rut = $driver.element(xpath: @selectors["datos"]["text_rut"])
        @text_email = $driver.element(xpath: @selectors["datos"]["text_email"])
        @text_celular = $driver.element(xpath: @selectors["datos"]["text_celular"])
        @cmb_dia = $driver.element(xpath: @selectors["datos"]["cmb_dia"])
        @cmb_mes = $driver.element(xpath: @selectors["datos"]["cmb_mes"])
        @cmb_anio = $driver.element(xpath: @selectors["datos"]["cmb_anio"])
        @cmb_celular = $driver.element(xpath: @selectors["datos"]["cmb_celular"])
        @cmb_sexo = $driver.element(xpath: @selectors["datos"]["cmb_sexo"])
        @btn_guardar = $driver.element(xpath: @selectors["datos"]["btn_guardar"])
        @btn_cancelar = $driver.element(xpath: @selectors["datos"]["btn_cancelar"])
        @title_nombreCompleto = $driver.element(xpath: @selectors["datos"]["title_nombreCompleto"])
        @title_rut = $driver.element(xpath: @selectors["datos"]["title_rut"])
        @title_fechaNacimiento = $driver.element(xpath: @selectors["datos"]["title_fechaNacimiento"])
        @title_sexo = $driver.element(xpath: @selectors["datos"]["title_sexo"])
        @title_email = $driver.element(xpath: @selectors["datos"]["title_email"])
        @title_celular = $driver.element(xpath: @selectors["datos"]["title_celular"])
        #contraseña
        @btn_cambiar_contrasenna = $driver.element(xpath: @selectors["mi_contrasenna"]["btn_cambiar_contrasenna"])
        @form_cambiar_contrasenna = $driver.element(xpath: @selectors["mi_contrasenna"]["form_cambiar_contrasenna"])
        @input_old_password = $driver.element(xpath: @selectors["mi_contrasenna"]["input_old_password"])
        @input_new_password = $driver.element(xpath: @selectors["mi_contrasenna"]["input_new_password"])
        @input_conf_password = $driver.element(xpath: @selectors["mi_contrasenna"]["input_conf_password"])
        @btn_guardar = $driver.element(xpath: @selectors["mi_contrasenna"]["btn_guardar"])
        @msg_contraseña_actualizada = $driver.element(xpath: @selectors["mi_contrasenna"]["msg_contraseña_actualizada"])
        @msg_password_anterior_incorrecto = $driver.element(xpath: @selectors["mi_contrasenna"]["msg_password_anterior_incorrecto"])
        @msg_debe_coincidir = $driver.element(xpath: @selectors["mi_contrasenna"]["msg_debe_coincidir"])
        #direcciones
        @DireccionPrincipal = $driver.element(xpath: @selectors["mis_direcciones"]["DireccionPrincipal"])
        @nombreDireccion = $driver.element(xpath: @selectors["mis_direcciones"]["nombreDireccion"])
        @nombre = $driver.element(xpath: @selectors["mis_direcciones"]["nombre"])
        @apellido = $driver.element(xpath: @selectors["mis_direcciones"]["apellido"])
        @calle_Input = $driver.element(xpath: @selectors["mis_direcciones"]["calle"])
        @numero_Input = $driver.element(xpath: @selectors["mis_direcciones"]["numero"])
        @piso = $driver.element(xpath: @selectors["mis_direcciones"]["piso"])
        @celular = $driver.element(xpath: @selectors["mis_direcciones"]["celular"])
        @title_piso = $driver.element(xpath: @selectors["mis_direcciones"]["title_piso"])
        @agregar_direccion = $driver.element(xpath: @selectors["mis_direcciones"]["agregar_direccion"])
        @btn_Eliminar_Direccion = $driver.element(xpath: @selectors["mis_direcciones"]["btn_Eliminar_Direccion"])
        @list_direcciones_agregadas = $driver.elements(xpath: @selectors["mis_direcciones"]["list_direcciones_agregadas"])
        
        # direcciones de facturacion
        @agregar_direccion_facturacion = $driver.element(xpath: @selectors["mis_direcciones"]["agregar_direccion_facturacion"])
        @list_direcciones_facturacion_agregadas = $driver.elements(xpath: @selectors["mis_direcciones"]["list_direcciones_facturacion_agregadas"])
        @formulario_facturacion = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["title"])
        @fact_giro = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["giro"])
        @fact_rut = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["rut"])
        @fact_razon = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["razon"])
        @fact_calle = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["calle"])
        @fact_numero = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["numero"])
        @fact_piso = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["piso"])
        @fact_region = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["region"])
        @fact_comuna = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["comuna"])
        @fact_codigo = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["codigo"])
        @fact_telefono = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["telefono"])
        @fact_btn_guardar = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["btn_guardar"])
        @fact_btn_delete_direccion_fact = $driver.element(xpath: @selectors["mis_direcciones"]["btn_delete_direccion_fact"])
        @btn_confirm_del_direccion_fact = $driver.element(xpath: @selectors["mis_direcciones"]["btn_confirm_del_direccion_fact"])
        @select_region = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["select_region"])
        @select_comuna = $driver.element(xpath: @selectors["mis_direcciones"]["formulario_facturacion"]["select_comuna"])

    end

    def click_agregar_direccion
        $tools.click(@agregar_direccion)
        sleep 2 
    end

    def verificar_pagina
        begin
            $tools.esperar_elemento(@title_bienvenido)
            sleep 2 
        rescue
            $tools.fallo("Problemas al cargar pagina de Mi Cuenta")
        end
    end

    def click_editar_datos
        $tools.click(@btn_editar_datos)  
        sleep 2      
    end

    def validar_formulario_modificar_datos_presente
        begin
            $tools.esperar_elemento(@btn_guardar)
        rescue
            $tools.fallo("No se habilita formulario para Mofificar los Datos")
        end
    end

    def editar_datos_perfil
        capturar_datos_perfil_originales
        crear_datos_perfil_temporales 
        limpiar_input_datos_personales
        insertar_nuevos_datos_perfil(@nombreTest, @apellidoTest, @celularTest)      
    end

    def esperar_mensaje_perfil_actualizado
        esperar_perfil_actualizado
    end

    def capturar_datos_perfil_originales
        # @arregloNombreOriginal = @title_nombreCompleto.text.split(" ")
        # @nombreOriginal = @arregloNombreOriginal[0] 
        # @apellidoOriginal = @arregloNombreOriginal[1] 
        # @celularOriginal = @title_celular.text

        @nombreOriginal = @text_Nombre.attribute("value")
        @apellidoOriginal = @text_apellidos.attribute("value")
        @celularOriginal = @text_celular.attribute("value")
    end

    def crear_datos_perfil_temporales
        @nombreTest = "NombreTest"
        @apellidoTest = "ApellidoTest"
        @celularTest = "987654321"
    end

    def limpiar_input_datos_personales
        $tools.borrar_input(@text_Nombre)
        $tools.borrar_input(@text_apellidos)
        $tools.borrar_input(@text_celular)
    end

    def insertar_nuevos_datos_perfil(nombre, apellido, celular)
        $tools.insertar_texto(@text_Nombre, nombre)
        $tools.insertar_texto(@text_apellidos, apellido)
        $tools.insertar_texto(@text_celular, celular)
    end


    def click_guardar_modificar_cambios
        $tools.click(@btn_guardar)
        if validar_formulario_modificar_datos_presente == true
            actualizar_json_usuario_mi_cuenta_nueva_password
        end
        esperar_perfil_actualizado
    end

    def click_cancelar_modificar_datos
        $tools.click(@btn_cancelar)
        while @btn_cancelar.present?
            $tools.click(@btn_cancelar)
        end
        sleep 2 
    end



    def esperar_perfil_actualizado
        # $tools.esperar_elemento(@mensajePerfilActualizado)
        # if $mensajePerfilActualizado.present?
        #     puts "Perfil actualizado correctamente"
        # else
        #     puts "No se encuentra mensaje de exito"
        # end

        
        # timeout = 0
        # while(!@mensajePerfilActualizado.present? && (timeout < 60))
        #     sleep 2
        #     timeout += 1
        # end
    end

    def verificar_modificacion_datos_perfil
        selectors = JSON.parse(File.read("./features/selectors/mi_cuenta/micuenta_misdatos_selectors.json"))
        # title_nombreCompleto = $driver.element(xpath: selectors["datos"]["title_nombreCompleto"])
        text_nombre = $driver.element(xpath: selectors["datos"]["text_Nombre"]).attribute("value")

        text_apellidos = $driver.element(xpath: selectors["datos"]["text_apellidos"]).attribute("value")
        num_celular = $driver.element(xpath: selectors["datos"]["num_celular"]).attribute("value")

        # arregloNombreNuevo = @title_nombreCompleto.text.split(" ")
        # nombreNuevo = arregloNombreNuevo[0] 
        # apellidoNuevo = arregloNombreNuevo[1]        
        # celularNuevo = @title_celular.text

        if text_nombre == @nombreTest
            puts "Nombre actualizado Correctamente"
        else 
            $tools.fallo("Nombre no se actualiza")
        end

        if text_apellidos == @apellidoTest
            puts "Apellido actualizado Correctamente"
        else 
            $tools.fallo("Apellido no se actualiza")
        end

        if num_celular == @celularTest
            puts "Celular actualizado Correctamente"
        else 
            $tools.fallo("Celular no se actualiza")
        end
    end

    def reestablecer_datos_originales
        click_editar_datos
        sleep 2 
        validar_formulario_modificar_datos_presente
        limpiar_input_datos_personales
        
        insertar_nuevos_datos_perfil(@nombreOriginal, @apellidoOriginal, @celularOriginal) 
        click_guardar_modificar_cambios
        sleep 2 
        esperar_perfil_actualizado
    end

    def verificar_datos_perfil_originales
        sleep 3
        arregloNombreNuevo = @title_nombreCompleto.text.split(" ")
        nombreNuevo = arregloNombreNuevo[0] 
        apellidoNuevo = arregloNombreNuevo[1]
        celularNuevo = @title_celular.text

        if nombreNuevo == @nombreOriginal
            puts "Nombre original correcto"
        else 
            $tools.fallo("Nombre mostrado #{nombreNuevo} no se actualiza a #{@nombreOriginal}")
        end

        if apellidoNuevo == @apellidoOriginal
            puts "Apellido original correcto"
        else 
            $tools.fallo("Apellido mostrado #{apellidoNuevo} no se actualiza a #{@apellidoOriginal}")
        end

        if celularNuevo == @celularOriginal
            puts "Celular original correcto"
        else 
            $tools.fallo("Celular mostrado #{celularNuevo} no se actualiza a #{@celularOriginal}")
        end
    end

    def click_cambiar_contrasenna
        $tools.click(@btn_cambiar_contrasenna)
        sleep 2 
    end

    def verificar_formulario_cambio_contrasenna
        begin
            $tools.esperar_elemento(@form_cambiar_contrasenna)
        rescue
            $tools.fallo("No se muestra formulario de cambio de contrasenna")
        end
    end

    def ingresar_password_actual
        @clave_actual = @data_usuario[$categoria]["clave_actual"]
        $tools.insertar_texto(@input_old_password, @clave_actual)
    end

    def ingresar_password_nueva
        @clave_nueva = @data_usuario[$categoria]["clave_alternativa"]
        $tools.insertar_texto(@input_new_password, @clave_nueva)
    end

    def ingresar_confirmar_password_nueva
        $tools.insertar_texto(@input_conf_password, @clave_nueva)
    end

    def click_guardar_password
        $tools.esperar_elemento(@btn_guardar)
        $tools.click(@btn_guardar)
    end

    def doble_click_guardar
        $tools.esperar_elemento(@btn_guardar)
        $tools.click(@btn_guardar)

        sleep 2
        if @msj_exito.present?
            puts "Datos actualizados correctamente"
        else          
            $tools.click(@btn_guardar)
            $tools.esperar_elemento(@msj_exito)
        end
    end


    def verificar_cambio_password_exitoso
        begin
            $tools.esperar_elemento(@msg_contraseña_actualizada)
            actualizar_json_usuario_mi_cuenta_nueva_password
            return true
        rescue
            return false
        end
        
    end

    def actualizar_json_usuario_mi_cuenta_nueva_password
        usuarios_mi_cuenta_json = JSON.parse(File.read("./features/data/usuarios_mi_cuenta.json")) 

        usuarios_mi_cuenta_json[$categoria]["clave_actual"] = @clave_nueva

        usuarios_mi_cuenta_json.to_json
        File.open("./features/data/usuarios_mi_cuenta.json","w") do |f|
            f.write(JSON.pretty_generate(usuarios_mi_cuenta_json))
        end
    end

    def reestablecer_contrasenna_original
        sleep 3
        click_cambiar_contrasenna
        sleep 2 
        $tools.insertar_texto(@input_old_password, @data_usuario[$categoria]["clave_actual"])
        $tools.insertar_texto(@input_new_password, @data_usuario[$categoria]["clave"])
        $tools.insertar_texto(@input_conf_password, @data_usuario[$categoria]["clave"])
        sleep 1
        click_guardar_password
        sleep 2
        $tools.esperar_elemento(@msg_contraseña_actualizada)
        actualizar_json_usuario_mi_cuenta_clave_original
    end

    def actualizar_json_usuario_mi_cuenta_clave_original
        usuarios_mi_cuenta_json = JSON.parse(File.read("./features/data/usuarios_mi_cuenta.json")) 

        usuarios_mi_cuenta_json[$categoria]["clave_actual"] = usuarios_mi_cuenta_json[$categoria]["clave"]

        usuarios_mi_cuenta_json.to_json
        File.open("./features/data/usuarios_mi_cuenta.json","w") do |f|
            f.write(JSON.pretty_generate(usuarios_mi_cuenta_json))
        end
    end

    def ingreso_password_anterior_invalido
        $tools.insertar_texto(@input_old_password, "wrong password")
    end

    def validar_mensaje_error_cambio_password
        begin
           $tools.esperar_elemento_timeout(@msg_password_anterior_incorrecto, 5) 
        rescue 
            reestablecer_contrasenna_original
            $tools.fallo("Se cambió la contraseña a pesar de que era errónea la password anterior ingresada, se reestablecio a la password anterior")
        end
    end

    def ingreso_password_confirmacion_invalida
        $tools.insertar_texto(@input_conf_password, "wrong password")
    end

    def tab_fuera_formulario_password
        $driver.send_keys :tab
    end

    def valido_msg_deben_coincidir_contrasennas
        begin
            $tools.esperar_elemento(@msg_debe_coincidir)
        rescue
            $tools.fallo("No se muestra mensaje Debe Coincidir al ingresar Confirmación de password errónea")
        end
    end

    def click_agregar_direccion
        $tools.click(@agregar_direccion)
        sleep 2 
    end

    def click_editar_direccion
        esperar_end_loading
        # sleep 5
        puts "elegir editar direccion"
        @boton_edit_direccion = $driver.element(xpath: '//button[@data-cy= "modifyButton"]')
        if @boton_edit_direccion.present?
            $tools.click(@boton_edit_direccion) 
        else
            $tools.fallo("No se encuentra botón de editar dirección para dirección: "+ nombreDireccion)  
        end
    end

    def valido_campos_editar_direccion
        esperar_end_loading

        begin
            $tools.esperar_elemento(@btn_guardar)
        rescue
            $tools.fallo("Problema al cargar campos para editar direccion")
        end

    end

    def validar_direccion_principal
        esperar_end_loading
        if @DireccionPrincipal.text == "Principal"
            puts "Se muestra direccion principal correctamente"
        else
            $tools.fallo("No se muestra dirección principal")  
        end
    end

    def validar_Direccion
        @titleDireccion = $driver.element(xpath: '//h4[contains(text(), "Dirección principal")]/parent::div/following-sibling::h4[1]')
        direccionSeparada = @titleDireccion.text.split(" ")
        @calle_act = direccionSeparada[0] 
        @numero_act = direccionSeparada[1]  
        if @calle_act != "CalleTest" + ","
            $tools.fallo("Problema al actualizar direccion")
        end
        
        if @numero_act != "1"+","
            $tools.fallo("Problema al actualizar numero")
        end
    end

    def obtenerDireccionActual
        direccionTest="CalleActualizada"
        @title_direccion = $driver.element(xpath: '//h4[contains(text(),"'+ direccionTest + '")]')
        direccionSeparada= @title_direccion.text.split(" ")
        @calle=direccionSeparada[0] 
        @numero=direccionSeparada[1]  
    end

    def actualizar_direccion
        direccionTest="Direccion Test"
        eliminarDirecciones
        calleUpdate="CalleActualizada"
        numeroUpdate="99"
        $tools.insertar_texto(@calle_Input, calleUpdate)
        $tools.insertar_texto(@numero_Input, numeroUpdate)
        $tools.insertar_texto(@piso, numeroUpdate)
    end

    def validar_datos_Direccion_actualizada
        calleUpdate="CalleActualizada"
        numeroUpdate="99"
        obtenerDireccionActual

        if @calle == calleUpdate + ","
            puts "Calle actualizada Correctamente"
        else 
            $tools.fallo("Problema al actualizar direccion")
        end
        
        if @numero == numeroUpdate + ","
            puts "Numero actualizado Correctamente"
        else 
            $tools.fallo("Problema al actualizar numero")
        end
    end

    def restablecer_direccion
        direccionTest="Direccion Test"
        sleep 6
       
        @editar_direccion = $driver.element(xpath: '//h4[contains(text(), "Dirección Inicial")]/parent::div/parent::div/following-sibling::div/div/div/button[@data-cy="modifyButton"]')
        $tools.click(@editar_direccion)
        sleep 3
        eliminarDirecciones

        calleUpdate="CalleTest"
        numeroUpdate="1"
        $tools.insertar_texto(@calle_Input, calleUpdate)
        $tools.insertar_texto(@numero_Input, numeroUpdate)
    end

    def eliminarDirecciones
        $tools.borrar_input(@calle_Input)
        $tools.borrar_input(@numero_Input)
    end

    def completar_direccion_nueva
        $tools.insertar_texto(@nombreDireccion, "test completado")
        $tools.insertar_texto(@nombre, "Nombre Prueba")
        $tools.insertar_texto(@apellido, "Apellido Prueba")
        $tools.insertar_texto(@calle_Input, "test calle")
        $tools.insertar_texto(@numero_Input, "123")
        $tools.insertar_texto(@piso, "21")
        
        #se ocupa tab para poder completar select the region y comuna.
        # tab_fuera_formulario_password   

        $tools.click(@fact_region)
        $tools.click(@select_region)
        sleep 1
        $tools.click(@fact_comuna)
        $tools.click(@select_comuna)       
        sleep 1    
        $tools.insertar_texto(@celular, "999999999")
   end

    def eliminarDireccionPrueba
        sleep 4
        eliminar = $driver.element(xpath: '//h4[contains(text(), "test calle")]/parent::div/following-sibling::div/div/div//button[@data-cy="deleteButton"]')
        $tools.click(eliminar)     
        # $driver.execute_script("return arguments[0].click();", eliminar) 
        $tools.click(@btn_Eliminar_Direccion)        
    end

    def esperar_end_loading
        # @loading_screen = $driver.element(xpath: @selectors["body"]["loading"])
        # timeout = 0
        # while(!@loading_screen.present? && (timeout < 60))
        #     sleep 2
        #     timeout += 1
        # end
    end

    def validar_direcciones_sin_agregar
        cantidad_direcciones_agregadas = @list_direcciones_agregadas.count
        if cantidad_direcciones_agregadas == 0
            puts "Correcto, hay #{cantidad_direcciones_agregadas} direcciones agregadas"
        else
            $tools.fallo("Debería tener 0 direcciones agregadas por ser cliente nuevo y contiene #{cantidad_direcciones_agregadas}")
        end
    end

    def validar_direcciones_facturacion_sin_agregar
        @list_direcciones_facturacion_agregadas = $driver.elements(xpath: @selectors["mis_direcciones"]["list_direcciones_facturacion_agregadas"])
        cantidad = @list_direcciones_facturacion_agregadas.count
        if cantidad == 0
            puts "Correcto, hay #{cantidad} direcciones de facturacion agregadas"
        else
            $tools.fallo("Debería tener 0 direcciones de facturacion agregadas por ser cliente nuevo y contiene #{cantidad}")
        end
    end

    def click_agregar_direccion_facturacion
        $tools.click(@agregar_direccion_facturacion)
    end

    def validar_formulario_direccion_facturacion
        begin
            $tools.esperar_elemento(@formulario_facturacion)
        rescue
            $tools.fallo("No se muestra el formulario para añadir direccion de facturacion")
        end
    end

    def completo_formulario_direccion_facturacion
        # $tools.click(@fact_giro)
        # $driver.send_keys :enter
        sleep 1
        # $tools.insertar_texto(@fact_rut, @data_usuario[$categoria]["facturacion"]["rut"])
        # $tools.insertar_texto(@fact_razon, @data_usuario[$categoria]["facturacion"]["razon"])

        $tools.insertar_texto(@nombre, @data_usuario[$categoria]["facturacion"]["nombre"])
        $tools.insertar_texto(@apellido, @data_usuario[$categoria]["facturacion"]["apellido"])
        $tools.insertar_texto(@nombreDireccion, @data_usuario[$categoria]["facturacion"]["nombreDireccion"])


        $tools.insertar_texto(@fact_calle, @data_usuario[$categoria]["facturacion"]["calle"])
        $tools.insertar_texto(@fact_numero, @data_usuario[$categoria]["facturacion"]["numero"])
        $tools.insertar_texto(@fact_piso, @data_usuario[$categoria]["facturacion"]["piso"])
        $tools.click(@fact_region)
        $driver.send_keys :enter
        sleep 2
        $tools.click(@fact_comuna)
        $driver.send_keys :enter
        sleep 1
        $tools.insertar_texto(@fact_telefono, @data_usuario[$categoria]["facturacion"]["telefono"])        
    end

    def click_guardar_direccion_facturacion
        $tools.click(@fact_btn_guardar)
        sleep 2
    end

    def validar_direccion_de_facturacion_agregada
        sleep 2
        @list_direcciones_facturacion_agregadas = $driver.elements(xpath: @selectors["mis_direcciones"]["list_direcciones_facturacion_agregadas"])
        cantidad = @list_direcciones_facturacion_agregadas.count
        if cantidad == 1
            puts "Correcto, hay #{cantidad} direcciones de facturacion agregadas"
        else
            $tools.fallo("Debería tener 1 direcciones de facturacion agregadas por ser cliente nuevo y contiene #{cantidad}")
        end
    end

    def delete_direccion_facturacion
        $tools.click(@fact_btn_delete_direccion_fact)
        sleep 2
        $tools.click(@btn_confirm_del_direccion_fact)
        sleep 2
    end

end

