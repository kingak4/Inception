FROM debian:12-slim

COPY ./setup.sh ./setup.sh

RUN ./setup.sh

CMD ["python3", "-c", "print('Hello Debian!')"]