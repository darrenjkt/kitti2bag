#!/bin/bash

docker run -it \
-v /home/darren/data/kitti:/data \
tomas789/kitti2bag \
-t 2011_09_26 \
-r 0093 raw_synced \