ARG CADDY_VERSION

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
	--with github.com/caddy-dns/porkbun

FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy