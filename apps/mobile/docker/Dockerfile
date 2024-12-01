FROM ubuntu:20.04

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-11-jdk \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash developer
USER developer

# Set up Flutter
ENV FLUTTER_HOME=/home/developer/flutter
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_HOME

ENV PATH="$FLUTTER_HOME/bin:$PATH"

RUN cd $FLUTTER_HOME && \
    git fetch && \
    git checkout tags/3.24.5

RUN flutter doctor
RUN flutter precache

WORKDIR /home/developer/app

COPY --chown=developer:developer . .

RUN flutter pub get

RUN flutter build web

EXPOSE 8080

CMD ["flutter", "run", "--release", "-d", "web-server", "--web-port", "8080", "--web-hostname", "0.0.0.0"]