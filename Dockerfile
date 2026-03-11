FROM ghcr.io/astral-sh/uv:bookworm-slim

RUN apt-get update && apt-get install -y gcc python3-dev && rm -rf /var/lib/apt/lists/*

ADD . /app
WORKDIR /app
RUN uv sync --locked

EXPOSE 8082

CMD ["uv", "run", "start_proxy.py"]
