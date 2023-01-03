#!/bin/bash

mkdir -p vocab

module use -a /projappl/nlpl/software/modules/etc
module load nlpl-opennmt-py

onmt_build_vocab -config config_vocab.yaml -n_sample 10000