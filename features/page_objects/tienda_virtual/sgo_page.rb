class SgoPage
    def validar_estado_reserva
        numero_orden = $reserva.get_data["codigo_reserva"]
        monto_venta_esperado = $reserva.get_data["monto_total"].delete("$").delete(".")
        
        if $ambiente == "prd"
            url = "http://10.15.46.194:8088/orderInfo/#{numero_orden}"
        else
            url = "http://10.15.46.194:8088/orderInfo/#{numero_orden}"
        end

        response = JSON.parse(open(url).read)
        if response.empty?
            puts "Orden no se Registra en SGO"
        else
            puts response
            puts response[0]["montoVenta"]
            puts response[0]["estado"]

            if (response[0]["montoVenta"] == monto_venta_esperado)
                puts "OK Monto de Venta en SGO de #{numero_orden}: #{response[0]["montoVenta"]}"
            else
                puts "NOK Monto de Venta en SGO de #{numero_orden}: #{monto_venta_esperado}/#{response[0]["montoVenta"]}"
            end
                
            if $ambiente == "prd"
                if (response[0]["estado"] == "0" || response[0]["estado"] == "12")
                    puts "OK Estado SGO de #{numero_orden}: #{response[0]["estado"]}"
                else
                    $tools.fallo("NOK Estado SGO de #{numero_orden}: #{response[0]["estado"]}") 
                end
            else
                if (response[0]["estado"] == "1" || response[0]["estado"] == "2")
                    puts "OK Estado SGO de #{numero_orden}: #{response[0]["estado"]}"
                elsif response[0]["estado"] == "12"
                    puts "NOK Estado SGO de #{numero_orden}: #{response[0]["estado"]}"
                else
                    puts "Pendiente Estado SGO de #{numero_orden}: #{response[0]["estado"]}"
                end
            end
        end
    end

end