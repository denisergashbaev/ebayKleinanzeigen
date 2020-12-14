FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y install wget bash zip rsync python3.6 python3-pip build-essential
RUN python3 -m pip install --upgrade pip==20.3.1

# [Optional] If your pip requirements rarely change, uncomment this section to add them to the image.
COPY src/requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp/requirements.txt

RUN apt -y install firefox
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz \
    && tar xzf geckodriver-v0.26.0-linux64.tar.gz && rm geckodriver-v0.26.0-linux64.tar.gz \
    && mv geckodriver /usr/bin/geckodriver