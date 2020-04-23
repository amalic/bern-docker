#!/bin/sh
set -e

DLDIR="externalData"

if [ ! -d $DLDIR ]; then
    mkdir $DLDIR
fi

cd $DLDIR

# GNormPlusJava.zip
if [ ! -f GNormPlusJava.zip ]; then
  if [ ! -d GNormPlusJava ]; then
    wget https://www.ncbi.nlm.nih.gov/CBBresearch/Lu/Demo/tmTools/download/GNormPlus/GNormPlusJava.zip
    unzip GNormPlusJava.zip
    rm GNormPlusJava.zip
  fi
fi

# tmVarJava.zip
if [ ! -f tmVarJava.zip ]; then
  if [ ! -d tmVarJava ]; then
    wget ftp://ftp.ncbi.nlm.nih.gov/pub/lu/Suppl/tmVar2/tmVarJava.zip 
    unzip tmVarJava.zip
    rm tmVarJava.zip
  fi
fi

# CRF++-0.58.tar.gz
if [ ! -f CRF++-0.58.tar.gz ]; then
  if [ ! -d CRF++-0.58 ]; then
    wget -O CRF++-0.58.tar.gz  --load-cookies cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?id=0B4y35FiV1wh7QVR6VXJ5dWExSTQ' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=0B4y35FiV1wh7QVR6VXJ5dWExSTQ"
    rm -rf cookies.txt
    tar -xvf CRF++-0.58.tar.gz
    rm CRF++-0.58.tar.gz
  fi
fi

# biobert_ner_models.zip
if [ ! -f biobert_ner_models.zip ]; then
  if [ ! -d biobert_ner_models ]; then
    wget -O biobert_ner_models.zip  --load-cookies cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1sSVEqvMBVLj1RJmlQDhRKyt_oe-wc5LK' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1sSVEqvMBVLj1RJmlQDhRKyt_oe-wc5LK"
    rm -rf cookies.txt
    mkdir ./biobert_ner_models
    unzip biobert_ner_models.zip -d ./biobert_ner_models
    rm biobert_ner_models.zip
  fi
fi

# data.zip
if [ ! -f data.zip ]; then
  if [ ! -d data ]; then
    wget -O data.zip  --load-cookies cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1NqgG3zJzopG2IqG-0g1o6fH0xVpO4PPN' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1NqgG3zJzopG2IqG-0g1o6fH0xVpO4PPN"
    rm -rf cookies.txt
    unzip data.zip
    rm data.zip
  fi
fi

# resources.zip
if [ ! -f resources.zip ]; then
  if [ ! -d resources ]; then
    wget -O resources.zip  --load-cookies cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1uU1U6UORqr3l_YYQ5TXeazpLrpeg_OcP' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1uU1U6UORqr3l_YYQ5TXeazpLrpeg_OcP"
    rm -rf cookies.txt
    unzip resources.zip
    rm resources.zip
  fi
fi