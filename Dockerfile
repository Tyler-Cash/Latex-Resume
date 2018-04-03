FROM ubuntu

RUN apt-get update && apt-get install -y texlive-latex-recommended
COPY . /app
WORKDIR /app
