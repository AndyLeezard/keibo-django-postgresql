# Pull the official base image
FROM python:3.11-slim-buster

# Install Git
RUN apt-get update && apt-get install -y git
RUN git config --global core.autocrlf input

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install dependencies
COPY requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project
COPY . /code/
