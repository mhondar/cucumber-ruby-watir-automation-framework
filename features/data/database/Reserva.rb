class Reserva

    def initialize(medio)
        @reserva = {
            "codigo_reserva" => "", 
            "medio_pago" => medio,
            "monto_total" => 0,
            "cupon_descuento" => "",
            "valor_descuento" => 0,  
            "codigo_rclubes" => ""
        }
    end

    def set_codigo_reserva codigo
        @reserva["codigo_reserva"] = codigo
    end

    def set_monto_total monto
        @reserva["monto_total"] = monto
    end

    def set_cupon_descuento cupon
        @reserva["cupon_descuento"] = cupon
    end

    def set_valor_descuento valor
        @reserva["valor_descuento"] = valor
    end

    def set_codigo_rclubes codigo
        @reserva["codigo_rclubes"] = codigo
    end

    def get_data
        return @reserva
    end

end