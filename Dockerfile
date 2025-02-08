FROM python:3.12.1-slim


RUN mkdir -p /app
COPY . main.py /app/
WORKDIR /app
RUN pip install -r requirements.txt &&\
    python -m textblob.download_corpora

EXPOSE 8080

CMD [ "main.py"]
ENTRYPOINT [ "python"]