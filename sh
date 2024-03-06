FROM python:3.7

WORKDIR /tool

COPY . /tool

RUN apt-get update && \
    apt-get install -y gcc python3-dev && \
    apt-get install -y pip && \
    mkdir /tools && \
    pip install --upgrade pip setuptools wheel && \
    pip install flask virtualenv uwsgi && \
    virtualenv venv && \
    . ./venv/bin/activate && \
    cd /tools/ && \
    find / -name setup.py && \
    python -c "import flask; print(flask.__version__)"

EXPOSE 80

CMD ["uwsgi", "--ini", "app.ini"]

