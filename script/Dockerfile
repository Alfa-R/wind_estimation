# syntax=docker/dockerfile:1
FROM r-base

# Copy the source code into the container.
COPY . /app/

# package manager with proper error support
RUN R -e "install.packages('littler', dependencies=TRUE)"

# Install yaml and procma and abort in case of errors
RUN install2.r --error --deps TRUE yaml
RUN install2.r --error --deps TRUE pracma


WORKDIR /app

# Run the application. Please note that the below line will be provided by the C2D environment and run-local.sh script
#ENTRYPOINT Rscript estimate_wind.R ../inputs/example/0
