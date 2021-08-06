class Direccion
    def initialize
        @direccion = {
            "calle" => "",
            "numero" => "",
            "dpto" => "",
            "region" => "",
            "comuna" => "",
            "telef_fijo"  => "",
            "celular" => ""
        }
    end

    def generar_direccion(despacho)
        set_dir(despacho)
        @direccion["numero"] = get_numero
        @direccion["dpto"] = get_dpto
        @direccion["telef_fijo"] = get_telef_fijo
        @direccion["celular"] = get_celular
        return @direccion
    end

    def set_dir(despacho)
        listado = JSON.parse(File.read('features/data/dd_regiones_comunas.json'))
        region = listado["Disponible"].keys.shuffle.first
        comuna = listado["Disponible"][region].keys.shuffle.first
        calle = listado["Disponible"][region][comuna].shuffle.first

        @direccion["region"] = region
        @direccion["comuna"] = comuna
        @direccion["calle"] = calle
    end

    def get_numero
        r = Random.new
        return r.rand(1...9999999).to_s
    end

    def get_dpto
        r = Random.new
        return r.rand(1...9999).to_s
    end

    def get_telef_fijo
        return rand.to_s[2..11]
    end

    def get_celular
        return rand.to_s[2..11]
    end

end