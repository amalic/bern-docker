#!/bin/sh

cd GNormPlusJava/
nohup java -Xmx16G -Xms16G -jar GNormPlusServer.jar 18895 2>&1 &
cd ../tmVarJava
nohup java -Xmx8G -Xms8G -jar tmVar2Server.jar 18896 2>&1 &
cd ..

sh load_dicts.sh

python3 -u server.py --port 8888 --gnormplus_home /app/GNormPlusJava --gnormplus_port 18895 --tmvar2_home /app/tmVarJava --tmvar2_port 18896