# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image
FROM golang:onbuild

# Set the Current Working Directory inside the container
WORKDIR /app

# Create a user and group for no root
RUN useradd gowiki --uid 1000 -U -M

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app
RUN go build -o main .

# Expose port 8082 to the outside world
EXPOSE 8082

RUN chown -R gowiki:gowiki /app

# Change user
USER 1000

# Command to run the executable
CMD ["./wiki"]
