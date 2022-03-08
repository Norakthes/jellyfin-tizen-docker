# The purpose of this docker
The purpose of this docker is to build the jellyfin-tizen WGT

# Running
```bash
docker run \
	--rm --name="jellyfin-tizen" \
	-v "/path/to/output":"/home/node/output" \
	norakthes/jellyfin-tizen
```

# Building locally
```bash
git clone https://github.com/norakthes/jellyfin-tizen-docker.git
cd jellyfin-tizen-docker
docker build \
	--no-cache \
	--pull \
	-t norakthes/jellyfin-tizen .
```

# Todo
* Deploy over network
* Manage size of docker / Manage downloaded packages
* Hope I can download yarn/node manually, so I don't get a lot of unnecessary packages
* Make tizen studio and it's packages downloaded by the user to decrease the size of the image
