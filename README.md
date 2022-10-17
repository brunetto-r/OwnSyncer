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

# One time use with excluding problematic files
Start the containter interactively:

    docker run -it --name occlient \
        -e OC_USER=username \
        -e OC_PASS=password \
        -e OC_SERVER=192.168.0.20 \
        -v /big/folder:/mnt ocsync bash

Edit exclude.lst:

    echo petshop >> exclude.lst
    
Run one time with exclusions:

    owncloudcmd --user "$OC_USER" --password "$OC_PASS" --exclude exclude.lst /mnt "https://$OC_SERVER/owncloud/remote.php/webdav/"

# Sync directions

Tested:
    - Downloads files from remote
    - Uploads file to remote
    
Under test:
    - Deletes local file after deleted in remote
    - Deletes remote file after deleted locally

# Trableshooting

When the owncloud host is on the same machine then add the network to it:

    --network=host

When owncloud is part of domaint it is not in the path. It might be neccecarry to edit it to:

    https://$OC_SERVER/remote.php
