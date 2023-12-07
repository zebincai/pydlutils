outside_volume="/mnt/nas/share-all/caizebin/07.cache/mlflow"
inside_volume="/tmp/mlflow"

docker run -it --rm \
    --net host \
    --name mlflow \
    -v /mnt:/mnt \
    -v ${outside_volume}:${inside_volume} \
    -p 8001:8001 \
    ghcr.io/mlflow/mlflow:v2.7.1 \
    mlflow server \
    --host 0.0.0.0 \
    --port 8001 \
    --backend-store-uri file://${inside_volume}/backend_store_uri \
    --registry-store-uri file://${inside_volume}/registry_store_uri \
    --serve-artifacts \
    --artifacts-destination ${inside_volume}/artifacts-destination \
    -w 5
