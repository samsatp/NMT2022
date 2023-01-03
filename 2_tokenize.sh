#!/bin/bash


# Train tokenizer
spm_train --input=corpus/train.src --model_prefix=spmodel_src --vocab_size=10000 --model_type=bpe
spm_train --input=corpus/train.tgt --model_prefix=spmodel_tgt --vocab_size=10000 --model_type=bpe

# Tokenize training set
spm_encode --model=spmodel_src.model -output_format=piece < corpus/train.src > corpus/train.bpe.src
spm_encode --model=spmodel_tgt.model -output_format=piece < corpus/train.tgt > corpus/train.bpe.tgt

# Tokenize val set
spm_encode --model=spmodel_src.model -output_format=piece < corpus/val.src > corpus/val.bpe.src
spm_encode --model=spmodel_tgt.model -output_format=piece < corpus/val.tgt > corpus/val.bpe.tgt

# Tokenize test set
spm_encode --model=spmodel_src.model -output_format=piece < corpus/test.src > corpus/test.bpe.src
spm_encode --model=spmodel_tgt.model -output_format=piece < corpus/test.tgt > corpus/test.bpe.tgt