#stolen from here:
#https://github.com/ahmadnazir/dotfiles/blob/master/bash-scripts/vpn-status.sh

#!/bin/bash

ifconfig tun0 > /dev/null &&
   if [[ $? == 0 ]]
   then
       echo -e " <fc=#ff2052> VPN: connected</fc>"
   fi ||
       echo -e ""
