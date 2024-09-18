FROM python:3.11
ENV PYTHONUNBUFFERED 1

RUN apt-get update \
    && apt-get install -y default-mysql-client \
    && apt-get install -y python3-venv

RUN pip3 install mysql-connector mysqlclient

RUN mkdir /code
WORKDIR /code

COPY requirements.txt /code/

RUN pip3 install -r requirements.txt

COPY . /code/
