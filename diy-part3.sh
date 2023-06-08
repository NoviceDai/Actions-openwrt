#!/bin/bash

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
# Modify Dropbear Welcome banner..

cat <<EOF >package/base-files/files/etc/banner
~>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 ___       _ __  _ _           
| . \ ___ <_>\ \/ <_> ___  ___ 
| | |<_> || | \ \ | |<_> |/ . \      ~~
|___/<___||_|_/\_\|_|<___|\___/    ()
----------------------------------------------------------
 %D %V, Compiled at $(date +'%Y.%m.%d-%H:%M') by Daixiao
----------------------------------------------------------
EOF

#END