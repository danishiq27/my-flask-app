# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install netcat
RUN apt-get update && apt-get install -y netcat-openbsd

# Set work directory
WORKDIR /usr/src/app

# Install dependencies
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . /usr/src/app/

# Copy entrypoint script
COPY entrypoint.sh /usr/src/app/
RUN chmod +x /usr/src/app/entrypoint.sh

# Give required permissions
RUN mkdir -p /usr/src/app/logs
RUN touch /usr/src/app/logs/error.log /usr/src/app/logs/access.log
RUN chmod -R 755 /usr/src/app/logs

# Expose the port the app runs on
EXPOSE 5000

# Use the entrypoint script
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]






#CMD ["gunicorn", "-c", "gunicorn_config.py", "wsgi:app"]

