#!/usr/bin/bash
set +x
set +e

conda env create -f environment.yaml
conda activate genie
FLASH_ATTENTION_SKIP_CUDA_BUILD=TRUE python -m pip install flash-attn==2.5.8 --no-build-isolation

mkdir -p /checkpoint/cortex/dud/1xgpt_data
ln -s /checkpoint/cortex/dud/1xgpt_data /home/dud/Code/1xgpt/data
# Download datasets to data/train_v1.0, data/val_v1.0
huggingface-cli download 1x-technologies/worldmodel --repo-type dataset --local-dir data
