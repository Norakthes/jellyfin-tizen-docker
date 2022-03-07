docker build -t jellyfin-tizen .

docker run \
	--rm --name="jellyfin-tizen" \
	-v "/path/to/output":"/home/node/output" \
	jellyfin-tizen

