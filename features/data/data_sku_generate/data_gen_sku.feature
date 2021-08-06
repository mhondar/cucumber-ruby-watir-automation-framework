@sku_cluster_json 
Feature: Clusterizacion de SKUs desde json

    Scenario: Clusterizacion de SKUs preprod
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CLUSTER"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        Then Clusterizacion de SKU por categorias "json"

    Scenario: Clusterizacion de SKUs staging
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "CLUSTER"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        Then Clusterizacion de SKU por categorias "json"