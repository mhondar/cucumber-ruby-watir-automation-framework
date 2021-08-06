@sku_cluster_txt 
Feature: Clusterizacion de SKUs desde txt

    Scenario: Clusterizacion de SKUs preprod
        Given Abro la pagina de ripley en ambiente "preprod" de "cl" "CLUSTER"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        Then Clusterizacion de SKU por categorias "txt"

    Scenario: Clusterizacion de SKUs preprod
        Given Abro la pagina de ripley en ambiente "staging" de "cl" "CLUSTER"
        When Realizo login con las credenciales "tarjeta_credito"
        Then Verifico login exitoso
        Then Clusterizacion de SKU por categorias "txt"