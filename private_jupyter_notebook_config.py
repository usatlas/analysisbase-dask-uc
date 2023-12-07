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
c.ServerProxy.host_allowlist = [
    "c001.af.uchicago.edu",
    "c002.af.uchicago.edu",
    "c003.af.uchicago.edu",
    "c004.af.uchicago.edu",
    "c005.af.uchicago.edu",
    "c006.af.uchicago.edu",
    "c007.af.uchicago.edu",
    "c008.af.uchicago.edu",
    "c009.af.uchicago.edu",
    "c010.af.uchicago.edu",
    "c011.af.uchicago.edu",
    "c012.af.uchicago.edu",
    "c013.af.uchicago.edu",
    "c014.af.uchicago.edu",
    "c015.af.uchicago.edu",
    "c016.af.uchicago.edu",
    "c017.af.uchicago.edu",
    "c018.af.uchicago.edu",
    "c019.af.uchicago.edu",
    "c020.af.uchicago.edu",
    "c021.af.uchicago.edu",
    "c022.af.uchicago.edu",
    "c023.af.uchicago.edu",
    "c024.af.uchicago.edu",
    "c025.af.uchicago.edu",
    "c026.af.uchicago.edu",
    "c027.af.uchicago.edu",
    "c028.af.uchicago.edu",
    "c029.af.uchicago.edu",
    "c030.af.uchicago.edu",
    "c031.af.uchicago.edu",
    "c032.af.uchicago.edu",
    "c033.af.uchicago.edu",
    "c034.af.uchicago.edu",
    "c035.af.uchicago.edu",
    "g002.af.uchicago.edu",
    "g003.af.uchicago.edu",
    "g004.af.uchicago.edu",
    "g005.af.uchicago.edu",
    "g006.af.uchicago.edu",
    "g007.af.uchicago.edu"
]
