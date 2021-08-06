When("Verifico Estado de la Compra en SGO") do
    @sgo = SgoPage.new
    @sgo.validar_estado_reserva
end