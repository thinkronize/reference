#!/bin/bash

set -e

SEED=$1
QUALITY=$2

cd /research/transformer

export PYTHONPATH=/research/transformer/transformer:$PYTHONPATH
python3 process_data.py --raw_dir /raw_data/ --data_dir processed_data

python3 transformer/transformer_main.py --random_seed=$SEED --data_dir=processed_data/ --model_dir=model --params=big --bleu_threshold $QUALITY --bleu_source=newstest2014.en --bleu_ref=newstest2014.de
