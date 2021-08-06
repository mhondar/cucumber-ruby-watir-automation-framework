# require './features/tools/Tools.rb'
# class HomeRphonePage

class RPhoneHomePage

    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/rphone/home_rphone_selectors.json"))
            @btn_catalogo = $driver.element(xpath: @selectors["btn_equipo_plan"])
            @tit_home = $driver.element(xpath: @selectors["title_home"])
            @tit_catalogo = $driver.element(xpath: @selectors["title_catalogo"])
            @rphone_container = $driver.element(id: @selectors["rphone_container"])
    end 

def verificar_open_home_rphone
    begin
        $tools.esperar_elemento(@tit_home)
        puts "Correcto"

    rescue Selenium::WebDriver::Error::NoSuchElementError
        puts "Boo"
    rescue 
        $tools.fallo("No se pudo abrir el home correctamente")
    end
end

def clic_ir_plan
    $tools.click(@btn_catalogo)
    sleep 2
end



def clic_ver_detalles
    sleep 4
    begin
        prod_ver_detalle = $driver.elements(xpath: '//span[@class="MuiButton-label"]')
        cant_productos = prod_ver_detalle.count
        random_product_select = rand 1..cant_productos
        if random_product_select != NIL && random_product_select != 0
            puts "Imagen seleccionada: #{random_product_select}"
        end
        $tools.click(prod_ver_detalle[random_product_select])
    rescue
        $tools.fallo("Error")
    end
end



def clic_imagen_producto
    begin
        btn_img_producto = $driver.elements(xpath: '//div[contains(@class, "MuiCardMedia-root")]')
        cant_product = btn_img_producto.count
        random_product_select = rand 1..cant_product
        $tools.click(btn_img_producto[random_product_select])
    rescue
        $tools.fallo("No se pudo seleccionar el producto")
    end
end

end

