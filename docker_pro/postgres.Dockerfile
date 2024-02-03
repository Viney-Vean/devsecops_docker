# Use an official postgres base image
FROM postgres:latest

LABEL maintainer="Viney Vean <viney.vean@gmail.com>"

ENV POSTGRES_DB=postgres
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres