# logrotate
alpine linux logrotate docker build

# purpose
this container is built to be used as a sidecar container for handling
log rotations as part of the samsung_cnct central logging project.  this
container will be used by the per-node log aggregator to handle node-level
log rotatations.  

# entrypoint
the script `load-and-sleep.sh` will load logrotate's execution script into
the 15 minute periodic run folder.  the execution script is
`/run-logrotate` and contains a call to execute logrotate
with the below config file.  

# config
the config file is landed at `/logrotate.conf`.  If you wish to override it,
land a new config to the same spot.  the config assumes all log files are
being landed at `/var/log/containers/*` where the final wildcard is the pod unique
identifier.  logrotate does not have a recursive option, so currently this
will go two levels deep looking for logs
