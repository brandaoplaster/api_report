FROM elixir:1.13.4-alpine as builder

WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force

COPY . .

RUN mix do deps.get, deps.compile

FROM scratch

COPY --from=builder /app .

CMD ["sh", "./start.sh"]
