FROM tensorflow/tensorflow:1.13.1-gpu-py3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y wget default-jre

WORKDIR /app
COPY externalData/GNormPlusJava/ ./GNormPlusJava/
COPY externalData/tmVarJava/ ./tmVarJava/
COPY externalData/CRF++-0.58/ ./GNormPlusJava/CRF/
COPY externalData/CRF++-0.58/ ./tmVarJava/CRF/

COPY bern/ .
RUN pip install -r requirements.txt

WORKDIR /app
RUN cd GNormPlusJava && \
  cd CRF && \
  sh ./configure && \
  make && \
  make install && \
  cd .. && \
  chmod 764 Ab3P && \
  sed -i 's/= All/= 9606/g' setup.txt; echo "FocusSpecies: from All to 9606 (Human)" && \
  sh Installation.sh && \
  wget -O GNormPlusServer.jar --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1g-JlhqeDIlZX5YFk8Y27_M8BXUXcQRSX' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1g-JlhqeDIlZX5YFk8Y27_M8BXUXcQRSX" && \
  rm -rf /tmp/cookies.txt

WORKDIR /app
RUN cd tmVarJava && \
  cd CRF && \
  sh ./configure && \
  make && \
  make install && \
  cd ..&& \
  chmod 764 CRF/crf_test && \
  sh Installation.sh && \
  wget -O tmVar2Server.jar --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1kQYzLHLFLsU9qKpRRGjXkIYmaYK6bPJm' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1kQYzLHLFLsU9qKpRRGjXkIYmaYK6bPJm"  && \
  rm -rf /tmp/cookies.txt && \
  wget https://repo1.maven.org/maven2/org/xerial/sqlite-jdbc/3.20.0/sqlite-jdbc-3.20.0.jar && \
  wget https://repo1.maven.org/maven2/edu/stanford/nlp/stanford-corenlp/3.5.2/stanford-corenlp-3.5.2.jar

WORKDIR /app
RUN mkdir logs
COPY entrypoint.sh .

EXPOSE 8888

ENTRYPOINT ["bash", "-c"]
CMD ["/app/entrypoint.sh"]