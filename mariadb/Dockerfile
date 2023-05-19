FROM debian:buster

RUN apt update -y && apt install mariadb-server -y

COPY ./tools/install.sh .

RUN chmod 777 install.sh

ENTRYPOINT [ "./install.sh" ]

CMD [ "mysqld" ]