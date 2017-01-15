# Transmission for Docker
This image (like all other of my images) is created to run on Synology Docker. I've tried to keep the images clean (so proper config volumes and always the same external volumes).

Image is based on Ubuntu 16.04 LTS.

### Volumes
- /config
- /volumes/incomplete
- /volumes/complete
- /volumes/watch

(Volumes are hardcoded into CMD, so can't be changed through Transmission config file.)

### Ports
- 9091
- 51414/tcp
- 51414/udp

(Port 51414 can be set/changed in Transmission config file.)

### Run
Image can be run as follows:
```
docker run --name transmission \
    -p 9091:9091 \
    -p 51414:51414/tcp \
    -p 51414:51414/udp \
    -v <your directory>:/config \
    -v <your directory>:/volumes/incomplete \
    -v <your directory>:/volumes/complete \
    -v <your directory>:/volumes/watch \
    connorxxl/transmission
```
