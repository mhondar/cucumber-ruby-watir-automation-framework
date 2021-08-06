require './features/tools/Tools.rb'

class MiCuentaMisCompras
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/mi_cuenta/micuenta_miscompras_selectors.json"))
        # barra izquierda
        @title = $driver.element(xpath:@selectors["title"])
        @title_new = $driver.element(xpath:@selectors["title_new"])
        @list_ordenes = $driver.elements(xpath: @selectors["list_miscompras"])
        @loading_screen = $driver.element(xpath:@selectors["loading"])
        @SeguirCompra = $driver.element(xpath:@selectors["SeguirCompra"])
        @ValidacionTraking = $driver.element(xpath:@selectors["ValidacionTraking"])
        @form_report_inconveniente = $driver.element(xpath:@selectors["form_report_inconveniente"])
        @compras_realizadas = $driver.element(xpath:@selectors["opc_compras_realizadas"])
    end

    def click_reportar_inconveniente
        sleep 5
        @btn_reportar_inconveniente = $driver.element(xpath: '//h4[contains(text(), "Comoda")]/parent::div/parent::div/parent::div/parent::div/following-sibling::div/div/div/div/div/div/div//div/a/button[@type="button"]')
        $tools.esperar_elemento(@btn_reportar_inconveniente)
        if @btn_reportar_inconveniente.present?        
            $tools.click(@btn_reportar_inconveniente)
        else
            $tools.fallo("No se encuentra boton reportar Inconveniente")
        end
    end

        
    def validar_formulario_reportar_inconveniente               
        # $tools.realiza_cambio_foco_pestana

        begin
            $tools.esperar_elemento(@form_report_inconveniente)
        rescue
            $tools.fallo("No se muestra formulario de Reportar inconveniente")
        end
    end


    def validar_tracking
        begin
            $tools.esperar_elemento(@ValidacionTraking)
        rescue 
            $tools.fallo("No se muestra tracking")
        end
    end

    def click_seguir_Compra
        $tools.click(@SeguirCompra)
    end

    def validarListadoCompras
        sleep 2
        
        begin
            $tools.esperar_elemento(@SeguirCompra)
        rescue
            $tools.fallo("No se muestra Listado de Compras")
        end
        sleep 1
        cantidaCompras= @list_ordenes.count
        if cantidaCompras == 0
            $tools.fallo("No se muestra la lista de compras")  
        end
     end

    def verificar_pagina(compras)
        if $ambiente == "micuenta_qa"
            sleep 1
            $driver.refresh
        end
        case compras
        when "Sin Compras"
            begin
                $tools.esperar_elemento(@title_new)
            rescue
                $tools.fallo("No se muestra la pagina de Compras sin compras realizadas")  
            end
        when "Con Compras"
            begin
                $tools.esperar_elemento(@title)
            rescue
                $tools.fallo("No se muestra la pagina de Compras con compras realizadas")  
            end
        end
    end

    def esperar_end_loading
        timeout = 0
        while(!@loading_screen.present? && (timeout < 60))
            sleep 2
            timeout += 1
        end
    end
end