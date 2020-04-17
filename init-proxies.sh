#!/bin/bash
BASE=$1
mkdir -p "$BASE/conf.d"
while read LINE; do
    ITEMS=($LINE)
    SOURCE=${ITEMS[0]}
    TARGET=${ITEMS[1]}
    cat > "$BASE/conf.d/$SOURCE.conf" <<- EOM
<VirtualHost *:80>
   ServerName ${SOURCE}
   ProxyPass        "/" "${TARGET}"
   ProxyPassReverse "/" "${TARGET}"
   AddOutputFilterByType INFLATE;SUBSTITUTE;DEFLATE application/x-javascript
   Substitute "s/assets.adobedtm.com/${SOURCE}/q"
</VirtualHost>
EOM
done < "$BASE/proxy_map.txt"