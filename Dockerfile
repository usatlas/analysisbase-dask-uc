FROM sslhep/analysis-dask-base:24.2.26

LABEL maintainer Ilija Vukotic <ivukotic@cern.ch>

USER root

RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

RUN curl -OL https://raw.githubusercontent.com/maniaclab/ci-connect-api/master/resources/provisioner/sync_users_debian.sh
RUN chmod +x sync_users_debian.sh


COPY run.sh         /.run
RUN chmod +x /.run

RUN mkdir /workspace
COPY private_jupyter_notebook_config.py /usr/local/etc/jupyter_notebook_config.py

RUN . /release_setup.sh \
    && /venv/bin/jupyter server extension enable --py jupyterlab --sys-prefix

RUN git clone https://github.com/ivukotic/ML_platform_tests.git

CMD ["/.run"]
