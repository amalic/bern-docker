## Prerequisites
- Lot's of disk space
- [NVidia Docker](https://github.com/NVIDIA/nvidia-docker)
- Download following files first:
  - [GNormPlus.zip](https://www.ncbi.nlm.nih.gov/CBBresearch/Lu/Demo/tmTools/download/GNormPlus/GNormPlusJava.zip)
  - tmVarJava.zip: ftp://ftp.ncbi.nlm.nih.gov/pub/lu/Suppl/tmVar2/tmVarJava.zip
  - [CRF++-0.58.tar.gz](https://drive.google.com/uc?id=0B4y35FiV1wh7QVR6VXJ5dWExSTQ)
  - [biobert_ner_models.zip](https://docs.google.com/uc?export=download&id=1sSVEqvMBVLj1RJmlQDhRKyt_oe-wc5LK)
  - [data.zip](https://docs.google.com/uc?export=download&id=1NqgG3zJzopG2IqG-0g1o6fH0xVpO4PPN)
  - [resources.zip](https://docs.google.com/uc?export=download&id=1uU1U6UORqr3l_YYQ5TXeazpLrpeg_OcP)

Extract all archives into externalData folder, and delete the archives if not needed any more for other purposes.

## Build
```
docker build -t bern-docker
```

## Run
```
docker run -it --gpus all -p 80:8888 \
  -v $PWD/externalData/GNormPlusJava/Dictionary/:/app/GNormPlusJava/Dictionary/ \
  -v $PWD/externalData/tmVarJava/Database:/app/tmVarJava/Database \
  -v $PWD/externalData/biobert_ner_models/:/app/bern/biobert_ner/ \
  -v $PWD/externalData/data/:/app/normalization/data/ \
  -v $PWD/externalData/resources/:/app/normalization/resources/ \
  bern-docker
```

## License
```
bern-docker (c) by Alexander Malic

bern-docker is licensed under a
Creative Commons Attribution 4.0 International License.

You should have received a copy of the license along with this
work. If not, see <http://creativecommons.org/licenses/by/4.0/>.
```
