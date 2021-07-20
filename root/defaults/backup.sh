#!/usr/bin/with-contenv bash

# restic -r <destination> --verbose backup /data --password-file=/config/password.txt --tag <tag>
# restic -r <destination> --verbose forget --keep-weekly 3 --keep-monthly 3 --keep-yearly 3 --password-file=/config/password.txt --prune --tag <tag>
