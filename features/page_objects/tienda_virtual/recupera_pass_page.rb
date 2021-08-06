class RecoverPassPage
    def initialize 
        selectors = JSON.parse(File.read("./features/selectors/recupera_pass_selectors.json"))        
        #olvidaste contraseña page
        @input_rut_recover = $driver.text_field(xpath: selectors["forgot_password"]["input_rut"])
        @btn_buscar_cuenta = $driver.button(xpath: selectors["forgot_password"]["btn_buscar_cuenta"])
        @revisa_correo = $driver.element(xpath: selectors["forgot_password"]["revisa_correo"])
        @lbl_ingresa_contraseña = $driver.element(xpath: selectors["forgot_password"]["lbl_ingresa_contraseña"])
        @btn_ingresar = $driver.button(xpath: selectors["forgot_password"]["btn_ingresar"])
        @lbl_crear_new_pass = $driver.element(xpath: selectors["forgot_password"]["lbl_crear_new_pass"])
        @input_nueva_pass  = $driver.text_field(xpath: selectors["forgot_password"]["input_nueva_pass"])
        @input_rep_nueva_pass  = $driver.text_field(xpath: selectors["forgot_password"]["input_rep_nueva_pass"])
        @btn_guardar_pass  = $driver.button(xpath: selectors["forgot_password"]["btn_guardar_pass"])
        @lbl_cambio_passw_exito = $driver.element(xpath: selectors["forgot_password"]["lbl_cambio_passw_exito"])
        @btn_ir_mi_cuenta = $driver.button(xpath: selectors["forgot_password"]["btn_ir_mi_cuenta"])
    end

    def ingreso_rut_forgot_password(rut)
        $log.set_rut(rut)
        $tools.insertar_texto(@input_rut_recover, rut)
    end

    def click_buscar_cuenta
        $tools.click(@btn_buscar_cuenta)
    end
    
    def validar_mensaje_correo(correo)
        $tools.esperar_elemento(@revisa_correo)
        # mensaje = $driver.element(xpath: '//span[contains(text(), "' + correo + '")]')
        # $tools.esperar_elemento(mensaje)
    end

    def validar_pantalla_ingreso_password_temporal
        $tools.esperar_elemento(@lbl_ingresa_contraseña)
    end

    def ingresar_rut_pantalla_recuperacion(rut)
        $tools.insertar_texto(@input_rut_recover, rut)
    end

    def click_ingresar
        $tools.click(@btn_ingresar)
    end

    def validar_pagina_crear_contraseña
        $tools.esperar_elemento(@lbl_crear_new_pass)
    end

    def ingresar_nueva_contrasenna(pass)
        $tools.click @input_nueva_pass
        $tools.insertar_texto(@input_nueva_pass, pass)
    end

    def ingresar_repetir_contrasenna(pass)
        $tools.click @input_rep_nueva_pass
        $tools.insertar_texto(@input_rep_nueva_pass, pass)
    end

    def click_guardar_password
        $tools.click(@btn_guardar_pass)
    end

    def validar_cambio_password_exitoso
        $tools.esperar_elemento(@lbl_cambio_passw_exito)
    end

    def click_ir_a_mi_cuenta
        $tools.click(@btn_ir_mi_cuenta)
    end

end