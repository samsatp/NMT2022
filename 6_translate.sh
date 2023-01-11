#!/bin/bash

#SBATCH -J translate
#SBATCH -o log_translate/translate.%j.out
#SBATCH -e log_translate/translate.%j.err
#SBATCH -A project_2001403
#SBATCH -t 70:00:00
#SBATCH -p gpu
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --gres=gpu:v100:1
#SBATCH --mem-per-cpu=4G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sathianpong.trangcasanchai@helsinki.fi

model=$1
data=$2

mkdir -p translation/bpe

module use -a /projappl/nlpl/software/modules/etc
module load nlpl-opennmt-py

onmt_translate -model model/$model -src $data -output translation/bpe/$model.bpe.tgt -gpu 0

module load nlpl-mttools
spm_decode --model=spmodel_tgt.model --input_format=piece < translation/bpe/$model.bpe.tgt > translation/$model.$data.tgt