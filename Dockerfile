FROM alpine

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.10/community" > "/etc/apk/repositories"
RUN apk update && apk add texmf-dist texlive texlive-latex-recommended python3 texlive-latex-extra
RUN apk add python3-pip

COPY . /app
WORKDIR /app

RUN pip3 install -r requirements.txt && rm requirements.txt

CMD ["python3", "main.py"]
