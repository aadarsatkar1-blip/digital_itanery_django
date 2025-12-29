#!/usr/bin/env bash
set -o errexit

# install python deps
pip install -r requirements.txt

# install node deps
npm install

# build tailwind css
npx tailwindcss -i ./static/css/input.css -o ./static/css/output.css --minify

# collect static files
python manage.py collectstatic --no-input

# migrate database
python manage.py migrate

# create superuser if not exists
python manage.py create_superuser_if_none

