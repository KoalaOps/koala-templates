FROM python:3.12-alpine

WORKDIR /app

# copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt

# install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt
# Install unicorn
RUN pip install uvicorn

# copy every content from the local file to the image
COPY . /app

# configure the container to run uvicorn with our Flask application
ENTRYPOINT [ "uvicorn" ]
CMD ["--host", "0.0.0.0", "--port", "8080", "main:app"]