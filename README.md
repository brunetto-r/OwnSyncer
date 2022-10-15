# OwnSyncer

Owncloud client synchronizes all user folders in a loop.

Build the image with:

    docker build -t ocsync .

Create a container running the image:

    docker run --rm -d --name occlient \
        -e OC_USER=username \
        -e OC_PASS=password \
        -e OC_SERVER=192.168.0.20 \
        -v /big/folder:/mnt ocsync
      
I have now way of cheking when everything is done (for now).

Stop the image when syncyng is not needed anymore by:

    docker rm -f occlient
