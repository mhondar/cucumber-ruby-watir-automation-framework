Then("Verifico que este disponible para comprar") do
    @ficha = FichaPage.new
    @ficha.verificar_disponibilidad
  end

  When("Verifico disponibilidad de productos") do 
    @ficha = FichaPage.new
    @ficha.verificar_disponibilidad_sku
  end

  When(/^Ingreso la cantidad de productos (\d+)$/) do |cant|
    @ficha.ingresar_cantidad_productos(cant)
end

Then("Selecciono comuna o tienda mas cercana") do
    @ficha = FichaPage.new
    @ficha.selecciono_comuna_cercana
end

When("Agrego el producto a la bolsa") do
    @ficha.realizo_click_add_bolsa
end

When("Indico ir a la Bolsa") do
    @ficha.click_ir_bolsa
end

When("Realizo click en la PreBolsa") do
    @ficha.click_bolsa_productos
end

When("Realizo click en continuar en PopUp de Garantia Extendida") do
    @ficha.click_garext_continuar
end

When("Valido que se muestre PopUp de Garantia Extendida") do
    @ficha.validar_popup_extragarantia
end

When("Indico seguir comprando") do
    @ficha = FichaPage.new
    @ficha.click_seguir_comprando
end

When("Selecciono opcion del producto random") do
    @ficha = FichaPage.new
    @ficha.seleccionar_opciones_producto_random
end


When("Selecciono otra imagen random del producto") do
    @ficha = FichaPage.new
    @ficha.seleccionar_imagen_random_producto
end


When("Realizo Click en Conoce tu talla") do
    @ficha = FichaPage.new
    @ficha.click_conoce_tu_talla
end

When("Valido que se muestre conoce tu talla") do
    @ficha.validar_container_conoce_tu_talla
end

When("Realizo Click guia de tallas") do
    @ficha = FichaPage.new
    @ficha.click_guia_talla
end

When("Valido que se muestre guia de tallas") do
    @ficha.validar_container_guia_talla
end
  
When(/^Selecciono extragaratia "([^"]*)"$/) do |extragarantia|
    @ficha.seleccionar_extragarantia(extragarantia)
end

Then(/^Selecciono extragaratia del popup "([^"]*)"$/) do |extragarantia|
    @ficha.seleccionar_extragarantia_popup(extragarantia)
end

Then(/^Verifico datos del producto en la ficha "([^"]*)"$/) do |atributo|
    @ficha = FichaPage.new
    @ficha.verificar_dato_producto(atributo)
end

When("Verifico que se muestre sugerencia de pago en cuotas") do
    @ficha.verificar_sugerencia_cuotas_presente
end

When("Verifico que no se muestre sugerencia de pago en cuotas") do
    @ficha.verificar_sugerencia_cuotas_no_presente
end

Then(/^Verifico las cuotas sugeridas para pagar "([^"]*)"$/) do |cuotas|
    @ficha.verificar_cuotas_sugerencia(cuotas)
end

When("Realizo click en Calcular Cuotas") do
    @ficha.click_calcular_cuotas
end

When("Verifico que se muestre el Formulario de Calculo de Cuotas") do
    @ficha.verificar_formulario_calcular_cuotas
end

When("Verifico Pago Mensual del mensaje de sugerencia correcto") do
    @ficha.verificar_pago_mensual_sugerido
end

When("Verifico Medio de Pago Tarjeta Ripley en mensaje de sugerencia") do
    @ficha.verificar_medio_pago_ripley_sugerido
end

When("Verifico Costo Total del mensaje de sugerencia correcto") do
    @ficha.verificar_costo_total_sugerido
end

When("Verifico CAE del mensaje de sugerencia correcto") do
    @ficha.verificar_cae_sugerido
end

Then(/^Selecciono Numero de cuotas "([^"]*)"$/) do |num_cuotas|
    @ficha.selecciono_numero_cuotas(num_cuotas)
  end
  
  Then(/^Verifico que Pago Mensual este correcto "([^"]*)"$/) do |num_cuotas|
    @ficha.verifico_pago_mensual_formulario(num_cuotas)
  end

  Then(/^Verifico que Costo Total este correcto "([^"]*)"$/) do |num_cuotas|
    @ficha.verifico_costo_total_formulario(num_cuotas)
  end

  Then(/^Verifico que CAE este correcto "([^"]*)"$/) do |num_cuotas|
    @ficha.verifico_cae_formulario(num_cuotas)
  end

When("Valido se active boton Agregar a la bolsa") do
    @ficha.verificar_activacion_add_bag_button
end

When("Valido que se muestre el nombre del producto") do
    @ficha.validar_nombre_ficha
end

When("Valido que se muestre el sku del producto") do
    @ficha.validar_sku_ficha
end

When("Valido que se muestre la calificacion del producto") do
    @ficha.validar_calificaciones_ficha
end

When("Valido que se muestre la descripcion del producto") do
    @ficha.validar_descripción_corta
end

Then("Valido que se muestre el container correctamente") do
    @ficha.validar_container_nuevo
end

When("Valido que se muestre el precio normal del producto") do
    @ficha.validar_precio_normal
end

When("Valido que se muestre el precio internet del producto") do
    @ficha.validar_precio_internet
end

When("Valido que se muestre el precio ripley del producto") do
    @ficha.validar_precio_ripley
end

When("Valido que se muestre la cantidad de ripley puntos Go del producto") do
    @ficha.validar_puntos_ripley
end

When("Valido que se muestre el descuento correcto") do
    @ficha.validar_descuento
end

When("Valido que se muestre el despacho a domicilio correctamente") do
    @ficha.validarDespachoDisponible
end

When("Realizo click en boton de cambiar comuna") do
    @ficha.clickCambiarComuna
end

When("Selecciono comuna siguiente") do
    @ficha.clickSelectComuna
end

When("Valido que se muestre paleta de colores") do
    @ficha.validarMuestraPaletaColores
end

When("Valido que se muestren las tallas disponibles") do
    @ficha.validarMuestraTallas
end

When("Valido que se muestre mensaje de seleccionar opciones") do
    @ficha.validarSeleccionaOpciones
end


Then(/^Clusterizacion de SKU por categorias "([^"]*)"$/) do |archivo|
    ficha = FichaPage.new
    case archivo
    when "txt"
        ficha.clusterizacion_sku_txt
    when "json" 
        ficha.clusterizacion_sku_json
    end
end



And("Verifico que cargue la imagen principal del producto") do
    @ficha = FichaPage.new
    @ficha.verificar_imagen_producto
end


And("Consulto nombre de imagen principal") do
    @ficha = FichaPage.new
    @ficha.consultar_nombre_img_principal
end

Then("Verifico que se haya modificado la imagen del producto") do
    @ficha = FichaPage.new
    @ficha.consultar_nombre_img_modificada
end

When(/^Selecciono de la ficha producto tab "([^"]*)"$/) do |nombreTab|
    @ficha = FichaPage.new
    @ficha.seleccionar_tab(nombreTab)
end

Then(/^Verifico que se cambie de tab correctamente "([^"]*)"$/) do |nombreTab|
    @ficha.verificar_cambio_tab_ficha_producto(nombreTab)
end

Then("Agrego el primer producto desde las recomendaciones") do
    @ficha.agregar_bolsa_recomendaciones
end

When("Realizo Click Ver con realidad aumentada") do
    @ficha = FichaPage.new
    @ficha.ver_realidad_aumentada
end

Then("Valido que se despliegue iframe de realidad aumentada") do
    @ficha.validar_iframe_realidad_aumentada
end