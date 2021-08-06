require './features/tools/Tools.rb'

class RipleyHomePage

    def initialize 
        selectors = JSON.parse(File.read("./features/selectors/home_selectors.json"))

        case $mobile
        when true
            @mob_search_button = $driver.element(xpath: selectors["mobile"]["search_button"])
            @button_iniciar_session = $driver.element(xpath: selectors["mobile"]["btn_inicio_session"])
            @input_rut = $driver.text_field(xpath: selectors["mobile"]["in_username"])
            @input_pass = $driver.text_field(xpath: selectors["mobile"]["in_password"])
            @button_loadin = $driver.button(xpath: selectors["mobile"]["btn_loadin"])
            @button_outline = $driver.button(xpath: selectors["mobile"]["btn_outline"])
            @button_close =  $driver.element(xpath: selectors["mobile"]["btn_close"])
            @input_search_bar = $driver.text_field(xpath: selectors["mobile"]["in_search_bar"])
            @lbl_mi_cuenta = $driver.element(xpath: selectors["mobile"]["lbl_mi_cuenta"])
            @btn_crear_cuenta = $driver.button(xpath: selectors["mobile"]["btn_crear_cuenta"])
            @upArrowMobile = $driver.button(xpath: selectors["mobile"]["upArrowMobile"])
            @closeMessageMobile = $driver.button(xpath: selectors["mobile"]["closeMessageMobile"])
        else
            @button_iniciar_session = $driver.element(xpath: selectors["navigation_header"]["btn_inicio_session"])
            @input_rut = $driver.text_field(xpath: selectors["navigation_header"]["in_username"])
            @input_pass = $driver.text_field(xpath: selectors["navigation_header"]["in_password"])
            @button_loadin = $driver.button(xpath: selectors["navigation_header"]["btn_loadin"])
            @button_outline = $driver.button(xpath: selectors["navigation_header"]["btn_outline"])
            @input_search_bar = $driver.text_field(xpath: selectors["navigation_header"]["in_search_bar"])
            @lbl_mi_cuenta = $driver.element(xpath: selectors["navigation_header"]["lbl_mi_cuenta"])
            @btn_crear_cuenta = $driver.button(xpath: selectors["navigation_header"]["btn_crear_cuenta"])
        end
        #popup prd
        @btn_cerrar_popup = $driver.button(id: selectors["popup"]["btn_cerrar"])
        @popup_container = $driver.element(xpath: selectors["popup"]["contenedor"])
        @popup_datos_personales = $driver.element(xpath: selectors["popup"]["actualiza_datos_personales"])

        #inicia session 
        @lnk_forgotpass = $driver.element(xpath: selectors["navigation_header"]["lnk_forgotpass"])
        
        @btn_tu_cuenta = $driver.element(xpath: selectors["navigation_header"]["btn_tu_cuenta"])
        @btn_hazlo_aqui = $driver.element(xpath: '//div[@class="credentials__register"]/a')

        #registrar usuario page
       
        @btn_actualizar_datos = $driver.element(xpath: selectors["navigation_header"]["btn_actualizar_datos"])
        @input_nombre = $driver.text_field(xpath: selectors["registro_persona"]["input_nombre"])
        @input_apellido = $driver.text_field(xpath: selectors["registro_persona"]["input_apellido"])
        @input_new_rut = $driver.text_field(xpath: selectors["registro_persona"]["input_rut"])
        @input_email = $driver.text_field(xpath: selectors["registro_persona"]["input_email"])
        @input_re_email = $driver.text_field(xpath: selectors["registro_persona"]["input_re_email"])
        @input_password = $driver.text_field(xpath: selectors["registro_persona"]["input_password"])
        @input_conf_password = $driver.text_field(xpath: selectors["registro_persona"]["input_conf_password"])
        @btn_registrarme = $driver.button(xpath: selectors["registro_persona"]["btn_registrarme"])
        @msg_ya_registrado = $driver.element(xpath: selectors["registro_persona"]["msg_ya_registrado"])
        @lnk_registrar_otro_rut = $driver.element(xpath: selectors["registro_persona"]["lnk_registrar"])

        # menu hamburguesa
        @btn_menu_categorias = $driver.element(xpath: selectors["navigation_header"]["btn_menu_categorias"])
        @btn_ver_todo = $driver.element(xpath: selectors["navigation_header"]["btn_ver_todo"])
        
        # mensajes alternativos
        @no_result_sku = $driver.element(xpath: selectors["no_result_pages"]["no_result_sku"])
        @no_result_texto = $driver.element(xpath: selectors["no_result_pages"]["no_result_texto"])
        @user_registrado = $driver.element(xpath: selectors["registred_mensg"]["user_registrado"])
        @aceptar_cookies = $driver.element(xpath: selectors["aceptar_cookie"])

    end

    def abrir_home_page(url)
        begin
            $log.set_url(url)
            $tools.visitar_portal(url)
            $driver.cookies.add 'robot', 'true', path: '/', secure: true, domain: 'ripley.cl'
        rescue Selenium::WebDriver::Error::UnexpectedAlertOpenError
            sleep 2
        end

        if $mobile
            if @upArrowMobile.present? 
                $tools.click(@upArrowMobile)
            end

            if @closeMessageMobile.present? 
                $tools.click(@closeMessageMobile)
            end
        end

        if @aceptar_cookies.present?
            $tools.click(@aceptar_cookies)
        end
    end

    def verificar_open_home
        begin
            case $mobile
            when true
                $tools.esperar_elemento(@mob_search_button)
            else
                $tools.esperar_elemento(@button_iniciar_session)
            end
        rescue Selenium::WebDriver::Error::NoSuchElementError
            puts "Boo"
        rescue 
            $tools.fallo("Home no se muestra")
        end
    end



    def verificar_open_home_nueva_pestana
        $tools.realiza_cambio_foco_pestana
        sleep 2    
        begin
            case $mobile
            when true
                $tools.esperar_elemento(@mob_search_button)
            else
                $tools.esperar_elemento(@button_iniciar_session)
            end

        rescue Selenium::WebDriver::Error::NoSuchElementError
            puts "Boo"
        rescue 
            $tools.fallo("Home no se muestra")
        end
    end





    def request_new_chkout
        $tools.visitar_portal('https://Simple:acidO@preprod.ripley.cl/api/v1/features/newCheckout/1')
    end

    def request_new_chkout_staging
        $tools.visitar_portal('https://rfernandezm@ripley.com:Ripley2020@staging.ripley.cl/api/v1/features/newCheckout/1')
    end

    def request_new_chkout_stable
        $tools.visitar_portal('https://acid_admin:c5NEpEs7vN646Dcx4UmwdnrY@stable-version-fallback.rpl-review.ripley.cl/api/v1/features/newCheckout/1')
    end

    def request_new_reviewapp
        $tools.visitar_portal('https://acid_admin:c5NEpEs7vN646Dcx4UmwdnrY@rpl-1503-cross-sell-pdp.herokuapp.com/api/v1/features/newCheckout/1')
    end

    def cerrar_popup
        case $mobile
        when true
            #do nothing
        else
            if $navegador == "headless"
                puts "Modo Headless no muestra popup"
            else
                begin
                    sleep 2
                    $tools.esperar_elemento_timeout(@popup_container, 10)
                    # $tools.esperar_elemento @popup_container
                    sleep 2
                    $tools.click @btn_cerrar_popup
                    sleep 3
                    # while @popup_container.present?
                    #     puts "Popoup visible"
                    #     sleep 2
                    # end
                rescue
                    puts "No se muestra popup de notificaciones"
                end
            end
        end
    end

    def click_iniciar_session 
        $tools.click(@button_iniciar_session)
        sleep 2
    end

    def logout
        $tools.click(@lbl_mi_cuenta)
        sleep 2
        $tools.click(@button_outline)
        if $mobile
            $tools.click(@button_close)
        end
    end

    def verificar_logout
        begin
            $tools.esperar_elemento(@button_iniciar_session)
        rescue
            $tools.fallo "No se realizo el logout correctamente"
        end
    end

    def click_olvidaste_contrasenna
        $tools.click(@lnk_forgotpass)
    end

    def click_crea_tu_cuenta
        case $mobile
        when true
            $tools.click(@btn_crear_cuenta)
        else
            $tools.click(@btn_crear_cuenta)
        end
    end

    def click_tu_cuenta
        $tools.esperar_elemento(@btn_tu_cuenta)
        $tools.click(@btn_tu_cuenta)
    end

    def cerrar_popup_actualizar_datos
        sleep 2
        $tools.esperar_elemento(@popup_datos_personales)
        if @popup_datos_personales.present?
            $tools.click(@popup_datos_personales)
        else
            puts "No se encuentra iframe"
        end
    end

    def click_hazlo_aqui
        $tools.click(@btn_hazlo_aqui)
    end

    def verificar_pagina_registro
        begin
            $tools.esperar_elemento @input_nombre
        rescue
            $tools.fallo "No se muestra la pagina de registro de usuarios"
        end
    end

    def registrar_usuario_nuevo
        persona = Persona.new
        $datos = persona.generar_persona
        $tools.insertar_texto(@input_nombre, $datos["nombre"])
        $tools.insertar_texto(@input_apellido, $datos["apellido"])
        $tools.insertar_texto(@input_new_rut, $datos["rut"])
        $log.set_rut($datos["rut"])
        $tools.insertar_texto(@input_email, $datos["email"])
        # $tools.insertar_texto(@input_re_email, $datos["email"])
        $tools.insertar_texto(@input_password, $datos["password"])
        # $tools.insertar_texto(@input_conf_password, $datos["password"])
        $tools.click(@btn_registrarme)
        $mediopago = MedioPago.new("", $datos["rut"], "")
        $tools.ask_and_crear_directorio("features/logs")
        if File.file?("features/logs/registrados.csv") == false
            CSV.open("features/logs/registrados.csv", "wb") do |csv|
                csv << ["rut", "nombre", "apellido", "email", "password"]
            end
        end
        CSV.open("features/logs/registrados.csv", "a+") do |csv|
            csv << [$ambiente, $datos["rut"], $datos["nombre"], $datos["apellido"], $datos["email"], $datos["password"]]
        end
    end

    def verificar_menu_mi_cuenta
        begin          
            $tools.esperar_elemento(@lbl_mi_cuenta)
            rescue
                if @msg_ya_registrado.present?
                    $tools.click(@lnk_registrar_otro_rut)
                    count += 1
                    if count <= 3
                        retry
                    else
                        puts "Luego de 3 reintentos se generaban rut ya registrados"
                    end
                else
                    puts "Caso no Mapeado registrar usuario nuevo home"
                end
        end
    end

    def verificar_registro_exitoso
        $tools.esperar_elemento(@lbl_mi_cuenta)
        if $mobile
            sleep 5
        end
    end

    def registrar_usuario_nuevo_rut(rut)
        case $mobile
        when true
            $tools.click(@btn_crear_cuenta)
        else
            $tools.click(@btn_crear_cuenta)
        end
        registrar_usuario(rut)
        $tools.esperar_elemento(@lbl_mi_cuenta)
        $mediopago = MedioPago.new("", rut, "")
    end

    def registrar_usuario(rut)
        persona = Persona.new
        $datos = persona.generar_persona
        $tools.insertar_texto(@input_nombre, $datos["nombre"])
        $tools.insertar_texto(@input_apellido, $datos["apellido"])
        $tools.insertar_texto(@input_new_rut, rut)
        $log.set_rut(rut)
        $tools.insertar_texto(@input_email, $datos["email"])
        $tools.insertar_texto(@input_re_email, $datos["email"])
        $tools.insertar_texto(@input_password, $datos["password"])
        $tools.insertar_texto(@input_conf_password, $datos["password"])
        $tools.click(@btn_registrarme)
        $mediopago = MedioPago.new("", rut, "")
    end

    def registrar_usuario_registrado(rut)
        click_iniciar_session 
        case $mobile
        when true
            $tools.click(@btn_crear_cuenta)
        else
            $tools.click(@btn_crear_cuenta)
        end
        registrar_usuario(rut)
        $mediopago = MedioPago.new("", rut, "")
    end

    def ingreso_credenciales(rut, pass)
        $tools.insertar_texto(@input_rut, rut)
        $log.set_rut(rut)
        sleep 1
        $tools.insertar_texto(@input_pass, pass)
        sleep 1
        $tools.salvar_pantalla("Login", "features/screenshots/login/")
        $tools.click(@button_loadin)
        $log.set_rut(rut)
    end

    def ingreso_credenciales_json(medio)
        $log.set_medio(medio)
        $reserva = Reserva.new(medio) 
        credenciales = JSON.parse(File.read("./features/data/medios_pago.json"))
        $mediopago = MedioPago.new(medio, credenciales[$ambiente][medio]["rut"], credenciales[$ambiente][medio]["numero"])
        $log.set_rut(credenciales[$ambiente][medio]["rut"])
        $tools.insertar_texto(@input_rut, credenciales[$ambiente][medio]["rut"])
        sleep 1
        $tools.insertar_texto(@input_pass, credenciales[$ambiente][medio]["clave"])
        sleep 1
        $tools.salvar_pantalla("Login", "features/screenshots/login/")
        $tools.click(@button_loadin)
    end

    def verifico_login_exitoso_y_reintento
        begin
            $tools.esperar_elemento_timeout(@button_outline, 30)
        rescue
            c = 0
            while c < 10
                $tools.click(@button_loadin)
                begin
                    $tools.esperar_elemento_timeout(@button_outline, 30)
                    break
                rescue
                    puts "Reintento de Login #{c}"
                    sleep 2
                    c += 1
                end
            end
            if c >= 10
                $tools.fallo("Error en el login del usuario")
            end
        end
    end

    def verifico_login_exitoso_sin_reintento
        begin
            $tools.esperar_elemento(@button_outline)
            case $mobile
            when true
                $tools.click(@button_close)
            end
        rescue
            $tools.fallo("Error en el login del usuario")
        end
    end

    def validar_login
        begin
            $tools.esperar_elemento_timeout(@button_outline, 5)
            return true
        rescue
            c = 0
            while c < 1
                $tools.click(@button_loadin)
                begin
                    $tools.esperar_elemento_timeout(@button_outline, 5)
                    break
                rescue
                    puts "Reintento de Login #{c}"
                    sleep 2
                    c += 1
                end
            end
            if c >= 1
                return false
            end
        end
    end

    def busco_producto(criterio)
        sku_list = JSON.parse(File.read("./features/data/sku.json"))
        sleep 2
        criterios = sku_list[$pais][$ambiente].keys
        if criterios.include? criterio
            if sku_list[$pais][$ambiente][criterio].empty?
                $tools.fallo "No hay datos en el listado de SKUs de #{$pais} en #{$ambiente} en #{criterio}"
            else
                $sku = sku_list[$pais][$ambiente][criterio].shuffle.first
            end  
        else
            $sku = criterio
        end
        $log.set_sku_inicial $sku

        case $mobile
        when true
            $tools.click(@mob_search_button)
        end
        $tools.borrar_input(@input_search_bar)
        $tools.insertar_texto(@input_search_bar, $sku)
        $tools.salvar_pantalla("Busqueda", "features/screenshots/catalogo/")
        $tools.insertar_texto(@input_search_bar, :enter)
        sleep 5
        # case $mobile
        # when false
        #     $tools.insertar_texto(@input_search_bar, :enter)
        #     sleep 5
        # end
        case criterio
        when "SKU MKP"
            $mkp = true

        # when "Disponible"
            
        #     $disponible = true
        #     $tools.insertar_texto(@input_search_bar_bar, $sku)
        end
    end

    def verificar_resultado_busqueda_ingresada(criterio)
        case criterio
        when "Sku"
            product = FichaPage.new
            product.verificar_disponibilidad
        when "Texto"
            # $driver.refresh
            sleep 2
            search_result = SearchResultPage.new
            search_result.validar_msg_resultados($sku)
        end
    end

    def click_menu_categorias
        $tools.click(@btn_menu_categorias)
    end

    def click_categoria_principal(categoria)
        sleep 1
        cat_seleccionada = $driver.element(xpath: '//div[@class="tree-node-items"]/a[contains(text(), "' + categoria + '")]')
        $tools.click(cat_seleccionada)
    end

    def click_categoria_marketing(categoria)
        sleep 1
        cat_seleccionada = $driver.element(xpath: '//div[@class="marketing-zone is-idle category-tree__special-links"]//a[contains(text(), "' + categoria + '")]')
        $tools.click(cat_seleccionada)
    end

    def click_subcategoria_2do_nivel(subcategoria2)
        sleep 2
        if $mobile
            subcat_seleccionada = $driver.element(xpath: '//div[@class="tree-node tree-node-level-1 menu-transition-to-left-enter-done"]/section/div/a[contains(text(), "' + subcategoria2 + '")]')
            $tools.click(subcat_seleccionada)
            select_ver_todo = $driver.element(xpath: '//a[@class="category-item-"][contains(text(), "' + subcategoria2 + '")]')
            $tools.click(select_ver_todo)
        else
            subcat_seleccionada = $driver.element(xpath: '//div[@class="category-tree__expanded-categories"]/ul/li/a[contains(text(), "' + subcategoria2 + '")]')
            $tools.click(subcat_seleccionada)
        end
    end

    def click_subcategoria_3er_nivel(subcategoria2, subcategoria3)
        sleep 2
        if $mobile
            click_subcategoria_2do_nivel(subcategoria2)
            # click_subcategoria_3er_nivel_mobile(subcategoria3)
        else
            subcat_seleccionada = $driver.element(xpath: '//div[@class="category-tree__expanded-categories"]/ul/li/a[contains(text(), "' + subcategoria2 + '")]/following-sibling::ul/li/a[contains(text(), "' + subcategoria3 + '")]')
            $tools.click(subcat_seleccionada)
        end
    end

    def click_subcategoria_3er_nivel_mobile(subcategoria3)
        sleep 5
            subcateg_seleccionada = $driver.element(xpath: '//div[@class="tree-node-items"]/a[contains(text(), "' + subcategoria3 + '")]')
            # $tools.click(subcateg_seleccionada)
    end

    def click_actualizar_mis_datos
        $tools.click(@btn_actualizar_datos)
    end

    def click_menu(menu)
        menu_selected = $driver.element(xpath: '//a[contains(text(), "' + menu + '")]')
        $tools.click(menu_selected)
    end

    def verificar_pagina_menu(menu)
        case menu
        when "Ripley.com"
            url_menu = "https://simple.ripley.cl/?menu_corporativo"
        when "Banco Ripley"
            url_menu = "https://www.bancoripley.cl/?menu_corporativo"
        when "Ripley Puntos Go"
            url_menu = "https://simple.ripley.cl/minisitios/ripleypuntos?menu_corporativo"
        when "Seguros Ripley"
            url_menu = "https://www.segurosripley.cl/SeguroAutomotriz?menu_corporativo"
        when "Clubes Ripley"
            url_menu = "https://simple.ripley.cl/minisitios/clubes"
        when "Banca en Linea"
            url_menu = "https://miportal.bancoripley.cl/home/login.handler?utm_source=ripley-com&utm_medium=boton-br&utm_campaign=sav#tar-cred-sav"
        end
    
        sleep 3
        $driver.window(index: 1).use
        current_url = $driver.url
        
        puts url_menu
        puts current_url
        
        if current_url == url_menu
            puts "URL correctamente redireccionada"
        else
            $tools.fallo("No se direccionó correctamente a la URL prevista")
        end
        sleep 3
    end

    def verificar_no_resultados_sku
        $tools.esperar_elemento(@no_result_sku)
    end

    def verificar_no_resultados_texto
        $tools.esperar_elemento(@no_result_texto)
    end

    def verificar_mensaje_login_alternativo(mensaje)
        msg = $driver.element(xpath: '//p[@class="message" and contains(text(), "' + mensaje + '")]')
        $tools.esperar_elemento(msg)
    end

    def verifico_mensaje_registro(mensaje)
        msg = $driver.element(xpath: '//h2[contains(text(), "' + mensaje + '")]')
        $tools.esperar_elemento(msg)
    end

    def registro_usuario_campo_error(campo, dato)
        click_iniciar_session
        case $mobile
        when true 
            $tools.click(@btn_crear_cuenta)
        else
            $tools.click(@btn_crear_cuenta)
        end
        persona = Persona.new
        $datos = persona.generar_persona
        $tools.insertar_texto(@input_nombre, $datos["nombre"])
        $tools.insertar_texto(@input_apellido, $datos["apellido"])
        $tools.insertar_texto(@input_new_rut, $datos["rut"])
        $tools.insertar_texto(@input_email, $datos["email"])
        $tools.insertar_texto(@input_re_email, $datos["email"])
        $tools.insertar_texto(@input_password, $datos["password"])
        $tools.insertar_texto(@input_conf_password, $datos["password"])
        case campo
        when "Nombre"
            $tools.borrar_input(@input_nombre)
            $tools.insertar_texto(@input_nombre, dato)
        when "Apellido"
            $tools.borrar_input(@input_apellido)
            $tools.insertar_texto(@input_apellido, dato)
        when "RUT"
            $tools.borrar_input(@input_new_rut)
            $tools.insertar_texto(@input_new_rut, dato)
            if  @btn_registrarme.present?
                $tools.click(@btn_registrarme)
            end
        when "Email"
            $tools.borrar_input(@input_email)
            $tools.insertar_texto(@input_email, dato)
            if  @btn_registrarme.present?
                $tools.click(@btn_registrarme)
            end
        when "Confirma email"
            $tools.borrar_input(@input_re_email)
            $tools.insertar_texto(@input_re_email, dato)
            if  @btn_registrarme.present?
                $tools.click(@btn_registrarme)
            end
        when "Contraseña"
            $tools.borrar_input(@input_password)
            $tools.insertar_texto(@input_password, dato)
        when "Confirma contraseña"
            $tools.borrar_input(@input_conf_password)
            $tools.insertar_texto(@input_conf_password, dato)
            if  @btn_registrarme.present?
                $tools.click(@btn_registrarme)
            end
        end
    end

    def validar_mensaje_validacion_campo(validacion)
        begin
            msg_validacion = $driver.element(xpath: '//label[contains(text(), "' + validacion + '")]')
            $tools.esperar_elemento_timeout(msg_validacion, 3)
        rescue
            $tools.fallo("Se espera validacion \"#{validacion}\"")
        end
    end

    def add_productos_bolsa(cantidad)
        sku_json = JSON.parse(File.read('features/data/staging_sku.json'))
        @product = FichaPage.new
        @bolsa_home = BolsaHomePage.new
        pivot = 1
        while pivot <= cantidad.to_i
            sku_seleccionado = sku_json["sku"].shuffle.first
            busco_producto(sku_seleccionado)
            @product.verificar_disponibilidad
            @product.seleccionar_opciones_producto_random
            @product.realizo_click_add_bolsa
            @product.click_garext_continuar
            @product.click_seguir_comprando
            @bolsa_home.click_bolsa_productos
            @bolsa_home.validar_producto_agregado
            @bolsa_home.click_cerrar_bolsa
            pivot += 1
        end
    end

    def click_ver_todo
        $tools.click(@btn_ver_todo)
    end

    def validar_titulo(titulo)
        titulo_esperado = $driver.element(xpath: titulo)
        $tools.esperar_elemento(titulo_esperado)
    end

    def posicionarse_menu(menu)
        menu_element = $driver.element(xpath: '//img[@alt="' + menu + '"]')
        $tools.hover(menu_element)
    end

    def click_link(link)
        link_element = $driver.element(xpath: '//img[@alt="' + link + '"]')
        $tools.click(link_element)
    end
end
