#!/bin/bash

#SBATCH -J train_general
#SBATCH -o log_training/general.%j.out
#SBATCH -e log_training/general.%j.err
#SBATCH -A project_2001403
#SBATCH -t 70:00:00
#SBATCH -p gpu
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --gres=gpu:v100:1
#SBATCH --mem-per-cpu=8G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sathianpong.trangcasanchai@helsinki.fi


echo "Starting at `date`"
mkdir -p model

# stops the script when encountering an error
# (useful if running several commands in the same script)
set -e

# load the relevant module
module use -a /projappl/nlpl/software/modules/etc
module load nlpl-opennmt-py

onmt_train -config model_general_attn.yaml

echo "Finishing at `date`"
