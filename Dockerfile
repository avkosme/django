FROM avkosme/python3.6.6

ADD requirements.txt /opt/requirements.txt
RUN pip3.6 install -r /opt/requirements.txt
