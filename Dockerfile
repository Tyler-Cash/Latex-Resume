FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt-get update && apt-get install -y texlive-latex-recommended python3
RUN apt-get install -y python3-pip

COPY . /app
WORKDIR /app

RUN pip3 install -r requirements.txt && rm requirements.txt

CMD ["python3", "main.py"]
