c.ServerApp.ip = '0.0.0.0'
c.ServerApp.port = 9999
# c.ServerApp.root_dir = ''
c.ServerApp.allow_password_change = False
c.NotebookApp.open_browser = False
# Set shell to bash as AnalysisBase assumes it
# force login shell to pickup ~/.bash_profile
c.NotebookApp.terminado_settings = {"shell_command": ["/bin/bash", "-l"]}


def host_allowlist(handler, host):
    # handler.log.info("Request to proxy to host " + host)
    return True
    # return host.startswith("192.170") or host.startswith("2605:9a00:10:200a") or host.startswith("dask-")


# for dask dashboards to be visible
c.ServerProxy.host_allowlist = host_allowlist
