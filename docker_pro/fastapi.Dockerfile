FROM tiangolo/uvicorn-gunicorn:python3.11

LABEL maintainer="Viney Vean <viney.vean@gmail.com>"

# Set environment variables
ENV UVICORN_CMD="uvicorn main:app --host 0.0.0.0 --port 80 --workers 4"
ENV GUNICORN_CMD="gunicorn -k uvicorn.workers.UvicornWorker -w 4 main:app -b 0.0.0.0:80"
ENV MODULE_NAME=main
ENV VARIABLE_NAME=app
ENV ASGI_SERVER=uvicorn

# Copy requirements.txt and .env to /tmp directory
COPY ../requirements/fastapi/requirements.txt /tmp/requirements.txt
COPY ../requirements/fastapi/.env /tmp/.env

RUN pip install --no-cache-dir -r /tmp/requirements.txt

COPY ../app /app
