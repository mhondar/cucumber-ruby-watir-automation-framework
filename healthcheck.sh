#!/bin/bash

echo "........................................................."
echo "...............R I P L E Y T E C H ......................"
echo "........................................................."
echo "Chequeando si el HUB está listo para ejecutar las pruebas"
echo "........................................................."

# while [ "$(curl -s http://localhost:4444/wd/hub/status | jq -r .value.nodes[0].availability)" != "UP" ]
# do
#     sleep 3
# done

while ! curl -sSL "http://0.0.0.0:4444/wd/hub/status" 2>&1 \
        | jq -r '.value.ready' 2>&1 | grep "true" >/dev/null;
do
    echo 'Waiting for the Grid'
    sleep 3
done

# while ! curl -sSL "http://0.0.0.0:4444/wd/hub/status" 2>&1 \
#         | jq -r '.value.ready' 2>&1 | grep "true" >/dev/null; do
#     echo 'Waiting for the Grid'
#     sleep 3
# done

# # start the java command
cucumber -p wip_web_ch_remote