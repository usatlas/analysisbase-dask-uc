c.ServerApp.ip = '0.0.0.0'
c.ServerApp.port = 9999
# c.ServerApp.root_dir = ''
c.ServerApp.allow_password_change = False
c.NotebookApp.open_browser = False
# Set shell to bash as AnalysisBase assumes it
c.NotebookApp.terminado_settings = { "shell_command": ["/bin/bash"] }
