ARG UBUNTU_VERSION
FROM ubuntu:${UBUNTU_VERSION}
ENV DEBIAN_FRONTEND=noninteractive \
    TERM=xterm \
    DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901 \
    HOME=/docker
EXPOSE $VNC_PORT \
       $NO_VNC_PORT
RUN apt update && \
    apt install -y \
        fluxbox \
        wmctrl \
        x11vnc \
        xvfb && \
    apt clean
RUN apt install -y \
        gedit
RUN apt install -y \
        net-tools \
        python \
        wget && \
    mkdir -p $HOME/noVNC/utils/websockify && \
    wget -qO- https://github.com/novnc/noVNC/archive/v0.6.2.tar.gz | tar xz --strip 1 -C $HOME/noVNC && \
    wget -qO- https://github.com/novnc/websockify/archive/v0.6.1.tar.gz | \
        tar xz --strip 1 -C $HOME/noVNC/utils/websockify && \
    chmod +x -v $HOME/noVNC/utils/*.sh && \
    ln -s $HOME/noVNC/vnc_auto.html $HOME/noVNC/index.html
RUN apt install -y \
        autoconf \
        automake \
        autotools-dev \
        cmake \
        google-mock \
        gtk+3.0 \
        guile-2.0 \
        guile-2.0-dev \
        icu-devtools \
        intltool \
        libboost-all-dev \
        libdbi-dev \
        libglib2.0-dev \
        libgtest-dev \
        libgtk-3-dev \
        libicu-dev \
        libltdl-dev \
        libsigsegv2 \
        libtool \
        libwebkit2gtk-4.0-37 \
        libwebkit2gtk-4.0-dev \
        libxml++2.6-dev \
        libxslt1-dev \
        m4 \
        swig2.0 \
        texinfo \
        xsltproc && \
    mkdir -p $HOME/gnucash_source && \
    wget -qO- https://sourceforge.net/projects/gnucash/files/gnucash%20%28stable%29/2.6.19/gnucash-2.6.19.tar.gz | \
        tar xz --strip 1 -C / && \
    mkdir build-cmake && \
    cd build-cmake && \
    cmake -D CMAKE_INSTALL_PREFIX=<target>/gnucash-cmake -D WITH_AQBANKING=OFF -D WITH_OFX=OFF ../gnucash && \
    make && \
    make install
COPY fluxbox/* /docker/.fluxbox/
COPY bootstrap.sh /
RUN chmod u+x /bootstrap.sh
CMD '/bootstrap.sh'
