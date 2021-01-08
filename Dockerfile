# no "official" Lua images, OpenResty is as close as it gets
FROM openresty/openresty:1.19.3.1-2-alpine-fat

WORKDIR /usr/src/app

RUN luarocks install luacheck && luarocks install busted
