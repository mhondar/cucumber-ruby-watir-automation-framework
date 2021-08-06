require 'json'
class Persona
    def initialize
        @persona = {"nombre" => "", 
                    "apellido" => "", 
                    "rut" => "", 
                    "email" => "jolivaresc@ripley.com",
                    "password" => "1234",
                    "celular" => ""
                }
    end

    def generar_persona
        @persona["nombre"] = get_nombre()
        @persona["apellido"] = get_apellido()
        @persona["rut"] = get_rut()
        @persona["celular"] = get_celular
        return @persona
    end

    def get_celular
        return rand.to_s[2..11]
    end

    def get_nombre
        parse_json_nombre = JSON.parse(File.read('features/data/nombres.json'))
        return parse_json_nombre['nombres'].shuffle.first
    end

    def get_apellido
        parse_json_apellido = JSON.parse(File.read('features/data/apellidos.json'))
        return parse_json_apellido['apellidos'].shuffle.first
    end

    def get_rut
        case $pais
        when "cl"
            numero = concant_number
            dv = calcula_dv(numero)
            return "#{numero}#{dv}"
        when "pe"
            r = Random.new
            numero = r.rand(000...999).to_s
            return "12345" + numero
        end
    end

    def concant_number
        return "#{obtener_sum_number}#{random_num}"
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

end
