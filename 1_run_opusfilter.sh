#! /bin/bash

#SBATCH -J opusfilter
#SBATCH -o log_data/opusfilter.%j.out
#SBATCH -e log_data/opusfilter.%j.err
#SBATCH -A project_2001403
#SBATCH -t 24:00:00
#SBATCH -p small
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --cpus-per-task 1
#SBATCH --mem-per-cpu=6G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sathianpong.trangcasanchai@helsinki.fi

mkdir -p corpus

module use -a /projappl/nlpl/software/modules/etc
module load nlpl-opusfilter

opusfilter get_prep_data.yaml
