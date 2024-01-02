
export SHELL=/bin/bash

echo "------ setting up user"

if [ "$OWNER" != "" ] && [ "$CONNECT_GROUP" != "" ]; then
    PATH=$PATH:/usr/sbin
    /sync_users_debian.sh -u root."$CONNECT_GROUP" -g root."$CONNECT_GROUP" -e https://api.ci-connect.net:18080
    # Do not leak some important tokens
    unset API_TOKEN
    # Set the user's $DATA dir
    export DATA=/data/$OWNER
    # Match PS1 as we have it on the login nodes
    echo 'export PS1="[\A] \H:\w $ "' >> /etc/bash.bashrc
    # Chown the /workspace directory so users can create notebooks
    chown -R $OWNER: /workspace
    # Change to the user's homedir
    cd /home/$OWNER

    chown -R  $OWNER: /venv
    
    unset JUPYTER_PATH
    which jupyter
    unset JUPYTER_CONFIG_DIR
    ls /root/.jupyter/jupyter_notebook_config.py
    cd /home/$OWNER
    
    # Invoke Jupyter lab as the user
    su $OWNER -c "jupyter lab --ServerApp.root_dir=/home/${OWNER} --ServerApp.port=9999 --ServerApp.ip='0.0.0.0' --no-browser --config=/root/.jupyter/jupyter_notebook_config.py"

fi 
