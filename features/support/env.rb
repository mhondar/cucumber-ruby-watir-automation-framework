require 'rubygems'
require 'watir'
# require 'watir-webdriver'
# require 'webdrivers'
require 'yaml'
require 'fileutils'
require 'json'
require 'watir-scroll'
require 'csv'
require 'webdriver-user-agent'
require 'net/http'
require 'open-uri'
require 'uri'
require 'statsd-ruby'
require 'time'
require 'base64'
require 'report_builder'
require 'headless'
require './features/tools/Tools.rb'
require './features/data/database/Log.rb'
require './features/data/database/Persona.rb'
require './features/data/database/Direccion.rb'
require './features/data/database/Producto.rb'
require 'aws-sdk-s3'
require 'rest-client'
# require "chromedriver-helper"
# require 'active_support'

# require 'win32/sound'
# include Win32

Before do
    init_global_var
    $driver = get_driver
    $driver.cookies.clear
    Watir.default_timeout = 60
    if ENV['DEVICE']== "web"
        $driver.driver.manage.window.maximize
    end
    
end

After do |scenario|
    $tools = Tools.new
    if scenario.failed?
        $tools.salvar_pantalla("Fail", "features/screenshots/fails/")
        $log.set_resultado("Fail")
        if $log.get_detalle_resultado == "Nil"
            $log.set_detalle_resultado("Se desconoce causa de Fallo")
        end
        if $imagenes
            atash_images
        end
    else 
        if($imagenes && $end)
            atash_images
        end
        $log.set_resultado("Pass")
        $log.set_detalle_resultado("Caso de Prueba Exitoso")
        $tools.salvar_pantalla('Pass', 'features/screenshots/pass/')
    end
    $tools.salvar_pantalla("End", "features/screenshots/fin_script/")
    $log.save_log_ejecucion
    if ENV['CLOSE'] == "true"
        $driver.close
    end

end

at_exit do
    puts "Exit"
    puts ENV['REPORT']
    if ENV['REPORT'] == "true"
        puts "Reporte"
        generar_report_builder
        FileUtils.rm_rf(Dir.glob('features/reports/json/*'))
        if ENV['QMETRY'] == "true"
            upload_qmetry_result
        end
    end  
    # CSV.open("features/logs/log.csv", "a+") do |csv|
    #     csv << [ ]
    # end

    # Sound.play("SystemExit", Sound::ALIAS) # play system asterisk sound
end

def atash_images
    encoded_img = $driver.screenshot.base64
    embed("data:image/png;base64,#{encoded_img}",'image/png')
    # work with windows
    # encoded_img = $driver.driver.screenshot_as(:base64)
    # embed(encoded_img,'image/png;base64')
end

def generar_report_builder
    puts "Generar Report Builder"
    unless File.directory?('features/reports/report_builder')
        FileUtils.mkdir_p('features/reports/report_builder')
    end 
    tiempo = DateTime.now.to_s.gsub(':', '_')
    $report_name = 'report_builder_' + $proyecto + '_' + $navegador + '_' + $device + '_' + tiempo
    ReportBuilder.input_path = 'features/reports/json'
    ReportBuilder.configure do |config|
        config.report_path = 'features/reports/report_builder/' + $report_name
        config.report_types = [:json, :html]
        config.report_title = 'Reporte de Pruebas Automatizadas ' + $proyecto
        config.additional_info = {browser: $navegador, environment: $ambiente}
        config.include_images = true
        config.color = 'purple'
      end
      ReportBuilder.build_report
#     cargar_reporte_s3(tiempo)
end

def cargar_reporte_s3(tiempo)    
    # s3 = Aws::S3::Client.new(
    #     access_key_id: 'AKIA46C2OLVALSB6QV5U',
    #     secret_access_key: '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'
    #   )
    s3 = Aws::S3::Resource.new(region:'us-east-1')
    obj = s3.bucket('cucumber-rap-automation').object('Reportes/'+ $proyecto +'/' + $report_name + '.html')
    obj.upload_file( 'features/reports/report_builder/' + $report_name  + '.html')
    puts 'features/reports/report_builder/' + $report_name + '.html'

    obj = s3.bucket('cucumber-rap-automation').object('Reportes/'+ $proyecto +'/' + $report_name + '.json')
    obj.upload_file( 'features/reports/report_builder/' + $report_name + '.json')
    puts 'features/reports/report_builder/' + $report_name + '.json'
end


def init_global_var
    $tools = Tools.new                        #objeto de herramientas comunes
    $log = Log.new
    $name = "Nil"
    $ambiente = "Nil"
    $pais = "Nil"
    $mobile = false
    $tablet = false
    $mkp = false
    $lista_productos = Array.new
    $imagenes = ENV['ATTACH']
    $reporte = ENV['REPORT']
    $proyecto = ENV['PROJECT']
    $screenshots = ENV['SCREENSHOT']
    $transaccion_completa = true
    $invitado_nuevo = false
    $end = false
    $tools.ask_and_crear_directorio("features/reports/json")
    $tools.ask_and_crear_directorio("features/reports/report_builder")
   # $tools.ask_and_crear_directorio("features/reports/report_builder")
end

