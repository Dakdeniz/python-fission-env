FROM ubuntu:20.04

WORKDIR /app

RUN apt-get update -y && \
    apt-get install --no-install-recommends --yes python3-pip python3-dev libffi-dev libev-dev gcc && \
    pip3 install --upgrade pip 

RUN python3 -m pip install --upgrade pip setuptools wheel && pip install bjoern
COPY ./requirements.txt /app

RUN pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python3" ]

CMD ["server.py"]
