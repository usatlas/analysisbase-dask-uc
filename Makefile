build:
	docker pull sslhep/analysis-dask-base:24.2.26
	docker build \
		--file Dockerfile \
		--tag sslhep/analysis-dask-uc:24.2.26-debug \
		.
