chmod 700 .env

echo "Input password for jupyter lab"
read -s password

touch jupyter_notebook_config.py
chmod 600 jupyter_notebook_config.py

echo "c.Notebook.open_browser = False" >> jupyter_notebook_config.py

hashpass=$(echo -n $password | sha1sum | cut -d " " -f 1)

echo "c.Notebook.password = u'sha1:"$hashpass"'" >> jupyter_notebook_config.py

chmod 400 jupyter_notebook_config.py
mv jupyter_notebook_config.py ./docker/devenv/

