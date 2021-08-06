class LoginInvitadoPage
    def initialize
        selectors = JSON.parse(File.read("./features/selectors/login_invitado_selectors.json"))
        # login
        @login_username = $driver.text_field(xpath: selectors["login"]["username"])
        @login_password = $driver.text_field(xpath: selectors["login"]["password"])
        @olvido_password = $driver.link(xpath: selectors["login"]["olvido_password"])
        @iniciar_sesion = $driver.button(xpath: selectors["login"]["iniciar_sesion"])
        @crea_tu_cuenta = $driver.button(xpath: selectors["login"]["crea_tu_cuenta"])
        @btn_registrate_aqui = $driver.element(xpath: '//div[@class="login-checkout__links"]//a')
        # invitado
        @nombre = $driver.text_field(xpath: selectors["invitado"]["nombre"])
        @apellido = $driver.text_field(xpath: selectors["invitado"]["apellido"])
        @rut = $driver.text_field(xpath: selectors["invitado"]["rut"])
        @email = $driver.text_field(xpath: selectors["invitado"]["email"])
        @btn_ingresar = $driver.button(xpath: selectors["invitado"]["btn_ingresar"])
        
    end

    def validar_pantalla_bienvenida
        begin
            $tools.esperar_elemento @login_username
        rescue 
            $tools.fallo("No se muestra pantalla de Bienvenida")
        end
    end

    def click_forgot_password
        $tools.click @olvido_password
    end

    def click_crea_tu_cuenta
        $tools.click @crea_tu_cuenta
    end

    def click_registrate_aqui
        $tools.click @btn_registrate_aqui
        $driver.window(index: 1).use
    end

    def ingresar_rut_bienvenido(rut)
        $tools.insertar_texto(@login_username, rut)
        $log.set_rut(rut)
        $mediopago = MedioPago.new("", rut, "")
        sleep 1
    end

    def ingresar_pass_bienvenido(pass)
        $tools.insertar_texto(@login_password, pass)
        sleep 1
    end

    def click_iniciar_sesion
        $tools.salvar_pantalla("Login_checkout", "features/screenshots/login/")
        $tools.click(@iniciar_sesion)
    end


    def ingresar_credenciales_login(medio)
        $log.set_medio(medio)
        credenciales = JSON.parse(File.read("./features/data/medios_pago.json"))
        $tools.insertar_texto(@login_username, credenciales[$ambiente][medio]["rut"])
        sleep 1
        $tools.insertar_texto(@login_password, credenciales[$ambiente][medio]["clave"])
        sleep 1
        $tools.salvar_pantalla("Login_checkout", "features/screenshots/login/")
        $tools.click(@iniciar_sesion)
        $log.set_rut(credenciales[$ambiente][medio]["rut"])
        $log.set_medio(medio)
        $mediopago = MedioPago.new(medio, credenciales[$ambiente][medio]["rut"], credenciales[$ambiente][medio]["numero"])
        $reserva = Reserva.new(medio) 
    end

    def ingresar_credenciales(rut, pass)
        $tools.insertar_texto(@login_username, rut)
        sleep 1
        $tools.insertar_texto(@login_password, pass)
        sleep 1
        $tools.salvar_pantalla("Login_checkout", "features/screenshots/login/")
        $tools.click(@iniciar_sesion)
        $log.set_rut(rut)
        $mediopago = MedioPago.new("", rut, "")
    end

    def ingresar_invitado_medio(medio)
        $log.set_medio(medio)
        credenciales = JSON.parse(File.read("./features/data/medios_pago.json"))
        persona = Persona.new
        datos_persona = persona.generar_persona
        $tools.insertar_texto(@nombre, datos_persona["nombre"])
        $tools.insertar_texto(@apellido, datos_persona["apellido"])
        case medio
        when "gifcard_empresas"
            $tools.insertar_texto(@rut, datos_persona["rut"])
            $log.set_rut(datos_persona["rut"])
        else
            puts $ambiente
            puts credenciales[$ambiente][medio]["rut"]
            $tools.insertar_texto(@rut, credenciales[$ambiente][medio]["rut"])
            $log.set_rut(credenciales[$ambiente][medio]["rut"])
        end
        $mediopago = MedioPago.new(medio, credenciales[$ambiente][medio]["rut"], credenciales[$ambiente][medio]["numero"])
        puts "CREADO MEDIO"
        $reserva = Reserva.new(medio) 
        puts "CREADA RESERVA"
        $tools.insertar_texto(@email, datos_persona["email"])
        $tools.salvar_pantalla("Invitado_checkout", "features/screenshots/login/")
        $tools.click(@btn_ingresar)
        
    end

    def click_ingresar
        $tools.click(@btn_ingresar)
    end

    def ingresar_invitado(rut_num)
        persona = Persona.new
        datos_persona = persona.generar_persona
        $tools.insertar_texto(@nombre, datos_persona["nombre"])
        $tools.insertar_texto(@apellido, datos_persona["apellido"])
        $tools.insertar_texto(@rut, rut_num)
        $log.set_rut(rut_num)
        $tools.insertar_texto(@email, datos_persona["email"])
        $tools.salvar_pantalla("Invitado_checkout", "features/screenshots/login/")
        $mediopago = MedioPago.new("", rut, "")
        $tools.click(@btn_ingresar)
    end

    def ingresar_invitado_cualquiera
        persona = Persona.new
        datos_persona = persona.generar_persona
        $tools.insertar_texto(@nombre, datos_persona["nombre"])
        $tools.insertar_texto(@apellido, datos_persona["apellido"])
        $tools.insertar_texto(@rut, datos_persona["rut"])
        $log.set_rut(datos_persona["rut"])
        $mediopago = MedioPago.new("", datos_persona["rut"], "")
    end
end