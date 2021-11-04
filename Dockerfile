FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update \
  # dependencies for building Python packages
  && apt-get install -y build-essential \
  # psycopg2 dependencies
  && apt-get install -y libpq-dev \
  # Translations dependencies
  && apt-get install -y gettext \
  # cleaning up unused files
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && rm -rf /var/lib/apt/lists/*


RUN mkdir /app

WORKDIR /app
COPY . /app/

RUN pip install -r requirements.txt

CMD ["gunicorn", "-c", "config/gunicorn/conf.py", "--bind", "0.0.0.0:5000", "--chdir", "seguridad", "seguridad.wsgi:application"]