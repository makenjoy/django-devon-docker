FROM python:3.8

WORKDIR /app

ADD    ./requirements.txt   /app/
RUN    pip install -r requirements.txt

ADD    ./djangosample   /app/djangosample/
ADD    ./manage.py      /app/
# ADD    ./gunicorn       /app/gunicorn/

# CMD ["gunicorn", "djangosample.wsgi", "-c", "gunicorn/prod.py"]
# ENV PYTHONUNBUFFERED=0
# RUN apt-get update && apt-get -y install

