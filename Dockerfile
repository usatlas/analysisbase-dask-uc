FROM sslhep/analysis-dask-base:24.2.26

LABEL maintainer Ilija Vukotic <ivukotic@cern.ch>

SHELL [ "/bin/bash", "-c" ]

USER root

RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

RUN curl -L https://raw.githubusercontent.com/maniaclab/ci-connect-api/master/resources/provisioner/sync_users_debian.sh --output /sync_users_debian.sh
RUN chmod +x /sync_users_debian.sh


COPY run.sh         /.run
RUN chmod +x /.run

COPY SetupPrivateJupyterLab.sh         /ML_platform_tests/SetupPrivateJupyterLab.sh
RUN chmod +x /ML_platform_tests/SetupPrivateJupyterLab.sh

RUN mkdir /workspace
# Want this to go to $(jupyter --config-dir) which is /root/.jupyter for this container
# c.f. https://docs.jupyter.org/en/latest/use/jupyter-directories.html#configuration-files
COPY private_jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

RUN . /release_setup.sh \
    && /venv/bin/jupyter server extension enable --py jupyterlab --sys-prefix

# RUN git clone https://github.com/ivukotic/ML_platform_tests.git /ML_platform_tests

# Have Jupyter shell setup AnalysisBase environment by default
RUN echo -e '\n# Activate AnalysisBase environment on login shell\n. /release_setup.sh\n' >> /root/.bash_profile

CMD ["/.run"]
