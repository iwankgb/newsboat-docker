Newsboat image
==============

I use this image to run [Newsboat](https://newsboat.org/). It is built automatically on [https://quay.io/repository/iwankgb/newsboat-docker](https://quay.io/repository/iwankgb/newsboat-docker).

To run:
````bash
docker run --env=USERNAME=`id -un` --env=USERID=`id -u` --env=GROUPID=`id -g` -ti -v ~/.newsboat:/home/`id -un`/.newsboat quay.io/iwankgb/newsboat-docker
````
