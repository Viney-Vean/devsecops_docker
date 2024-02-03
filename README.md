# DevSecOps Docker Repository

This repository provides Dockerfiles and configurations for setting up a DevSecOps environment with multiple services
using Docker containers. The primary goal is to facilitate a seamless integration of FastAPI, PostgreSQL, pgAdmin,
Redis, and Nginx, orchestrated and proxied by Nginx.

Services Included:

1. FastAPI Service
   Dockerfile: fastapi.Dockerfile
   Description: Utilizes the tiangolo/uvicorn-gunicorn base image to deploy a FastAPI application. Dependencies are
   managed with a requirements.txt file.
2. PostgreSQL Service
   Dockerfile: postgresql.Dockerfile
   Description: Installs and configures PostgreSQL database server. Can be accessed on port 5454.
3. pgAdmin Service
   Dockerfile: pgadmin.Dockerfile
   Description: Sets up pgAdmin web interface for managing PostgreSQL databases. Accessible on port 5050.
4. Redis Service
   Dockerfile: redis.Dockerfile
   Description: Installs and configures the Redis in-memory data structure store. Available on port 6379.
5. Nginx Service (Proxy)
   Dockerfile: nginx.Dockerfile
   Description: Uses the official Nginx base image to serve as a reverse proxy for the aforementioned services.
   Configurations are split for FastAPI and other services.

# How to Use:

1. Clone the repository:

    - git clone https://github.com/yourusername/devsecops_docker.git

    - `cd devsecops_docker`

2. Docker network

    - `docker network create devuserdocker_network`

3. Docker Build

    - `docker build -t devuserdocker/fastapi:v1 -f .\docker_pro\fastapi.Dockerfile .`
    - `docker build -t devuserdocker/postgresql:v1 -f .\docker_pro\postgres.Dockerfile .`
    - `docker build -t devuserdocker/pgadmin:v1 -f .\docker_pro\pgAdmin.Dockerfile .`
    - `docker build -t devuserdocker/redis:v1 -f .\docker_pro\redis.Dockerfile .`
    - `docker build -t devuserdocker/nginx:v1 -f .\docker_pro\nginx.Dockerfile .`

4. Docker login

    - `docker login`

5. Docker Push

    - `docker push devuserdocker/fastapi:v1`
    - `docker push devuserdocker/postgresql:v1`
    - `docker push devuserdocker/pgadmin:v1`
    - `docker push devuserdocker/redis:v1`
    - `docker push devuserdocker/nginx:v1`

6. Docker Push

    - `docker pull devuserdocker/fastapi:v1`
    - `docker pull devuserdocker/postgresql:v1`
    - `docker pull devuserdocker/pgadmin:v1`
    - `docker pull devuserdocker/redis:v1`
    - `docker pull devuserdocker/nginx:v1`

7. Docker Run

    - `docker run -d --name fastapi --network devuserdocker_network devuserdocker/fastapi:v1`
    - `docker run -d --name postgresql --network devuserdocker_network devuserdocker/postgresql:v1`
    - `docker run -d --name pgadmin --network devuserdocker_network devuserdocker/pgadmin:v1`
    - `docker run -d --name redis --network devuserdocker_network devuserdocker/redis:v1`
    - `docker run -d --name nginx -p 8000:80 -p 5454:5454 -p 5050:5050 -p 6379:6379 --network devuserdocker_network devuserdocker/nginx:v1`

8. Access services:

    - FastAPI: http://localhost:8000
    - pgAdmin: http://localhost:5050
    - PostgreSQL: Port 5454
    - Redis: Port 6379