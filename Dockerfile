FROM ubuntu

RUN apt-get update && apt-get install -y texlive-latex-recommended python3
COPY . /app
WORKDIR /app

CMD ["python3", "main.py"]
