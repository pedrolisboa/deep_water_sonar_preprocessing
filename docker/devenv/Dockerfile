FROM ubuntu:disco

RUN apt-get update && apt-get install -y python3 python3-pip git libsndfile1

RUN useradd -r -u 11659 -ms /bin/bash tars

ADD requirements.txt .
ADD setup.py .

RUN pip3 install --upgrade setuptools==40.6.3
RUN pip3 install -r requirements.txt
RUN pip3 install jupyter

RUN pip3 install --no-cache git+https://github.com/pedrolisboa/poseidon

ADD jupyter_notebook_config.py /home/tars/.jupyter/jupyter_notebook_config.py
RUN chown tars /home/tars/.jupyter/jupyter_notebook_config.py
RUN chown tars /home/tars/.jupyter

USER tars

WORKDIR /home/tars
