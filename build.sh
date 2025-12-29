#!/usr/bin/env bash
set -o errexit

# install python deps
pip install -r requirements.txt

# install node deps
npm install

npm run build 




# Collect static files
python manage.py collectstatic --no-input

# Migrate database
python manage.py migrate

# Create superuser if not exists
python manage.py create_superuser_if_none

