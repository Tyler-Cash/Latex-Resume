FROM ubuntu

RUN apt-get update && apt-get install -y texlive-latex-recommended python3

COPY . /app
WORKDIR /app

RUN pip3 install -r requirements.txt && rm requirements.txt

CMD ["python3", "main.py"]
