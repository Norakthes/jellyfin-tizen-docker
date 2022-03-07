FROM node:current-bullseye

# Fetch updates download dependencies
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y pciutils zip libncurses5 python libpython2.7 curl git gpg

# Cleans cache
RUN apt-get clean

# Copy the shell script and make it executable
COPY entry.sh entry.sh
RUN chmod a+x entry.sh

# Download the tizen install binary
RUN curl "https://usa.sdk-dl.tizen.org/web-cli_Tizen_Studio_4.5.1_usa_ubuntu-64.bin" -o install.bin && chmod a+x install.bin

# Download tizen studios and packages as node user
USER node
RUN ./install.bin --accept-license $HOME/tizen-studio
RUN $HOME/tizen-studio/package-manager/package-manager-cli.bin install \
	Certificate-Manager NativeCLI cert-add-on --accept-license

# Remove the installed binary
USER root
RUN rm install.bin
USER node

# Run the script on startup
CMD ["/entry.sh"]
