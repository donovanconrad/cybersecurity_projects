#!/bin/bash

sudo falco service stop #if installed locally on Linux as a non-container
docker container rm falco
# docker pull falcosecurity/falco
# docker run -i -t \
#     --name falco \
#     --privileged \
#     -v /var/run/docker.sock:/host/var/run/docker.sock \
#     -v /dev:/host/dev \
#     -v /proc:/host/proc:ro \
#     -v /boot:/host/boot:ro \
#     -v /lib/modules:/host/lib/modules:ro \
#     -v /usr:/host/usr:ro \
#     falcosecurity/falco

docker run \
  --interactive \
  --privileged \
  --tty \
  --name falco \
  --volume /var/run/docker.sock:/host/var/run/docker.sock \
  --volume /dev:/host/dev \
  --volume /proc:/host/proc:ro \
  --volume /boot:/host/boot:ro \
  --volume /lib/modules:/host/lib/modules:ro \
  --volume /usr:/host/usr:ro \
  falcosecurity/falco:0.19.0
  