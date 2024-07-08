FROM python:3.11

RUN mkdir /backend
COPY . /backend
WORKDIR /backend
ENV PYTHONPATH=${PYTHONPATH}:${PWD} 

# Install dockerize
ENV DOCKERIZE_VERSION v0.6.1
RUN apt-get update && apt-get install -y wget && \
    wget https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz && \
    rm dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz

RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

COPY ./prestart.sh prestart.sh
COPY ./entrypoint.sh entrypoint.sh
RUN chmod +x ./prestart.sh ./entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["./entrypoint.sh"]