cd ../../

docker run -d \
    -it \
    -p 8888:8888 \
    --name devenv \
    -v "$(pwd)"/src:/home/tars/src \
    -v "$(pwd)"/notebooks:/home/tars/notebooks \
    devenv:1.0

cd docker/devenv
