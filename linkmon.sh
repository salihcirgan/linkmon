#!/bin/sh

if [ $# -ne 1 ]

then
      curl -s -L -k -c fgt.txt -d username=myusername -d secretkey=password "http://FGTIP/logincheck" > /dev/null
      MON=`curl -s -k --cookie fgt.txt "http://FGTIP/p/system/link-monitor/get/" | jq .source[0].state`

if [ "$MON" -ne 1 ]

  then

    echo "2:$MON:"$MON" VPN Link IPSEC Down"
    curl -s -k --cookie fgt.txt "http://FGTIP/logout" > /dev/null
    rm -f fgt.txt > /dev/null
  else

    echo "0:$MON:"$MON" VPN Link Health OK"
    curl -s -k --cookie fgt.txt "http://FGTIP/logout" > /dev/null
    rm -f fgt.txt > /dev/null
  fi

else

  echo '1:Unknown:Unknown error

fi
