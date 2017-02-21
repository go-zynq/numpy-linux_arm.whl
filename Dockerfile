FROM hypriot/rpi-alpine
RUN apk add --no-cache --update --virtual=build-dependencies \
  curl \
  gcc \
  make \
  musl-dev \
  python3-dev \
  ;
RUN \
  python3 -m pip --no-cache-dir install wheel \
  && (cd /usr/include && ln -s locale.h xlocale.h) \
  ;

CMD \
  python3 -m pip install numpy \
  && python3 -m pip wheel numpy \
  ;
