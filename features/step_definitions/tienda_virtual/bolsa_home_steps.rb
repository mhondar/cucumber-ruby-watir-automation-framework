When("Realizo click en la Bolsa de Productos") do
    @bolsa_home = BolsaHomePage.new
    @bolsa_home.click_bolsa_productos
  end

  Then("Realizo click en pop up de Ir a la Bolsa") do
    @bolsa_home = BolsaHomePage.new
    @bolsa_home.realizar_click_pop_ir_bolsa
  end

  Then("Valido que se encuentre vacia la bolsa del Home") do
    @bolsa_home.validar_bolsa_vacia
  end
  
  Then("Valido producto agregado en la bolsa del home") do
    @bolsa_home = BolsaHomePage.new
    @bolsa_home.validar_producto_agregado
  end

  Then("Valido producto agregado desde carrusel en la bolsa del home") do
    @bolsa_home = BolsaHomePage.new
    @bolsa_home.validar_producto_agregado_carrusel
  end
  
  Then("Elimino todos los productos de la bolsa del home") do
    @bolsa_home.delete_all_product
  end

  Then("Valido que en la Bolsa haya la cantidad de productos agregada {string}") do |cantidad|
    @bolsa_home.validar_cantidad_productos(cantidad)
  end

  Then(/^Indico la cantidad del producto en la bolsa "([^"]*)"$/) do |cantidad|
    @bolsa_home.indicar_cantidad_productos(cantidad)
  end

  Then(/^Valido la cantidad de productos sea la deseada "([^"]*)"$/) do |cantidad|
    @bolsa_home.validar_cantidad_producto(cantidad)
  end

  Then("Elimino el elemento decrementanto la cantidad a cero") do 
    @bolsa_home.indicar_cantidad_productos("0")
  end

  Then("Valido que el producto fue eliminado de la bolsa") do 
    @bolsa_home.validar_producto_eliminado
  end

  Then("Realizo click en ir a la Bolsa") do
    @bolsa_home = BolsaHomePage.new
    @bolsa_home.click_ir_bolsa
  end

  Then("Realizo click en cerrar la Bolsa") do
    @bolsa_home.click_cerrar_bolsa
  end

  Then("Valido Precio Normal del Producto en Bolsa Home") do
    @bolsa_home.validar_precio_normal
  end

  Then("Valido Precio Internet del Producto en Bolsa Home") do
    @bolsa_home.validar_precio_internet
  end

  Then("Valido Precio Ripley del Producto de Bolsa Home") do
    @bolsa_home.validar_precio_ripley
  end

  Then("Valido Subtotal de Bolsa Home") do
    @bolsa_home.validar_subtotal
  end

  Then("Valido Total Normal de Bolsa Home") do
    @bolsa_home.validar_total_normal
  end

  Then("Valido Total Ripley de Bolsa Home") do
    @bolsa_home.validar_total_ripley
  end

  Then("Valido productos agregados a la bolsa") do
    @bolsa_home.validar_listado_productos_bolsa
  end




