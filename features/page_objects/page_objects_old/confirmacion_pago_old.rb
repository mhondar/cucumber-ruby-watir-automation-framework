class ConfirmacionPageold
    def initialize
        selectors = JSON.parse(File.read("./features/selectors/selectors_old/confirmacion_selectors_old.json"))
        @title_conf = $driver.element(xpath: selectors["title_conf"])
        @chk_terminosycondiciones= $driver.element(xpath: selectors["terminosycondiciones"])
        @btn_confirmarycomprar = $driver.element(xpath: selectors["confirmarycomprar"])
    
    end

    
    def verificar_pagina_confirmacion_presente
        begin
            $tools.esperar_elemento(@title_conf)
            puts "Pagina de Confirmacion visible"
        rescue
            $tools.fallo("Problemas al cargar pagina de confirmacion")
        end
    end

    def click_aceptar_terminos
        begin
            $tools.click(@chk_terminosycondiciones)
            puts "Se aceptan terminos y condiciones"
        rescue
            $tools.fallo("Problemas al cargar pagina de confirmacion")
        end
    end

    def click_Continuar
        begin
            $tools.click(@btn_confirmarycomprar)
            puts "Continuar con Pago"
        rescue
            $tools.fallo("Problemas al cargar pagina de confirmacion")
        end
    end

end