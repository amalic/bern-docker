## Get the code
```
git clone --recursive https://github.com/amalic/bern-docker.git
```

## Prerequisites
- Lot's of disk space (~60 GB disk space)
- 32 GB Ram (see [BERN project README](https://github.com/dmis-lab/bern/blob/master/README.md))
- [NVidia Docker](https://github.com/NVIDIA/nvidia-docker)
- Those files:
  - [GNormPlus.zip](https://www.ncbi.nlm.nih.gov/CBBresearch/Lu/Demo/tmTools/download/GNormPlus/GNormPlusJava.zip) (~4GB)
  - tmVarJava.zip `ftp://ftp.ncbi.nlm.nih.gov/pub/lu/Suppl/tmVar2/tmVarJava.zip` (~40GB)
  - [CRF++-0.58.tar.gz](https://drive.google.com/uc?id=0B4y35FiV1wh7QVR6VXJ5dWExSTQ) (~4 MB)
  - [biobert_ner_models.zip](https://docs.google.com/uc?export=download&id=1sSVEqvMBVLj1RJmlQDhRKyt_oe-wc5LK) (~7GB)
  - [data.zip](https://docs.google.com/uc?export=download&id=1NqgG3zJzopG2IqG-0g1o6fH0xVpO4PPN) (~750 MB)
  - [resources.zip](https://docs.google.com/uc?export=download&id=1uU1U6UORqr3l_YYQ5TXeazpLrpeg_OcP) (~3 GB)

Download and extract all archives into externalData folder within this repository by running. 
```
sh prerequisites.sh
```
*You might want to get a coffee or learn a new programming language, depending on your internet connection.*

## Build
```
docker build -t bern-docker .
```

## Run
```
docker run --name bern-docker --log-opt max-size=10m -d --rm --gpus all -p 80:8888 \
  -v $PWD/externalData/GNormPlusJava/Dictionary/:/app/GNormPlusJava/Dictionary/ \
  -v $PWD/externalData/tmVarJava/Database:/app/tmVarJava/Database \
  -v $PWD/externalData/biobert_ner_models/pretrainedBERT:/app/biobert_ner/pretrainedBERT/ \
  -v $PWD/externalData/biobert_ner_models/conf/:/app/biobert_ner/conf/ \
  -v $PWD/externalData/biobert_ner_models/tmp/:/app/biobert_ner/tmp/ \
  -v $PWD/externalData/biobert_ner_models/result/:/app/biobert_ner/result/ \
  -v $PWD/externalData/data/:/app/normalization/data/ \
  -v $PWD/externalData/resources/:/app/normalization/resources/ \
  bern-docker
```
### Examples
Usage
PMID(s) (HTTP GET)
- http://\<YOUR_SERVER_ADDRESS>:\<PORT>/?pmid=\<a PMID or comma seperate PMIDs>&format=\<json or pubtator>
- Example: http://localhost/?pmid=30429607&format=json&indent=true
- Example: http://localhost/?pmid=30429607&format=pubtator
- Example: http://localhost/?pmid=30429607,29446767&format=json&indent=true

### Citation of original work
```
@article{kim2019neural,
  title={A Neural Named Entity Recognition and Multi-Type Normalization Tool for Biomedical Text Mining},
  author={Kim, Donghyeon and Lee, Jinhyuk and So, Chan Ho and Jeon, Hwisang and Jeong, Minbyul and Choi, Yonghwa and Yoon, Wonjin and Sung, Mujeen and and Kang, Jaewoo},
  journal={IEEE Access},
  volume={7},
  pages={73729--73740},
  year={2019},
  publisher={IEEE}
}

@article{10.1093/bioinformatics/btz682,
    author = {Lee, Jinhyuk and Yoon, Wonjin and Kim, Sungdong and Kim, Donghyeon and Kim, Sunkyu and So, Chan Ho and Kang, Jaewoo},
    title = "{BioBERT: a pre-trained biomedical language representation model for biomedical text mining}",
    journal = {Bioinformatics},
    year = {2019},
    month = {09},
    issn = {1367-4803},
    doi = {10.1093/bioinformatics/btz682},
    url = {https://doi.org/10.1093/bioinformatics/btz682},
}
```
