class Log

    def initialize
        @start_datetime = DateTime.now
        @orden = "No se obtiene numero de orden"
        @resultado = "Fail"
        @detalle = "Nil"
        @rut = "No se realizo login"
        @cdp = "Nul" 
        @pais = "Nil"
        @url = "Nil"
        @sku = "No se busco sku"
        @sku_inicial = "No se busco sku"
        @medio = "No se realizo pago"
        @formato = "Nil"
    end

    def set_navegador(navegador) 
        @navegador = navegador 
    end

    def set_formato(formato) 
        @formato = formato 
    end

    def set_sku(sku) 
        @sku = sku 
    end

    def set_numero_orden(orden) 
        @orden = orden 
    end
    def set_end_datetime
        # puts "Guardado end_time: " + DateTime.now.to_s
        @end_datetime = DateTime.now
    end

    def set_url(url)
        @url_pais = url
    end

    def set_rut(rut)
        @rut = rut
    end

    def get_rut
        return @rut
    end

    def set_ambiente(ambiente)
        @ambiente = ambiente
    end
    def set_pais(pais)
        @pais = pais
    end

    def set_cdp(value)
        # puts "Guardado cdp: " + value
        @cdp = value
    end
    
    def get_cdp
        return @cdp
    end
    
    def set_duracion
        @duracion = ((@end_datetime - @start_datetime) * 24 * 60 * 60).to_i
        # puts "Guardado duracion: " + @duracion.to_s
    end

    def set_resultado(value)
        #puts "Guardado resultado: " + value.to_s
        @resultado = value
    end

    def get_resultado
        #puts "Guardado resultado: " + value.to_s
        return @resultado
    end

    def set_detalle_resultado(detalle)
        @detalle = detalle
    end

    def get_detalle_resultado
        return @detalle
    end

    def set_url(url)
        @url = url
    end

    def set_medio(medio)
        @medio = medio
    end

    def set_codigo(codigo)
        @codigo = codigo
    end

    def set_cant(cant)
        @cant = cant
    end

    def set_sku_inicial(sku)
        @sku_inicial = sku
    end

    def save_log_ejecucion
        set_end_datetime
        set_duracion
        puts "LOG"
        $tools.ask_and_crear_directorio("features/logs")
        if File.file?("features/logs/log.csv") == false
            puts "CREAR CSV"
            CSV.open("features/logs/log.csv", "wb") do |csv|
                csv << ["cdp", "resultado", "detalle", "orden", "start_datetime", "end_datetime", "duracion", "pais", "url", "rut", "sku_inicial", "sku", "medio", "navegador", "formato"]
            end
        end
        CSV.open("features/logs/log.csv", "a+") do |csv|
            csv << [@cdp, @resultado, @detalle, @orden, @start_datetime, @end_datetime, @duracion, @pais, @url, @rut, @sku_inicial, @sku, @medio, @navegador, @formato]
        end
    end
end
