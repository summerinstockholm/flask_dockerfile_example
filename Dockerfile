FROM ubuntu:18.04
RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
COPY . /app
WORKDIR /app 
RUN pip install -qr requirements.txt
EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]