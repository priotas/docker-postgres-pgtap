FROM postgres:10-alpine

RUN apk update \
    && apk add --no-cache --update build-base make perl perl-dev git openssl-dev \
    && rm -rf /var/cache/apk/* /tmp/*

 # install pg_prove
RUN cpan TAP::Parser::SourceHandler::pgTAP

# install pgtap
ENV PGTAP_VERSION v1.0.0
RUN git clone git://github.com/theory/pgtap.git \
    && cd pgtap && git checkout tags/$PGTAP_VERSION \
    && make \
    && make install

