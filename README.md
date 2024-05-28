# Secure Docker Registry

This repository contains the necessary files to build and run a secure Docker registry using basic authentication.

## Files

- **Dockerfile**: The Dockerfile used to build the Docker image for the secure registry.
- **config.yml**: The configuration file for the Docker registry.

## Getting Started

### Prerequisites

- Docker installed on your system.

### Building the Docker Image

To build the Docker image, run the following command in the directory containing the `Dockerfile` and `config.yml`:

```sh
docker build -t myregistry:secure .
```

### Running the Docker Container

After building the image, you can run a container from it using the following command:

```sh
docker run -d -p 5000:5000 --name my-secure-registry myregistry:secure
```

This command runs the Docker registry on port 5000.

### Logging In

To log in to the secure Docker registry, use the following command:

```sh
docker login localhost:5000 -u myuser -p mypassword
```

### Pushing an Image

To push an image to the secure registry, tag it with the registry's address and use the `docker push` command. For example:

1. Tag the image:

    ```sh
    docker tag your-image:latest localhost:5000/your-image:latest
    ```

2. Push the image:

    ```sh
    docker push localhost:5000/your-image:latest
    ```

### Pulling an Image

To pull an image from the secure registry, use the `docker pull` command:

```sh
docker pull localhost:5000/your-image:latest
```

## Testing the Setup

1. **Build the Docker Image:**

    ```sh
    docker build -t myregistry:secure .
    ```

2. **Run the Docker Container:**

    ```sh
    docker run -d -p 5000:5000 --name my-secure-registry myregistry:secure
    ```

3. **Log in to the Registry:**

    ```sh
    docker login localhost:5000 -u myuser -p mypassword
    ```

4. **Tag an Image:**

    ```sh
    docker tag hello-world:latest localhost:5000/hello-world:latest
    ```

5. **Push the Image:**

    ```sh
    docker push localhost:5000/hello-world:latest
    ```

6. **Pull the Image:**

    ```sh
    docker pull localhost:5000/hello-world:latest
    ```

If all steps complete successfully, your secure Docker registry is set up and working correctly.

## Configuration

- **REGISTRY_AUTH**: The authentication method. Set to `htpasswd` to use basic authentication.
- **REGISTRY_AUTH_HTPASSWD_REALM**: The realm for basic authentication.
- **REGISTRY_AUTH_HTPASSWD_PATH**: The path to the htpasswd file.

These environment variables are set in the Dockerfile and used to configure the registry.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
