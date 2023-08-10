FROM debian:12

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y git make cmake
RUN apt-get install -y libboost-dev libwxgtk3.2-dev libwxgtk-media3.2-dev
RUN git clone --recursive https://github.com/wxFormBuilder/wxFormBuilder /root/wxFormBuilder

WORKDIR /root/wxFormBuilder

RUN cmake -S . -B _build -G "Unix Makefiles" --install-prefix "$PWD/_install" -DCMAKE_BUILD_TYPE=Release
RUN cmake --build _build --config Release -j `nproc`
RUN cmake --install _build --config Release

CMD ["/root/wxFormBuilder/_install/bin/wxformbuilder"]
