# Django Development on Docker Environment

### Requirements

- Docker Engine > v1.12.0

### Intructions

1. Clone Repository (GitHub)

```
$ git clone https://github.com/makenjoy/django-devon-docker.git
```

2. Commands in Source Directory

```
docker build -t django-sample .
```

```
$ docker run -it --rm \
    --name db \
    -e POSTGRES_DB=djangosample \
    -e POSTGRES_USER=sampleuser \
    -e POSTGRES_PASSWORD=samplesecret \
    --volume=$(pwd)/dblink:/var/lib/postgresql/data \
    postgres
```

```
$ docker run -it --rm \
    -p 8000:8000 \
    --link db \
    -e DJANGO_DB_HOST=db \
    -e DJANGO_DEBUG=True \
    --volume=$(pwd):/app/ \
    django-sample \
    /bin/bash -c \
    "./manage.py makemigrations && ./manage.py migrate && ./manage.py runserver 0:8000"
```

