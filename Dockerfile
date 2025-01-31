ARG BASE_TAG=latest
FROM sslhep/analysis-dask-base:${BASE_TAG}

LABEL maintainer Ilija Vukotic <ivukotic@cern.ch>

SHELL [ "/bin/bash", "-c" ]

USER root

RUN yum install -y jq

RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

#RUN curl -L https://raw.githubusercontent.com/maniaclab/ci-connect-api/master/resources/provisioner/sync_users_debian.sh --output /sync_users_debian.sh
#RUN chmod +x /sync_users_debian.sh
RUN cp /usr/share/bash-completion/completions/git  /etc/profile.d/git.sh

COPY run.sh  /.run
RUN chmod +x /.run

COPY SetupPrivateJupyterLab.sh /ML_platform_tests/SetupPrivateJupyterLab.sh
RUN chmod +x /ML_platform_tests/SetupPrivateJupyterLab.sh

RUN mkdir /workspace
# Want this to go to $(jupyter --config-dir) which is /root/.jupyter for this container
# c.f. https://docs.jupyter.org/en/latest/use/jupyter-directories.html#configuration-files
COPY private_jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

COPY labextension.yaml /etc/dask/labextension.yaml
# Can't reuse value of BASE_IMAGE from FROM as this gets cleared by `docker build`, so just
# reapply it here (only need to pass --build-arg BASE_TAG=... to docker build once).
#ARG BASE_TAG=latest
#RUN sed -i "s@\(.*image:\).*@\1 hub.opensciencegrid.org/usatlas/analysis-dask-base:${BASE_TAG}@" /etc/dask/labextension.yaml \
#    && cat /etc/dask/labextension.yaml

COPY  11.92ba9866db6ad7a7f70f.js /venv/share/jupyter/labextensions/dask-labextension/static/11.92ba9866db6ad7a7f70f.js
COPY  manager.py /venv/lib/python3.11/site-packages/dask_labextension/manager.py


RUN . /release_setup.sh \
    && /venv/bin/jupyter server extension enable --py jupyterlab --sys-prefix

# RUN git clone https://github.com/ivukotic/ML_platform_tests.git /ML_platform_tests

# Have Jupyter shell setup AnalysisBase environment by default
RUN echo -e '\n# Activate AnalysisBase environment on login shell\n. /release_setup.sh\n' >> /root/.bash_profile

# CMD given to container at runtime at UChicago Analysis Facility:
# "/.run /ML_platform_tests/SetupPrivateJupyterLab.sh"
CMD ["/.run"]
