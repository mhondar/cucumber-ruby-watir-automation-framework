class MedioPago
    def initialize(tipo, rut, tarjeta)
        @mediopago = {"tipo" => tipo, 
                    "rut" => rut, 
                    "tarjeta" => tarjeta, 
                    "doc_tributario" => "",
                    "correo" => ""
                }
    end

    def set_tipo tipo
        @mediopago["tipo"] = tipo
    end

    def set_rut rut
        @mediopago["rut"] = rut
    end

    def set_tarjeta tarjeta
        @mediopago["tarjeta"] = tarjeta
    end

    def set_doc_tributario documento
        @mediopago["doc_tributario"] = documento
    end

    def set_correo correo
        @mediopago["correo"] = correo
    end

    def get_data
        return @mediopago
    end
end