require 'date'

class Tools
   
    def visitar_portal(url)
        count = 0
        $driver.goto url
        begin
            $driver.wait
        rescue Selenium::WebDriver::Error::UnknownError
            $driver.refresh
            count +=1
            if count < 3
                retry
            else
                $tools.fallo("Error de Red")
            end 
        end
        $driver.cookies.add 'robot', 'true', path: '/', secure: true, domain: 'ripley.cl'
    end

    def back
        $driver.back
    end
    
    def click(element)
        esperar_elemento(element)
        # if (element.exists? && element.present? && element.enabled?)
            element.click
        # end
    end

    def hover(element)
        esperar_elemento(element)
        if (element.exists? && element.present?)
            element.hover
        end
    end

    def esperar_elemento(element)
        element.wait_until(&:present?)
    end

    def esperar_after_timeout(element)
        element.esperar_elemento_timeout(element, 30)
    end

    def esperar_elemento_timeout(element, time)
        element.wait_until(timeout: time, &:present?)
    end

    def insertar_texto(elemento, texto)
        esperar_elemento(elemento)
        elemento.send_keys texto
    end
    
    def scroll(element)
        element.scroll_into_view
        # $driver.scroll.to element
    end

    def scroll_to(param)
        args = case param
               when :top, :start
                 'window.scrollTo(0, 0);'
               when :center
                 'window.scrollTo(window.outerWidth / 2, window.outerHeight / 2);'
               when :bottom, :end
                 'window.scrollTo(0, document.body.scrollHeight);'
               when Array
                 ['window.scrollTo(arguments[0], arguments[1]);', Integer(param[0]), Integer(param[1])]
               else
                 raise ArgumentError, "Don't know how to scroll to: #{param}!"
               end
    
        $driver.execute_script(*args)
    end

    def jump_to(param)
        # Leveraging the scroll_to(param) logic, this grabs the cooridnates,
        # and then makes them an array that is able to be located and moved to.
        # This is helpful when pages are getting too long and you need to click a button
        # or interact with the browser, but the page 'Cannot locate element'.
        location = param.wd.location
        location = location.to_a
        $driver.scroll_to(location)
    end

    def click_inserta_tab(xpath, texto)
        click(xpath)
        insertar_texto_fast(texto, xpath)
        $driver.send_keys :tab
    end

    def click_if_present(element)
        if element.present?
            click(element)
        end
    end

    def create_wait_element(xpath)
        element = $driver.element(xpath: xpath)
        element.wait_until(&:present?)
    end

    def borrar_input(elemento)
        # elemento.to_subtype.clear
        elemento.click
        sleep 2
        elemento.double_click
        $driver.send_keys :delete
    end

    def verificar_elemento(element)
        if element.present?
            return true
        else
            return false
        end
    end

    def insertar_texto_wait_tab(texto, elem_textfield)
        click(elem_textfield)
        elem_textfield.send_keys texto
        sleep 10
        $driver.send_keys :tab
        sleep 2
    end

    def insertar_texto_fast_tab(texto, elem_textfield)
        elem_textfield.send_keys texto
        sleep 6
        $driver.send_keys :tab
    end

    def insertar_testo_down_enter(texto, elem_textfield)
        insertar_texto_fast(texto, elem_textfield)
        sleep 6
        $driver.send_keys :down
        $driver.send_keys :enter
        sleep 1
    end

    def clear_and_inserta_texto(elemento, texto)
        esperar_elemento(elemento)
        elemento.to_subtype.clear
        elemento.send_keys texto
    end

    def seleccionar_opcion(element,opcion)
        esperar_elemento(element)
        element.select(opcion)
    end

    def seleccionar_value(element,value)
        esperar_elemento(element)
        element.select_value(value)
    end

    def esperar_enabled(element)
        while !element.enabled?
            sleep 1
        end
    end

    def get_attribute_value(element,attribute)
        element.attribute_value(attribute)
    end

    def select_checkbox(element)
        esperar_elemento(element)
        element.set
    end

    def unselect_checkbox(element)
        esperar_elemento(element)
        element.clear
    end

    def seleccionar_random_select_opcion(list_opcions)
       esperar_elemento(list_opcions)
       list_opcions.options.select(&:enabled?).sample.click
    end

    def concatenar_fecha_desglosada(anio,mes,dia)
        return anio.to_s + "-" + mes.to_s + "-" + dia.to_s
    end

    def salvar_pantalla(step, ruta)
        if $screenshots == "true"
            puts "Salva de Screenshot #{step}"
            ask_and_crear_directorio(ruta)
            filename = $name + "_" + step + "_" + $navegador + "_" + $device + "_" + filename_time
            direccion = ruta + filename + ".png"
            $driver.screenshot.save(direccion)
        end
    end

    def ask_and_crear_directorio(ruta)
        unless File.directory?(ruta)
            FileUtils.mkdir_p(ruta)
        end
    end

    def ask_and_crear_file(ruta, file)
        unless File.directory?(ruta)
            FileUtils.mkdir_p(ruta)
        end
        if File.file?(ruta + "/" + file) == false
            puts "CREAR CSV"
            CSV.open(ruta + "/" + file, "wb") do |csv|
                csv << [ruta + "/" + file]
            end
        end
    end

    def filename_time
        time_now = Time.now.to_s
        file_name = time_now[0..18]
        file_name[10] = "_"
        file_name[13] = "H"
        file_name[16] = "M"
        file_name[19] = "S"
        return file_name
    end

    def click_wait_click(link,desc,cerrar)
        click(link)
        esperar_elemento(desc,30)
        click_and_wait(cerrar,2)
    end

    # GENERADOR DE RUT *******
    def get_documento
        case $pais
        when "cl"
            numero = concant_number
            dv = calcula_dv(numero)
            return "#{numero}#{dv}"
        else
            dni = get_dni
            puts "documento: #{dni}"
            return get_dni
        end
    end

    def concant_number
        return "#{obtener_sum_number}#{random_num}"
    end

    def calcula_dv(number)
        reversed_digits = number.to_s.reverse.chars.map(&:to_i)
        factors = (2..7).to_a.cycle
        suma = reversed_digits.zip(factors).inject(0) {|sum, (d, f)| sum + d * f }
        dv = (-suma) % 11 == 10 ? 'K' : (-suma) % 11
    end

    def get_dni
        sum_number = obtener_sum_number
        random = random_num
        return "#{sum_number}#{random}"
    end

    def obtener_sum_number
        time = Time.new
        year = time.year
        month = time.month
        day = time.day
        min = time.min
        sec = time.sec
        sum_number =  year + month + day + min + sec
        return sum_number.to_s
    end

    def random_num
        r = Random.new
        return r.rand(1000...9999).to_s
    end

    #FIN GENERADOR DE RUT ********

    def salvar_dato_prueba(caso, rut)
        json_data = JSON.parse(File.read("./features/data/datagen_E2E.json"))
        json_data[caso] = rut
        json_data.to_json
        File.open("./features/data/datagen_E2E.json","w") do |f|
            f.write(JSON.pretty_generate(json_data))
        end
    end

    def salvar_dato_prueba_medio(caso, medio)
        medio_pago = JSON.parse(File.read("./features/data/medios_pago.json"))
        datagen = JSON.parse(File.read("./features/data/datagen_E2E.json")) 
        medio_pago[medio]["rut"] = datagen[caso]
        medio_pago.to_json
        File.open("./features/data/medios_pago.json","w") do |f|
            f.write(JSON.pretty_generate(medio_pago))
        end
    end

    def precio_en_el_rango(precio, rango)
        precios = rango.split
        precio_min = precios[0].delete("$").delete(".").to_i
        precio_max = precios[2].delete("$").delete(".").to_i
        if(precio >= precio_min && precio <= precio_max)
            return true
        else
            return false
        end
    end

    def elemento_presente_array(faceta, array_facetas)
        result = false
        array_facetas.each do |i|
            if i == faceta
                result = true
            end
        end
        return result
    end

    def get_cantidad_elemento(sku)
        count = 0
        $lista_productos.each do |i|
            if i.get_data["sku"] == sku
                count += 1
            end
        end
        return count
    end

    def fallo(mensaje)
        $log.set_detalle_resultado(mensaje)
        $tools.salvar_pantalla("Fail", "features/screenshots/fails/")
        fail(mensaje)
    end

    def return_numero_mes
        t = Time.now
        return t.strftime("%m")
    end
    

    def realiza_cambio_foco_pestana
        ventana_uno = $driver.window.handle
        $driver.driver.switch_to.window($driver.driver.window_handles[1])
    end
end
