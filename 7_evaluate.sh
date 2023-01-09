#!/bin/bash

src=$1
tgt=$2

module use -a /projappl/nlpl/software/modules/etc
module load nlpl-mttools

sacrebleu $src -m bleu chrf < $tgt