#!/usr/bin/with-contenv bash

# echo
# echo Backing up
# echo ##########
# echo
# curl -fsS --retry 3 https://hc-ping.com/<UUID>/start
# restic -r <destination> --verbose backup /data -H <hostname> --password-file=/config/password.txt --tag <tag>
# curl -fsS --retry 3 https://hc-ping.com/<UUID>/$?

# echo
# echo Prune repo
# echo ##########
# echo
# curl -fsS --retry 3 https://hc-ping.com/<UUID>/start
# restic -r <destination> --verbose forget --keep-weekly 3 --keep-monthly 3 --keep-yearly 3 --password-file=/config/password.txt --prune --tag <tag>
# curl -fsS --retry 3 https://hc-ping.com/<UUID>/$?
