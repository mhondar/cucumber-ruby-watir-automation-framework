
Then ("Valido que se carguen los productos en el catalogo de rphone") do
    @home_rphone = RPhoneCatalogoPage.new 
    @home_rphone.validar_carga_productos_catalogo_rphone
end

And ("Selecciono un producto desde el catalogo de productos") do
   @home_rphone = RPhoneCatalogoPage.new 
   @home_rphone.selecciona_productos_rphone
end  


Then("Confirmo que me encuentro en catalogo de productos rphone") do
    @home_rphone = RPhoneCatalogoPage.new 
    @home_rphone.verificar_open_catalogo_rphone
  end