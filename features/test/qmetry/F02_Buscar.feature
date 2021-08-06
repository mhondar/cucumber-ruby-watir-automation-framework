Feature: F02 Caja de Busqueda


    Scenario: TC01 Validar al buscar SKU existente se muestre ficha del producto BLA BLA
        Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_TEST_QMETRY_01"
        And Verifico se muestre Home princi++pal
        When Busco producto "Prod Ripley"
        Then Verifico que se muestren resultados de la busqueda ingresada "Sku"

# @storykey=RTAP-1748
#     Scenario: TC02 Validar al buscar SKU existente se muestre ficha del producto (FALLO)
#         Given Abro la pagina de ripley en ambiente "prd" de "cl" "SIMPLE_TEST_QMETRY_02"
#         And Verifico se muestre Home principal
#         When Busco producto "1146378246823746"
#         Then Verifico que se muestren resultados de la busqueda ingresada "Sku"