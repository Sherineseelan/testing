FROM python:3.7

WORKDIR /tool

COPY . /tool

RUN apt-get update && \
    apt-get install -y gcc python3-dev && \
    pip install --upgrade wheel pip setuptools && \
    pip install -r requirements.txt && \
    python -c "import flask; print(flask.__version__)" && \
    pip install virtualenv uwsgi && \
    virtualenv venv && \
    . ./venv/bin/activate

EXPOSE 80

CMD ["uwsgi", "--ini", "app.ini"]

