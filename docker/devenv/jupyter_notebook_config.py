c.Notebook.open_browser = False

# setting up the password
from IPython.lib import passwd
password = passwd("t")
c.NotebookApp.password = password
