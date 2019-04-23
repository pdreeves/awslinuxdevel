# Container Commands
## Start Container
docker run --rm -it -v /Users:/opt/external pdreeves/devlocal
docker run --rm -it -v /Users:/opt/external devlocal

## Build image
docker image build . --file Dockerfile --tag devlocal

## Delete image
docker image rm devlocal
