FROM python
EXPOSE 8000
LABEL this is the docker file to deploy python code sample into pipeline process
WORKDIR /thulasiram/flm/
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python", "app.py"]
