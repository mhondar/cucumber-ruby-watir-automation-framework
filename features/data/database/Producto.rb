
class Producto

    def initialize(sku, nombre, descripcion, precio_normal, precio_internet, precio_ripley, descuento, ripley_puntos, cantidad, color, talla, mkp)
        @producto = {"sku" => sku, 
            "nombre" => nombre, 
            "descripcion" => descripcion, 
            "precio_normal" => precio_normal, 
            "precio_internet" => precio_internet,
            "precio_ripley" => precio_ripley,
            "descuento" => descuento,
            "ripley_puntos" => ripley_puntos,
            "cantidad" => cantidad,
            "color" => color,
            "talla" => talla,
            "nombre_extragarantia" => "",
            "precio_extragarantia" => "",
            "despacho_domicilio" => "", 
            "retiro_tienda" => "",
            "codigo_venta" => "",
            "agotado" => false,
            "es_mkp" => mkp}
    end

    def get_data
        return @producto
    end

    def set_es_mkp
        @producto["es_mkp"] = true
    end


    def set_despacho(despacho)
        @producto["despacho_domicilio"] = despacho
    end

    def set_color(color)
        @producto["color"] = color
    end

    def set_talla(talla)
        @producto["talla"] = talla
    end

    def set_nombre_extragarantia(nombre_extragarantia)
        @producto["nombre_extragarantia"] = nombre_extragarantia
    end

    def set_precio_extragarantia(precio_extragarantia)
        @producto["precio_extragarantia"] = precio_extragarantia
    end

    def set_codigo_venta(codigo)
        @producto["codigo_venta"] = codigo
    end

    def set_cantidad(cantidad)
        @producto["cantidad"] = cantidad
    end

    def set_agotado(estado)
        @producto["agotado"] = estado
    end

end