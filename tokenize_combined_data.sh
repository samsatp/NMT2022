#!/bin/bash

#SBATCH -J tokenize
#SBATCH -o log_data/tokenize.%j.out
#SBATCH -e log_data/tokenize.%j.err
#SBATCH -A project_2001403
#SBATCH -t 24:00:00
#SBATCH -p small
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --cpus-per-task 1
#SBATCH --mem-per-cpu=6G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sathianpong.trangcasanchai@helsinki.fi

mkdir -p segmented

module use -a /projappl/nlpl/software/modules/etc
module load nlpl-mttools


# Tokenize training set
spm_encode --model=spmodel_src.model -output_format=piece < corpus/train_down.src > segmented/train_combined.bpe.src
spm_encode --model=spmodel_tgt.model -output_format=piece < corpus/train_down.tgt > segmented/train_combined.bpe.tgt