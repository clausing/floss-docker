FROM python:3.10-slim-bookworm

LABEL maintainer="Jim Clausing, jclausing@isc.sans.edu"
LABEL version="floss v3.1.1"
LABEL date="2024-09-26"
LABEL description="Run floss in a docker container"

RUN apt-get update && apt-get -y install --no-install-recommends wget unzip ca-certificates \
  curl 

ENV PYTHONUNBUFFERED=1

# Install FLOSS
WORKDIR /tmp
RUN wget https://github.com/mandiant/flare-floss/releases/download/v3.1.1/floss-v3.1.1-linux.zip \
  && unzip *-linux.zip && mv floss /usr/bin/ && rm *.zip \
  && useradd floss -m

USER floss

# Set the working directory to /app
WORKDIR /app

# Set the default command to run Floss 
ENTRYPOINT ["floss"]
CMD ["--help"]
