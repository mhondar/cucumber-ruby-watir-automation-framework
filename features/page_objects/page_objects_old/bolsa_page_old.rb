class BolsaCompraPageOld
    def initialize 
        selectors = JSON.parse(File.read("./features/selectors/selectors_old/bolsa_selector__selectors_old.json"))
        @btn_continuar_compra = $driver.element(xpath: selectors["btn_continuar_compra"])
    end

    def click_continuar_compra
        # esperar_end_loading
        html_pre = $driver.html
        $tools.salvar_pantalla("Bolsa_old", "features/screenshots/bolsa_old/")
        $tools.click(@btn_continuar_compra)
        # esperar_end_loading
        html_post = $driver.html
        while html_pre == html_post
            puts "No se hizo click en Continuar, se reintentara"
            $tools.click(@btn_continuar_compra)
            # esperar_end_loading
            html_post = $driver.html
        end
    end

    def esperar_end_loading
        timeout = 0
        while(@loading_screen.present? && (timeout < 60))
            sleep 2
            timeout += 1
        end
    end
end    