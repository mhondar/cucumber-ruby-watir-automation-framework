# require 'net/http'
# require 'uri'
# require 'json'
# require 'rest-client'

# puts "------------Step 1 POST Request-------------"

# url = "https://qtmcloud.qmetry.com/rest/api/automation/importresult"
# header = {
#         'Content-Type': 'application/json', 
#         'apiKey': '5a5fd4b708170c4f4e75d4fdc59b4ce05ec818d1fa20ce4c87eb4433cbcab3cd3abb372cda4b80f10b1122bfac064addb5d48b08c5727c4af368106f34a98ea9095a8ea2dfc1eb37329a45efc57828ae'
#     }

#     data = {  
#         "format":"CUCUMBER",
#         "testCycleToReuse": "QCT-TR-4",
#         "attachFile":true,
#         "isZip":false,
#         "environment":"Production",
#         "build":"1",
#         "fields":{  
#         "testCycle":{  
#             "labels":[],
#             "components":[],
#             "priority":"High",
#             "status":"Done",
#             "summary":"Test Cycle Monitoreo Produccion"
#         },
#         "testCase":{  
#             "labels":[],
#             "components":[],
#             "priority":"High",
#             "status":"Done"
#         }
#         }
#     }

# post_request = RestClient.post url, data.to_json, header
# puts post_request.code

# case post_request.code
# when 200
#     url_step2 = JSON.parse(post_request.body)["url"]
#     trackingId_step3 = JSON.parse(post_request.body)["trackingId"]
# else
#     fail("Error en el Post Request")
# end

# puts "------------Step 2 PUT Request-------------"

# cucumber_report = File.open("./features/reports/report_builder/report_builder_MONITOREO_PRD_firefox_web_2020-06-03T19_45_39-04_00.json")

# header_2 = {
#     'Content-Type': 'multipart/form-data', 
#     'apiKey': '5a5fd4b708170c4f4e75d4fdc59b4ce05ec818d1fa20ce4c87eb4433cbcab3cd3abb372cda4b80f10b1122bfac064addb5d48b08c5727c4af368106f34a98ea9095a8ea2dfc1eb37329a45efc57828ae'
# }

# put_request = RestClient.put url_step2, cucumber_report, header_2

# puts put_request.code

# puts "------------Step 3 GET Request-------------"

# url_step3 = 'https://qtmcloud.qmetry.com/rest/api/automation/importresult/track?trackingId=' + trackingId_step3

# get_request = RestClient.get(url_step3, header)

# puts get_request.code
# case get_request.code
# when 200
#     respuesta_final = JSON.parse(get_request.body)
#     puts respuesta_final["processStatus"]
#     puts respuesta_final["importStatus"]
# end
