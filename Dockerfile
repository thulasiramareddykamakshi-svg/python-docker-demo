FROM python
EXPOSE 8000
MAINTAINER Thulasiram
LABEL this is the docker file to deploy pyhon code sample into pipeline process
WORKDIR /thulasiram/flm/
COPY requirements.txt .
CMD pip install -r requirements.txt
COPY . .
CMD python app.py
