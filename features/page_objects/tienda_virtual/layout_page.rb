require './features/tools/Tools.rb'

class LayoutPage

    def click_producto_random
        sleep 4
        cant_productos_pagina = $driver.elements(xpath: '//div[@class="catalog-container"]/div').count        
        item = rand(1..cant_productos_pagina)
        item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/a/div[@class="proportional-image-wrapper catalog-product__image-preview"]')
        item_agotado = $driver.element(xpath: ' //div[@class="catalog-container"]/div[' + item.to_s + ']//button[@class="btn-loading is-disabled BuyButton btn-primary btn-loading js-buy-button"]')
        
        
        while item_agotado.present?
            item = rand(1..cant_productos_pagina)
            item_selected = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/a/div[@class="proportional-image-wrapper catalog-product__image-preview"]')
            item_agotado = $driver.element(xpath: ' //div[@class="catalog-container"]/div[' + item.to_s + ']//button[@class="btn-loading is-disabled BuyButton btn-primary btn-loading js-buy-button"]')
        end
        capturar_datos_producto(item)
        $tools.click(item_selected)       
    end

    def capturar_datos_producto(item)
        # nombre_element = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']//div[@class="ProductItem__Row row"]')
        nombre_element = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/a/div/div[@class="catalog-product-details__name"]')
               
        nombre = nombre_element.text
        puts "Nombre: " + nombre
        
        if $mobile
            precio_normal = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/div[@class="catalog-product-details__prices"]/div/ul/li[@title="Precio Normal"]')
        else
            precio_normal = $driver.element(xpath: '//div[@class="catalog-container"]/div[' + item.to_s + ']/div/div[2]//ul[@class="catalog-prices__list"]/li[@title="Precio Normal"]')
        end


        if precio_normal.present? 
            text_precio_normal =  precio_normal.text
            puts "Precio Normal: " + text_precio_normal
        else 
            puts "No hay precio normal aca"
        end

        if $mobile
            precio_internet = $driver.element(xpath: '//div[@class="catalog-container"]/a[' + item.to_s + ']/div[@class="catalog-product-details__prices"]/div/ul/li[@title="Precio Internet"]')
        else
            precio_internet = $driver.element(xpath: '//div[@class="catalog-container"]/a[' + item.to_s + ']/div/div[2]//ul[@class="catalog-prices__list"]/li[@title="Precio Internet"]')
        end

        if precio_internet.present? 
            text_precio_internet = precio_internet.text 
            puts "Precio Internet: " + text_precio_internet
        else
            puts "No hay precio internet"
        end

        if $mobile
            precio_ripley = $driver.element(xpath: '//div[@class="catalog-container"]/a[' + item.to_s + ']/div[@class="catalog-product-details__prices"]/div/ul/li[@title="Precio Ripley"]')
        else
            precio_ripley = $driver.element(xpath: '//div[@class="catalog-container"]/a[' + item.to_s + ']/div/div[2]//ul[@class="catalog-prices__list"]/li[@title="Precio Ripley"]')
        end

        if precio_ripley.present? 
            text_precio_ripley = precio_ripley.text 
            puts "Precio Ripley: " + text_precio_ripley
        else
            puts "No hay precio ripley"
        end
        
        $producto = Producto.new("", nombre, "", precio_normal, precio_internet, precio_ripley, "", "", "", "", "", "")
        $lista_productos << $producto
    end

end