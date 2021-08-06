Then(/^Guardo dato de prueba listo "([^"]*)" "([^"]*)"$/) do |caso, rut|
    $tools.salvar_dato_prueba(caso, rut)
  end

When(/^Guardo dato de prueba listo en el log "([^"]*)"$/) do |caso|
    $tools.salvar_dato_prueba(caso, $log.get_rut)
end

When("Guardo dato de prueba en medios de pago {string} {string}") do |caso, medio|
    $tools.salvar_dato_prueba_medio(caso, medio)
end

When("Cambio el foco a pestaña nueva") do 
    $driver.window(index: 1).use
end





