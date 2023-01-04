#!/bin/bash

src=$1
tgt=$2

sacrebleu $src -m bleu chrf < $tgt