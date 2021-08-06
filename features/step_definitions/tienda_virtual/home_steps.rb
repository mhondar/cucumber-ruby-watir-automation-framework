Given(/^Abro la pagina de ripley en ambiente "([^"]*)" de "([^"]*)" "([^"]*)"$/) do |ambiente, pais, cdp|
    $name = cdp
    $ambiente = ambiente
    $pais = pais
    $log.set_cdp(cdp)
    $log.set_ambiente(ambiente)
    $log.set_pais(pais)
    @ripley_home = RipleyHomePage.new


    if !ENV['URL'].nil?
      $url = ENV['URL']
      puts $url
    else
      url_json = JSON.parse(File.read("./features/data/url.json"))    
      $url = url_json[pais][ambiente]
    end
   
    if ambiente == "preprod"
      @ripley_home.request_new_chkout
    elsif ambiente == "staging"
      puts ambiente
      @ripley_home.request_new_chkout_staging
    elsif ambiente == "newchk_stable"
      @ripley_home.request_new_chkout_stable
    # elsif ambiente == "rphone_dev"
    #   @rphone_home.request_rphone_dev
    end
 
    @ripley_home.abrir_home_page($url) 
    $log.set_url($url)
  end

Then("Verifico se muestre Home principal") do
  @ripley_home.verificar_open_home
end


Then("Verifico se muestre Home principal en nueva pestaña del navegador") do
  @ripley_home.verificar_open_home_nueva_pestana
end


Then("Realizo click en Iniciar Sesion") do
  @ripley_home = RipleyHomePage.new
  @ripley_home.click_iniciar_session
end

Then("Realizo click en Crea tu Cuenta") do
  @ripley_home.click_crea_tu_cuenta
end

Then("Realizo click en Tu cuenta del Menu Mi Cuenta") do
  @ripley_home.click_tu_cuenta
end

And("Cierro Pop up de notificaciones Actualizar Datos Personales") do
  @ripley_home.cerrar_popup_actualizar_datos
end


Then("Cierro PopUp de Notificaciones") do
  @ripley_home.cerrar_popup
end

Then("Realizo click en No estas registrado Hazlo aqui") do
  @ripley_home.click_hazlo_aqui
end

Then("Verifico se redirecione a la pagina de registro de usuarios") do
  @ripley_home.verificar_pagina_registro
end

Then("Registro un usuario nuevo") do
  @ripley_home = RipleyHomePage.new
  @ripley_home.registrar_usuario_nuevo
  $invitado_nuevo = true
end

Then("Verificar Menu Mi cuenta") do
  @ripley_home = RipleyHomePage.new
  @ripley_home.verificar_menu_mi_cuenta
end

Then("Realizo click en Olvidaste tu contraseña") do
  @ripley_home.click_olvidaste_contrasenna
end

