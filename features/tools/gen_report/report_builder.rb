# require 'report_builder'
# require 'time'

# puts "Generar Report Builder"
# ReportBuilder.input_path = 'features/reports/json'
# tiempo = DateTime.now.to_s.gsub(':', '_')
# ReportBuilder.configure do |config|
#     config.report_path = 'features/reports/report_builder/report_builder_' + tiempo
#     config.report_types = [:json, :html]
#     config.report_title = 'Reporte de Pruebas Automatizadas' 
#     config.additional_info = {browser: "Firefox", environment: "preprod"}
#     config.include_images = true
#     config.color = 'purple'
#   end
#   ReportBuilder.build_report