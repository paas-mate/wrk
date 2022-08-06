FROM ttbb/base:goc AS compiler

RUN git clone --depth 1 https://github.com/wg/wrk.git && \
cd wrk && \
dnf install -y perl && \
make

FROM ttbb/base

COPY --from=compiler /opt/sh/wrk/wrk /usr/bin/wrk

WORKDIR /opt/sh
