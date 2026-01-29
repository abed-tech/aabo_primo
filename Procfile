release: python manage.py migrate --no-input
web: gunicorn aabo.wsgi:application --bind 0.0.0.0:$PORT --workers 4 --threads 2 --timeout 120 --access-logfile - --error-logfile - --log-level info
worker: daphne -b 0.0.0.0 -p $PORT aabo.routage:application
