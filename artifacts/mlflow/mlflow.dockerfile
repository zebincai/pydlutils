FROM ghcr.io/mlflow/mlflow:v2.8.1

RUN apt-get -y update && \
    apt-get -y install python3-dev default-libmysqlclient-dev build-essential pkg-config && \
    pip install --upgrade pip && \
    pip install mysqlclient psycopg2-binary boto3 minio

CMD ["bash"]
