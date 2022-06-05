# Container Commands

## Create .ssh container
docker volume create devVolume

## Start Container
docker run --rm -it -v /Users/pdreeves/Code:/opt/code -v devVolume:/root/.ssh dev

## Build image
docker image build . --file Dockerfile --tag dev

## Build image with no cache
docker image build --no-cache . --file Dockerfile --tag dev

## Tag and push image to DockerHub
docker tag dev pdreeves/dev
docker push pdreeves/dev

## Delete image
docker image rm dev
