class RPhoneCatalogoPage
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/rphone/catalogo_rphone_selectors.json"))
            @box_producto = $driver.elements(xpath: @selectors["box_prod_catalogo"])
            @box_equipo_plan = $driver.element(xpath: @selectors["box_equipo_plan"])
            @total_products_page = $driver.elements(xpath: @selectors["count_product"])
            @title_catalogo = $driver.element(xpath: @selectors["title_catalogo"])

    end 

    def validar_carga_productos_catalogo_rphone
        sleep 4
        # $tools.esperar_elemento(@box_equipo_plan)
        resultados = $driver.element(xpath: '//div[@class="MuiGrid-root MuiGrid-item"]/span')
        cant_resultados = resultados.text.delete(" Resultados").to_i
        $cant_productos = @box_producto.count
        puts "Se encontraron #{$cant_productos} productos en el catalogo y la cantidad inicial es #{cant_resultados} productos"
        if cant_resultados != $cant_productos
            $tools.fallo("La cantidad de productos no coincide")
        else
            puts "La cantidad de productos es correcta"
        end
     end

    def selecciona_productos_rphone
        validar_carga_productos_catalogo_rphone
        sleep 1
        despliega_productos
        item = rand(1..$cant_productos)
        $select_prod_name = ($enable_product[item]).text
        $select_prod = ($enable_product[item])
        puts "El nombre es: #{$select_prod_name}"
        sleep 1
        $driver.execute_script("arguments[0].click()", $select_prod)
    end

    def despliega_productos
        $enable_product = $driver.elements(xpath: '//div[contains(@class, \'MuiCardContent-root\')]/h3')
        num_enable_product = $enable_product.count
        #acá bajo con el teclado para que se carge el catálogo y se desplieguen todos los productos
        while num_enable_product.to_i != $cant_productos
            $driver.send_keys :down
            $driver.send_keys :down
            $driver.send_keys :down
            $driver.send_keys :down
            num_enable_product += 1
        end
    end

    def verificar_open_catalogo_rphone
        sleep 2
        begin
            $tools.esperar_elemento(@title_catalogo)
            puts "Se muestra el catalogo de productos de Rphone"
        rescue
            $tools.fallo("No se muestra el catalogo de productos de Rphone")
        end
    end    
end