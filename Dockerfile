FROM python:2.7

WORKDIR /app

COPY . .

RUN pip install --upgrade pip

RUN pip install setuptools==44.1.1
RUN pip install --upgrade build
RUN pip install --no-build-isolation gevent==20.6.2
RUN pip install -r requirements.txt
RUN python -m build

ENTRYPOINT ["gunicorn", "--access-logfile", "-", "-w", "8", "-b", "0.0.0.0:5000", "sixpack.server:start"]

EXPOSE 5000 5001 
