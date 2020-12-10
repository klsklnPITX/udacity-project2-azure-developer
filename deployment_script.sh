az group create \
-n udac-prj-2-rg \
--location eastus

az storage account create \
-n udacprj2storacc3565 \
-g udac-prj-2-rg \
--location eastus

az functionapp create \
-g udac-prj-2-rg \
-n udacprj2funcapp \
--storage-account udacprj2storacc3565 \
--os-type Linux \
--consumption-plan-location eastus \
--runtime python

az cosmosdb create \
-n kkcosmosaccprj2 \
-g udac-prj-2-rg \
--locations regionName=eastus failoverPriority=0 isZoneRedundant=False \
--kind mongodb

az cosmosdb keys list \
-n kkcosmosaccprj2 \
-g udac-prj-2-rg \
--type connection-strings

az cosmosdb database create \
-n kkcosmosaccprj2 \
--db-name udacprj2-db \
--key {INSERT COSMOSDB PRIMARY PW} \
-g udac-prj-2-rg

az cosmosdb collection create \
-g udac-prj-2-rg \
--collection-name advertisements \
--name kkcosmosaccprj2 \
--db-name udacprj2-db \
--throughput 400

az cosmosdb collection create \
-g udac-prj-2-rg \
--collection-name posts \
--name kkcosmosaccprj2 \
--db-name udacprj2-db \
--throughput 400

az acr create \
-g udac-prj-2-rg \
-n udacprj2contregistry \
--sku Basic

az aks create \
--name udacprj2akscluster \
-g udac-prj-2-rg \
--node-count 2 \
--generate-ssh-keys

az aks get-credentials \
-n udacprj2akscluster \
-g udac-prj-2-rg
