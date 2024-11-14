FROM debian:12

RUN apt update && apt install -y python3 python3-pip
RUN pip install flask flask-restful flask_jsonpify --break-system-packages
COPY python-api.py /python-api/python-api.py 
CMD ["python3", "/python-api/python-api.py"]