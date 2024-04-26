FROM python:2.7.18

WORKDIR /app

COPY . .

RUN pip install --upgrade pip

RUN pip install setuptools==44.1.1
RUN pip install --upgrade build
RUN pip install --no-cache-dir -r requirements.txt

RUN python -m build

ENTRYPOINT ["gunicorn", "--access-logfile", "-", "-w", "8", "--worker-class=gevent", "sixpack.server:start"]

EXPOSE 5000 5001 
