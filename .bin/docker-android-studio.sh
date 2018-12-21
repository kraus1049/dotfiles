docker run -it \
  --privileged \
  -v `pwd`/AndroidStudioProjects:/home/ubuntu/AndroidStudioProjects \
  -v `pwd`/.android:/home/ubuntu/.android \
  -v `pwd`/.AndroidStudio3.1:/home/ubuntu/.AndroidStudio3.1 \
  -v `pwd`/.gradle:/home/ubuntu/.gradle \
  -v `pwd`/opt:/opt/android-sdk \
  -v /dev/bus/usb:/dev/bus/usb \
  -v /dev/kvm:/dev/kvm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $XAUTHORITY:/home/ubuntu/.Xauthority \
  --net host \
  android-studio
