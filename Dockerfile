#FROM ubuntu:20.04
#
#RUN apt update && apt install -y nginx
#CMD nginx -g 'daemon off;'


FROM python:3.10-slim

WORKDIR /code
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app.py .
COPY migrations migrations
COPY docker_config.py default_config.py

CMD flask run -h 0.0.0.0 -p 80
