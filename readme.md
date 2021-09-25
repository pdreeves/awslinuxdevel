# Container Commands

## Create .ssh container
docker volume create devVolume

## Start Container
docker run --rm -it -v /Users/pdreeves/Code:/opt/code -v devVolume:/root/.ssh pdreeves/devlocal
docker run --rm -it -v /Users/pdreeves/Code:/opt/code -v devVolume:/root/.ssh devlocal

## Build image
docker image build . --file Dockerfile --tag devlocal

## Tag and push image to DockerHub
docker tag devlocal pdreeves/devlocal
docker push pdreeves/devlocal

## Delete image
docker image rm devlocal
