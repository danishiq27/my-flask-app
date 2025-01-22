Flask Blog App - Dockerized with Swarm Orchestration

This repository contains the source code and deployment configuration for a Flask-based blog application, fully containerized using Docker and orchestrated with Docker Swarm. The app is designed for scalability and ease of deployment.

Features

Flask Framework: Backend built with Python and Flask.

Database: Uses MariaDB as the database backend.

Dockerized Deployment: The app and its dependencies are containerized using Docker.

Docker Swarm Orchestration: Deployed with Docker Swarm for scalability and load balancing.

Secure Communication: Configured with SSL for secure connections.

Requirements

Docker (v20.10+)

Docker Compose (v2.0+)

Docker Swarm initialized

Project Structure

├── flask_app/                # Flask application source code
│   ├── app/                 # Application logic
│   ├── requirements.txt     # Python dependencies
│   └── Dockerfile           # Dockerfile for Flask app
├── mariadb/                 # Database configuration
│   └── Dockerfile           # Dockerfile for MariaDB
├── nginx/                   # Nginx reverse proxy configuration
│   ├── nginx.conf           # Custom Nginx configuration
│   └── Dockerfile           # Dockerfile for Nginx
├── docker-compose.yml       # Docker Compose file for local development
├── docker-stack.yml         # Docker Swarm stack file for production
└── README.md                # Project documentation

Setup and Deployment

Local Development

Clone the repository:

git clone https://github.com/your-username/flask-blog-docker.git
cd flask-blog-docker

Build and start the containers:

docker-compose up --build

Access the app in your browser at http://localhost:5000.

Production Deployment with Docker Swarm

Initialize Docker Swarm (if not already initialized):

docker swarm init

Deploy the stack:

docker stack deploy -c docker-stack.yml flask_blog

Verify the services:

docker service ls

Access the app in your browser at http://<your-server-ip>.

Environment Variables

Environment variables are configured in the following files:

flask_app.env: Flask app environment variables.

mariadb.env: MariaDB configuration (username, password, database).

Ensure these files are properly set up before deployment.

Scaling

To scale the services in Docker Swarm:

docker service scale flask_blog_flask_app=<number_of_replicas>
docker service scale flask_blog_nginx=<number_of_replicas>

SSL Configuration

The Nginx service is configured to handle SSL termination. Add your certificates to the nginx/certs directory and ensure the Nginx configuration points to the correct paths.

License

This project is licensed under the MIT License. See the LICENSE file for details.

Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.
