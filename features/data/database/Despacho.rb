class Despacho

    def initialize(tipo, direccion, dia, mes, horario, costo)
        @despacho = {
            "tipo" => tipo,
            "direccion" => direccion,
            "dia" => dia,
            "mes" => mes,
            "horario" => horario,
            "costo" => costo,
            "numero" => ""
        }
    end

    def set_tipo tipo
        @despacho["tipo"] = tipo
    end

    def set_direccion direccion
        @despacho["direccion"] = direccion
    end

    def set_dia dia
        @despacho["dia"] = dia
    end

    def set_mes mes
        @despacho["mes"] = mes
    end

    def set_horario horario
        @despacho["horario"] = horario
    end

    def costo_despacho costo
        @despacho["costo"] = costo
    end

    def set_numero numero
        @despacho["numero"] = numero
    end

    def get_data
        return @despacho
    end

end