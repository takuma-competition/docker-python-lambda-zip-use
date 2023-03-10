#ARM用のベースイメージ
#CPU（MACでM1・M2チップを使っている人）を使用している方向け
#FROM python:3.9@sha256:6e8eb4708e81141a9489a790a878621f8dd1196c790c9ab0d6ef80823f4c6314
#AMD用のベースイメージ
FROM python:3.9@sha256:93fb93c461a2e47a2176706fad1f39eaacd5dd40e19c0b018699a28c03eb2e2a
USER root

RUN apt-get update
RUN apt-get -y install locales && \
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt-get install -y vim less \
  && pip install --upgrade pip \
  && pip install --upgrade setuptools \
  && apt install -y zip

# pip で requirements.txt に指定されているパッケージを追加する
COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt
