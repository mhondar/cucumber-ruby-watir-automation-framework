# require './features/tools/Tools.rb'
# class HomeRphonePage

class RPhoneFichaPage

    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/rphone/ficha_rphone_selectors.json"))
            @title_ficha = $driver.element(xpath: @selectors["title_ficha"])
            @title_plan = $driver.element(xpath: @selectors["title_plan"])
            @cant_datos = $driver.element(xpath: @selectors["cant_datos_plan"])
            @cant_minutos = $driver.element(xpath: @selectors["cant_min_plan"])
            @valor_plan = $driver.element(xpath: @selectors["valor_plan"])
            @meses_plan = $driver.element(xpath: @selectors["meses_plan"])
            @name_prod = $driver.element(xpath: @selectors["name_prod"])
            @precio_normal = $driver.element(xpath: @selectors["precio_normal"])
            @precio_descuento = $driver.element(xpath: @selectors["precio_descuento"])
            @valor_celular_y_plan = $driver.element(xpath: @selectors["valor_celular_y_plan"])
            @link_elegir_otro_plan = $driver.element(xpath: @selectors["link_elegir_otro_plan"])
            @plan_container = $driver.element(xpath: @selectors["plan_container"])            
            @link_caracteristicas = $driver.element(xpath: @selectors["link_ver_caracteristicas"])            
            # @link_caracteristicas = $driver.element(xpath: @selectors["link_ver_caracteristicas"])            
            @caract_container = $driver.element(xpath: @selectors["caracteristica_container"])          
        end

    def valida_ficha_producto
        sleep 2
        $tools.esperar_elemento(@title_ficha)
        if @title_ficha.present?
            puts "Se muestra la ficha del producto correctamente"
        else
            $tools.fallo("No se carga la ficha del producto correctamente")            
        end
    end

    def valida_plan_producto_seleccionado
        sleep 3
        $tools.esperar_elemento(@title_plan)
        if @title_plan.present?
            puts "La información es la siguiente:"
            $datos = @cant_datos.text
            puts "datos: #{$datos}"            
            $minutos = @cant_minutos.text
            puts "minutos: #{$minutos}"
            $valor_plan = @valor_plan.text
            puts "valor plan: #{$valor_plan}"
            $meses = @meses_plan.text
            puts "meses: #{$meses}"
            if $datos.blank? || $minutos.blank? || $valor_plan.blank? || $meses.blank?     
                $tools.fallo("No se encuentra la informacion completa del plan elegido")
            else                 
                arregloDatosPlanOriginal = [$datos, $minutos, $valor_plan, $meses]
            end
        end
    end


    def compara_datos_plan_seleccionado
        sleep 3
        arregloDatosPlanOriginal = [$datos, $minutos, $valor_plan, $meses]

        $datos_nuevo = @cant_datos.text
        puts "datos: #{$datos_nuevo}"            
        $minutos_nuevo = @cant_minutos.text
        puts "minutos: #{$minutos_nuevo}"
        $valor_plan_nuevo = @valor_plan.text
        puts "valor plan: #{$valor_plan_nuevo}"
        $meses_nuevo = @meses_plan.text
        puts "meses: #{$meses_nuevo}"

        arregloDatosPlanOriginalNuevo = [$datos_nuevo, $minutos_nuevo, $valor_plan_nuevo, $meses_nuevo]
        print arregloDatosPlanOriginal
        print arregloDatosPlanOriginalNuevo

            if $datos_nuevo != arregloDatosPlanOriginal[0]
                puts "información actualizada correctamente"
            elsif 
                $minutos_nuevo != arregloDatosPlanOriginal[1]
                puts "información actualizada correctamente"
            elsif
                $valor_plan_nuevo != arregloDatosPlanOriginal[2]
                puts "información actualizada correctamente"
            elsif
                $meses_nuevo != arregloDatosPlanOriginal[3]
                puts "información actualizada correctamente"
            else
                $tools.fallo("No se actualiza un dato")
            end
    end


    def valida_actualizacion_datos_plan
        compara_datos_plan_seleccionado
    end

    def veriicar_abra_ficha_productos
        begin
            @name_prod.text == $select_prod_name
            puts "La ficha de producto es correcta"
        rescue
            $tools.fallo("El nombre del producto no coincide en la ficha")
        end
     end


     def valida_precio_normal
        begin
            $tools.esperar_elemento(@precio_normal)
            puts "El Precio Normal es de #{@precio_normal.text}"
        rescue
            $tools.fallo("No se muestra el Precio Normal en la ficha")
        end
     end

     def valida_precio_descuento
        begin
            $tools.esperar_elemento(@precio_descuento)
            puts "El Precio Descuento es de #{@precio_descuento.text}"
        rescue
            $tools.fallo("No se muestra el Precio Descuento en la ficha")
        end
     end

     def valida_precio_valor_celular
        begin
            $tools.esperar_elemento(@valor_celular_y_plan)
            puts "El Precio Celular y Plan es de #{@valor_celular_y_plan.text}"
        rescue
            $tools.fallo("No se muestra el Precio Descuento en la ficha")
        end
    end


    def valida_link_elegir_plan
        begin
            $tools.esperar_elemento(@link_elegir_otro_plan)
            $tools.click(@link_elegir_otro_plan)
        rescue
            puts "No se encuentra el link Elegir otro plan"
        end
    end


    def valida_seccion_elegir_plan
        begin
            $tools.esperar_elemento(@plan_container)
            puts "Container con información de Planes desplegado correctamente"
        rescue
            $tools.fallo("No se muestra container de Planes")
        end
    end

    def presiona_link_caracteristicas
        begin
            $tools.esperar_elemento(@link_caracteristicas)
            $tools.click(@link_caracteristicas)
        rescue
            $tools.fallo("No se encuentra el link Ver caracteristicas")
        end
    end

    def valida_seccion_caracteristicas
        begin 
            $tools.esperar_elemento(@caract_container)
            puts "Container con información y caracteristicas del celular desplegado correctamente"
        rescue
            $tools.fallo("No se muestra container con cacartetisticas del celular")
        end
    end

    def selecciona_nuevo_plan
        # sleep 5
        $tools.esperar_elemento(@plan_container)
        begin
            total_plan = $driver.elements(xpath: '//section[contains(@class, "MuiContainer-maxWidthLg")]/h2/parent::section/div').count
            item = rand(1..total_plan)
            product_item_selected = $driver.element(xpath: '//section[contains(@class, "MuiContainer-maxWidthLg")]/h2/parent::section/div[' + item.to_s + ']//span/input')
            sleep 2
            $driver.execute_script("arguments[0].click()", product_item_selected)
        rescue
            $tools.fallo"Ha ocurrido un error"
        end
    end
end