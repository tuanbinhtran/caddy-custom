ARG CADDY_VERSION=NULL

RUN test -n "$CADDY_VERSION"

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
	--with github.com/caddy-dns/duckdns

FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy