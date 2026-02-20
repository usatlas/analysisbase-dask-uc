# analysisbase-dask-uc

UC AF specific image building

It is rebuilt only when triggered by a change in base image, it tags image based on the tag of base.

## Run

### UChicago Analysis Facility

This `latest` tag of this image is available for use at the [US ATLAS Analysis Facility at UChicago](https://af.uchicago.edu/) through the [JupyterHub service](https://af.uchicago.edu/jupyterlab).
When [configuring](https://af.uchicago.edu/jupyterlab/configure) the Jupyter Lab instance for your session select the image from the "Image" drop-down menu.

### Locally

```
docker pull sslhep/analysis-dask-uc:latest
```

## Container Layout

The container is designed to be launched by the UChicago Analysis Facility JupyterHub service:

- **Startup Script**: `SetupPrivateJupyterLab.sh` is installed at `/usr/local/bin/SetupPrivateJupyterLab.sh`
- **Entrypoint**: The container entrypoint `/.run` executes any arguments passed to it
- **Runtime Invocation**: The AF portal invokes the container with `/.run /usr/local/bin/SetupPrivateJupyterLab.sh`
- **Startup Process**: The script creates a user account, configures the environment, and launches JupyterLab on port 9999
