FROM golang:1.15.0

# Set the Current Working Directory inside the container
WORKDIR /app

RUN export GO111MODULE=on

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

COPY . .

# Build the application
# ENV POSTGRESQL_HOST '10.113.160.3'
# ENV POSTGRESQL_PORT '5432'
# ENV POSTGRESQL_USER 'postgres'
# ENV POSTGRESQL_PASSWORD 'mysecretpassword'
# ENV POSTGRESQL_DBNAME 'postgrestest' 
RUN go build -o main .

# Expose port 9000 to the outside world
EXPOSE 9000
EXPOSE 8080
# Command to run the executable
CMD ["./main"]