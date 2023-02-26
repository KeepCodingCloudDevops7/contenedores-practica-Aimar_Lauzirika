FROM python:3.7-alpine as compile
RUN apk add --no-cache gcc musl-dev linux-headers curl mysql-client mysql-dev

WORKDIR /app
COPY requirements.txt ./

RUN pip install --prefix=/install -r requirements.txt


FROM python:3.7-alpine
RUN apk add --no-cache mysql-dev

COPY --from=compile /install /usr/local

WORKDIR /app
COPY app.py ./

ENV FLASK_APP=app.py
ENV FLASK_ENV=development
ENV FLASK_RUN_HOST=0.0.0.0

ENV MYSQL_USER=user1
ENV MYSQL_PASSWORD=4321
ENV MYSQL_HOST=db
ENV MYSQL_DATABASE=counter_db

EXPOSE 5005

CMD ["flask", "run"]