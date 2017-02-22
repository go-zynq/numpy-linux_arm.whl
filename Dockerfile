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
ENV \
  NUMPY_VERSION="1.12.0"
CMD \
  python3 -m pip install numpy==${NUMPY_VERSION} \
  && python3 -m pip wheel numpy \
  ;
