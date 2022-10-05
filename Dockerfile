# ------------------------------------------------------------------------------
# Base image
# ------------------------------------------------------------------------------
FROM python:3.8-slim AS base

# ------------------------------------------------------------------------------
# Install prerequisite
# ------------------------------------------------------------------------------
FROM base AS deps

WORKDIR /usr/src/app
COPY ./requirements.txt /usr/src/app
RUN python -m venv .venv; \
    .venv/bin/pip install -r requirements.txt

# ------------------------------------------------------------------------------
# Final stage
# ------------------------------------------------------------------------------
FROM base AS transformer
WORKDIR /usr/src/app
ENV PATH="/usr/src/app/.venv/bin:${PATH}"

COPY --from=deps /usr/src/app/.venv /usr/src/app/.venv
COPY . /usr/src/app/

CMD ["python", "-m", "app.main"]
