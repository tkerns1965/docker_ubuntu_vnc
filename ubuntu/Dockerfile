ARG UBUNTU_VERSION
FROM ubuntu:${UBUNTU_VERSION}
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901 \
    HOME=/docker
EXPOSE $VNC_PORT \
       $NO_VNC_PORT
RUN apt update && \
    apt install -y \
        fluxbox \
        gedit \
        wmctrl \
        x11vnc \
        xvfb && \
    apt clean
COPY fluxbox/* /docker/.fluxbox/
COPY bootstrap.sh /
RUN chmod u+x /bootstrap.sh
CMD '/bootstrap.sh'
