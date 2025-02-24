# Start with the existing base image
FROM pleosoft/cmd-transformer:1.0.0

COPY engine_config.json /workspace/engine_config.json
COPY exiftool-cmd.spel /workspace/exiftool-cmd.spel
COPY exiftool-options.spel /workspace/exiftool-options.spel
COPY application.yaml /workspace/application.yaml

ENV SPRING_CONFIG_ADDITIONAL_LOCATION=/workspace/

USER root

RUN apt-get update && \
    apt-get install -y libimage-exiftool-perl && \
    apt-get clean

EXPOSE 8181
