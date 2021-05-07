# Django Development on Docker Environment

### Requirements

- Docker Engine > v1.12.0

### Intructions

1. Clone Repository (GitHub)

```
$ git clone https://github.com/makenjoy/django-devon-docker.git
```

2. Commands in Source Directory


# Docker Environment

### Requirements

- Docker Engine > v1.12.0

- Tested 
- 
```Docker v20.10.5```

```
docker build -t richcall-django .
```

### Windows CMD (Line-Feed:`)

```
docker run -it --rm `
    -p 8000:8000 `
    --volume=$(pwd):/app/ `
    richcall-django `
    /bin/bash -c `
    "python ./manage.py makemigrations && python ./manage.py migrate && python ./manage.py createsuperuser && python ./manage.py runserver 0:8000"
```

```"python ./manage.py makemigrations && python ./manage.py migrate && python ./manage.py runserver 0:8000"```

```
docker run -it --rm `
    --name db `
    -e POSTGRES_DB=djangosample `
    -e POSTGRES_USER=sampleuser `
    -e POSTGRES_PASSWORD=samplesecret `
    --volume=$(pwd)/dblink:/var/lib/postgresql/data `
    postgres
```

### Unix-Like CMD (Line-Feed:`)

```
docker run -it --rm \
    --name db \
    -e POSTGRES_DB=djangosample \
    -e POSTGRES_USER=sampleuser \
    -e POSTGRES_PASSWORD=samplesecret \
    --volume=$(pwd)/dblink:/var/lib/postgresql/data \
    postgres
```

```
docker run -it --rm \
    -p 8000:8000 \
    --link db \
    -e DJANGO_DB_HOST=db \
    -e DJANGO_DEBUG=True \
    --volume=$(pwd):/app/ \
    richcall-django \
    /bin/bash -c \
    "python ./manage.py makemigrations && python ./manage.py migrate && python ./manage.py runserver 0:8000"
```

```
Purging All Unused or Dangling Images, Containers, Volumes, and Networks To additionally remove any stopped containers and all unused images (not just dangling images): -a
```

```
docker ps -a
docker rm -f [container-info]
```
`docker system prune -a`

`docker image prune`

`docker volume prune`

`docker network prune`

