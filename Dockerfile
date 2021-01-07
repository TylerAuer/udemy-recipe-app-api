FROM python:3.7-alpine
LABEL Tyler Auer

# Runs Python in unbuffered mode. Forces Python to just output immediatelly
# no buffer which can cause issues in docker image apparently
ENV PYTHONUNBUFFERED 1

# Copy my requirements file to the root of my docker image
COPY ./requirements.txt /requirements.txt

# Install the requirements
RUN pip install -r /requirements.txt

# Copy our app to the docker image
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create a user so we are not using the root account
RUN adduser -D user
USER user