def get_driver
  $navegador = ENV['BROWSER']
  $device = ENV['DEVICE']
  $log.set_navegador($navegador)
  $log.set_formato($device)
  case $device
      when "web"
          case $navegador
          when "safari"
              return  Watir::Browser.new :safari, technology_preview: true
          when "firefox"
              return  Watir::Browser.new :firefox
          when "chrome"
              return  Watir::Browser.new :chrome , options: {options: {detach: true}}
          when "ie"
              return  Watir::Browser.new :ie
          when "headless"
            # return Watir::Browser.new :chrome, headless: true
            return Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --disable-notifications --start-maximized --disable-gpu --headless]
            # return Watir::Browser.new(:chrome, {:chromeOptions => {:args => ['--headless', '--window-size=1200x600']}})
          when "RemoteFirefox" 
            return Watir::Browser.new :firefox, {takesScreenshot: true, acceptInsecureCerts: false , timeout: 120, url: "http://0.0.0.0:4444/wd/hub"}
          when "RemoteChrome"
            return  Watir::Browser.new :chrome, {takesScreenshot: true, acceptInsecureCerts: false , timeout: 120, url: "http://0.0.0.0:4444/wd/hub"} 
        end

      when "mobile"
        equipo = ENV['AGENT']
          $mobile = true
          case $navegador
          when "firefox"
              case equipo
                when "iphone"
                    user_agent = Webdriver::UserAgent.driver(browser: :firefox, agent: :iphone, orientation: :portrait)
                when "android_phone"
                    user_agent = Webdriver::UserAgent.driver(browser: :firefox, agent: :android_phone, orientation: :portrait)
              end
          when "chrome"
              case equipo
                when "iphone"
                    user_agent = Webdriver::UserAgent.driver(browser: :chrome, agent: :iphone, orientation: :portrait)
                when "android_phone"
                    user_agent = Webdriver::UserAgent.driver(browser: :chrome, agent: :android_phone, orientation: :portrait)
              end
          end

    when "tablet"
        $tablet = true
        case $navegador
            when "firefox"
                case equipo
                    when "ipad"
                        user_agent = Webdriver::UserAgent.driver(browser: :firefox, agent: :ipad, orientation: :portrait)
                    when "android_tablet"
                        user_agent = Webdriver::UserAgent.driver(browser: :firefox, agent: :android_tablet, orientation: :portrait)
                end
            when "chrome"
                case equipo
                    when "ipad"
                        user_agent = Webdriver::UserAgent.driver(browser: :chrome, agent: :ipad, orientation: :portrait)
                    when "android_tablet"
                        user_agent = Webdriver::UserAgent.driver(browser: :chrome, agent: :android_tablet, orientation: :portrait)
                end
        end
    end
    $log.set_navegador($navegador)
    return Watir::Browser.new user_agent
end

def cargaVariableEnviroment
    puts ENV['ENVIROMENT']
    if ENV['ENVIROMENT'].nil?
        case $ambiente
        when "prd", "prd_pe", "micuenta_prd"
            environment = "PRD"
        else
            environment = "QA"
        end 
    else
        environment = ENV['ENVIROMENT']
    end
    return environment
end

def cargaPais
    case $pais
    when "cl"
        return "CHILE"
    when "pe"
        return "PERU"
    end
end

def cargaJson
    environment = cargaVariableEnviroment()
    if !ENV['SPRINT'].nil?
        sprint = ENV['SPRINT']
    else
        sprint = ""
    end
    summary = "Test Cycle Automático para " + $proyecto + " SPRINT: " + sprint
    if !ENV['TESTCYCLE'].nil?
        testCycle = ENV['TESTCYCLE']
    end
    data = {  
        "format":"CUCUMBER",
        "testCycleToReuse":testCycle,
        "attachFile":true,
        "isZip":false,
        "environment":environment,
        "build":"1",
        "fields":{  
        "testCycle":{  
            "labels":[
                cargaPais
            ],
            "components":[],
            "priority":"High",
            "status":"In Progress",
            "summary":summary,
            "customFields": [
                {
                    "name": "BROWSER",
                    "value": ENV['BROWSER'].upcase
                },
                {
                    "name": "DEVICE",
                    "value": ENV['DEVICE'].upcase   
                }
            ]
        },
        "testCase":{  
            "labels":[],
            "components":[],
            "priority":"High",
            "status":"In Progress"
        }
    }
}
puts data.to_json
    return data
end

def cargar_ejecutor
    selector = JSON.parse(File.read("./features/data/perfilqmetry.json"))
    if !ENV['EJECUTOR'].nil?
        ejecutor = selector[ENV['BOARD']][ENV['EJECUTOR']]
    else
        ejecutor = selector[ENV['BOARD']]['mhondarm']
    end
    return ejecutor
end

def upload_qmetry_result 
    ejecutor = cargar_ejecutor

    puts "------------Step 1 POST Request-------------"

    url = "https://qtmcloud.qmetry.com/rest/api/automation/importresult"

    header = {
            'Content-Type': 'application/json', 
            'apiKey': ejecutor
        }

    puts header.to_json

    data= cargaJson()

    post_request = RestClient.post url, data.to_json, header
    puts post_request.code

    case post_request.code
    when 200
        url_step2 = JSON.parse(post_request.body)["url"]
        trackingId_step3 = JSON.parse(post_request.body)["trackingId"]
    else
        fail("Error en el Post Request")
    end

    puts "------------Step 2 PUT Request-------------"
    sleep 5
    json_file = './features/reports/report_builder/' + $report_name + '.json'

    cucumber_report = File.open(json_file)

    header_2 = {
        'Content-Type': 'multipart/form-data', 
        'apiKey': ejecutor
    }

    put_request = RestClient.put url_step2, cucumber_report, header_2
    puts put_request.code

    puts "------------Step 3 GET Request-------------"
    sleep 5
    url_step3 = 'https://qtmcloud.qmetry.com/rest/api/automation/importresult/track?trackingId=' + trackingId_step3

    get_request = RestClient.get(url_step3, header)

    puts get_request.code
    case get_request.code
    when 200
        respuesta_final = JSON.parse(get_request.body)
        puts respuesta_final["importStatus"]
    end
end
