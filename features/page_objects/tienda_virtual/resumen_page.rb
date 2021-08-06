class ResumenPage
    def initialize 
        selectors = JSON.parse(File.read("./features/selectors/resumen_selectors.json"))
        @title = $driver.element(xpath: selectors["title"])
        @num_orden = $driver.element(xpath: selectors["num_orden"])
        @btn_finalizar = $driver.element(xpath: selectors["btn_finalizar"])
        @descuentos = $driver.element(xpath: selectors["descuentos"])
        @codigo_rclubes = $driver.element(xpath: selectors["codigo_rclubes"])
        @error_modal = $driver.element(xpath: selectors["error_modal"])
    end

    def verificar_pantalla_resumen
        begin
            $tools.esperar_elemento(@title)
            @orden = @num_orden.text
            puts "Orden de compra: #{@orden}"
            $reserva.set_codigo_reserva(@orden)
            $end = true
            $log.set_numero_orden(@orden)
            $tools.salvar_pantalla("Resumen", "features/screenshots/resumen/")
        rescue
            sleep 2
            if @error_modal.present?
                $tools.fallo(@error_modal.text)
            else
                $tools.fallo("No se muestra la pantalla de resumen")
            end
        end
        puts $transaccion_completa
        puts $invitado_nuevo
        if ($transaccion_completa == false && $invitado_nuevo == false)
            $tools.fallo("Venta no se realizo con Transaccion Completa, pero si con Webpay")
        elsif ($transaccion_completa == false && $invitado_nuevo == true)
            puts "Venta se realizo con Webpay ya que es un usuario invitado"
        end
    end

    def verificar_codigo_confirmacion
        begin
            $tools.esperar_elemento @num_orden
            puts "Pagina de Resumen OK, orden realizada: #{@orden}"
        rescue
            $tools.fallo("No se muestra el numero de orden")
        end
    end

    def verificar_monto_total
        monto_total_mostrado = $driver.element(xpath: '//strong[@data-id="order-summary/total-normal"]').text
        if monto_total_mostrado == $reserva.get_data["monto_total"]
            puts "Monto Total correcto #{monto_total_mostrado}"
        else
            $tools.fallo "Monto Total Incorrecto #{monto_total_mostrado}, debe ser #{$reserva.get_data["monto_total"]}"
        end
    end

    def verificar_descuento
        descuento = @descuentos.text.delete("(").delete(")").delete("$").delete(".").to_i
        if $reserva.get_data["valor_descuento"] == descuento
            puts "Valor del descuento en Pagina de Resumen correcto $#{descuento}"
        else
            $tools.fallo "Valor del descuento en pagina de resumen no es correcto es #{descuento} y debe ser #{$reserva.get_data["valor_descuento"]}"
        end
    end

    def verificar_codigo_club
        codigo_esperado = $reserva.get_data["codigo_rclubes"].delete("NOVIOS ")
        codigo_mostrado = @codigo_rclubes.text.delete(" ")
        if codigo_esperado == codigo_mostrado
            puts "Codigo de RClubes correcto #{codigo_mostrado}"
        else
            $tools.fallo "Codigo de RClubes no es correcto es #{codigo_mostrado} y debe ser #{codigo_esperado}"
        end
    end

    def click_finalizar
        $tools.click(@btn_finalizar)
    end
end