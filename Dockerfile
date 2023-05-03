# RUN コンテナイメージ作成時に実行するシェルコマンドを設定
# ENTRYPOINT コンテナ実行の時に動かしたいシェルコマンドを指定(docker runの時に動く)
# COPY コンテナ側にファイルをコピーする (リモート上のファイルを扱えない)
# ADD コンテナ側にファイルを追加 (圧縮ファイルが自動で解凍される)
# UESR コンテナ側のユーザを変更
# ENV コンテナ側の環境変数を設定
# WORKDIR コンテナ側の作業ディレクトリを変更
FROM ubuntu:20.04
USER root

RUN apt update
RUN apt install -y python3.9
RUN apt install -y python3-pip

COPY requirements.txt .
RUN python3.9 -m pip install -r requirements.txt

ENV SITE_DOMAIN=sample.env.com

WORKDIR /var

COPY script.py .
ENTRYPOINT [ "python3.9", "script.py" ]