When(/^Realizo login con las credenciales "([^"]*)" y "([^"]*)"$/) do |rut, pass|
  @ripley_home = RipleyHomePage.new
  @ripley_home.click_iniciar_session
  @ripley_home.ingreso_credenciales(rut, pass)
end

When("Realizo login con las credenciales {string} {string}") do |proyecto, categoria|
  @ripley_home = RipleyHomePage.new
  @ripley_home.click_iniciar_session
  if proyecto == "mi_cuenta"
    $categoria = categoria
    datos = JSON.parse(File.read("./features/data/usuarios_mi_cuenta.json"))
    rut = datos[categoria]["rut"]
    pass = datos[categoria]["clave_actual"]
  end
  @ripley_home.ingreso_credenciales(rut, pass)
end

When(/^Ingreso las credenciales "([^"]*)" y "([^"]*)"$/) do |rut, pass|
  @ripley_home = RipleyHomePage.new
  @ripley_home.ingreso_credenciales(rut, pass)
end

Then("Verifico login exitoso") do
  @ripley_home.verifico_login_exitoso_sin_reintento
end

Then("Verifico registro exitoso") do
  @ripley_home.verificar_registro_exitoso
end

When(/^Busco producto "([^"]*)"$/) do |criterio|
    @ripley_home = RipleyHomePage.new
    @ripley_home.busco_producto(criterio)
  end

  
  When(/^Busco producto con Palabra invalida "([^"]*)" "([^"]*)"$/) do |criterio, palabraInvalida| 
    @ripley_home = RipleyHomePage.new
    @ripley_home.busco_producto(criterio + palabraInvalida)
    end

    When(/^Verifico que se muestren resultados eliminando palabra invalida "([^"]*)" "([^"]*)"$/) do |criterio, palabraInvalida| 
      @SearchResult = SearchResultPage.new
      @SearchResult.validar_elimina_palabra_desconocida(criterio, palabraInvalida)
      end

  When(/^Verifico que se muestren resultados de la busqueda ingresada "([^"]*)"$/) do |criterio|
    @ripley_home.verificar_resultado_busqueda_ingresada(criterio)
  end

  When(/^Realizo login con las credenciales "([^"]*)"$/) do |medio|
    @ripley_home.click_iniciar_session
    @ripley_home.ingreso_credenciales_json(medio)
    @ripley_home.verifico_login_exitoso_y_reintento
  end

  When("Realizo login con dato generado") do 
    @ripley_home.click_iniciar_session
    rut = JSON.parse(File.read("./features/data/datagen_E2E.json"))
    cdp = $name[0, 5] 
    @ripley_home.ingreso_credenciales(rut[cdp], "1234")
  end

  When(/^Realizo login "([^"]*)"$/) do |rut|
    @ripley_home.click_iniciar_session
    @ripley_home.ingreso_credenciales(rut, "1234")
  end

  Then(/^Verifico que este registrado, en caso negativo Registro Usuario "([^"]*)"$/) do |rut|
  result = @ripley_home.validar_login
    @vaciar_bolsa = true
    case result
    when false
      @ripley_home.registrar_usuario_nuevo_rut(rut)
      @vaciar_bolsa = false
    end
    $driver.send_keys :escape
  end

  Then(/^Verifico que este registrado, o Registro Usuario "([^"]*)"$/) do |medio|
    result = @ripley_home.validar_login
    @vaciar_bolsa = true
    case result
    when false
      json = JSON.parse(File.read("./features/data/medios_pago.json"))
      rut = json[medio]["rut"]
      @ripley_home.registrar_usuario_nuevo_rut(rut)
      @vaciar_bolsa = false
    end
    $driver.send_keys :escape
  end

  When(/^Realizo click en "([^"]*)"$/) do |menu|
    @ripley_home.click_menu(menu)
  end
  
  When(/^Verifico que me redireccione a la pagina correspondiente "([^"]*)"$/) do |menu|
    @ripley_home.verificar_pagina_menu(menu)
  end
  
  When("Realizo click en Menu de Categorias") do
    @ripley_home.click_menu_categorias
  end

  When(/^Realizo click en Categoria de Primer Nivel "([^"]*)"$/) do |categoria|
    @ripley_home.click_categoria_principal(categoria)
  end

  When(/^Realizo click en Categoria de Marketing Zone "([^"]*)"$/) do |categoria|
  @ripley_home.click_categoria_marketing(categoria)
end

  When(/^Realizo click en Categoria de Segundo Nivel "([^"]*)"$/) do |subcategoria2|
    @ripley_home.click_subcategoria_2do_nivel(subcategoria2)
  end

  When(/^Realizo click en Categoria de Tercer Nivel "([^"]*)" "([^"]*)"$/) do |subcategoria2, subcategoria3|
    @ripley_home.click_subcategoria_3er_nivel(subcategoria2, subcategoria3)
  end

  When(/^Realizo click en Categoria de Tercer Nivel Mobile "([^"]*)"$/) do |subcategoria3|
    @ripley_home.click_subcategoria_3er_nivel_mobile(subcategoria3)
  end

  Then(/^Verifico que no se muestren resultados "([^"]*)"$/) do |criterio|
    case criterio
    when "Sku"
      @ripley_home.verificar_no_resultados_sku
    when "Texto"
      @ripley_home.verificar_no_resultados_texto
    end
  end

  When(/^Verifico mensaje alternativo "([^"]*)"$/) do |mensaje|
    @ripley_home.verificar_mensaje_login_alternativo(mensaje)
  end

  When(/^Registro un usuario con rut ya registrado "([^"]*)"$/) do |rut|
    @ripley_home.registrar_usuario_registrado(rut)
  end

  When(/^Verifico mensaje de error en registro "([^"]*)"$/) do |mensaje|
    @ripley_home.verifico_mensaje_registro(mensaje)
  end
  
When(/^Registro usuario con campo erroneo "([^"]*)" "([^"]*)"$/) do |campo, dato|
  @ripley_home.registro_usuario_campo_error(campo, dato)
end

When(/^Valido mensaje de validacion de campo "([^"]*)"$/) do |validacion|
  @ripley_home.validar_mensaje_validacion_campo(validacion)
end

When("Agrego n cantidad de productos de la lista a la bolsa {string}") do |cantidad|
  @ripley_home.add_productos_bolsa(cantidad)
end

Then("Realizo Logout") do
  @ripley_home = RipleyHomePage.new
  @ripley_home.logout
end

Then("Verifico se realizo el logout correctamente") do
  @ripley_home.verificar_logout
end

Then("Realizo click en ver todo") do
  @ripley_home.click_ver_todo
end

When("Valido que se muestre pagina correspondiente {string}") do |titulo|
  @ripley_home.validar_titulo(titulo)
end

When(/^Paso el mouse sobre el menu "([^"]*)"$/) do |menu|
  @ripley_home.posicionarse_menu(menu)
end

When(/^Realizo click en la opcion del menu "([^"]*)"$/) do |link|
  @ripley_home.click_link(link)
end