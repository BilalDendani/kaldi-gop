#!/bin/sh

# Copyright 2016-2017   Author: Junbo Zhang  <dr.jimbozhang@gmail.com>
# Modified 2018 Guanlong Zhao <gzhao@tamu.edu>
# Note that this acousitc model requires 16 KHz speech

raw_data=
processed_data=data/test
gop_output=exp/eval_gop_tri6b
n_split=5

. utils/parse_options.sh || exit 1;
set -e

# Input
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <raw-data-dir>"
  echo "e.g.: $0 data/sample_raw_data"
  echo "options:"
  echo "  --n_split 5"
  echo "  --processed_data data/test"
  echo "  --gop_output exp/eval_gop_tri6b"
  exit 1
fi
raw_data=$1

# Enviroment preparation
echo "$0 $@"  # Print the command line for logging
. ./cmd.sh
. ./path.sh
[ -h steps ] || ln -s $KALDI_ROOT/egs/wsj/s5/steps
[ -h utils ] || ln -s $KALDI_ROOT/egs/wsj/s5/utils

# Prepare data
data_prep.sh --n_split $n_split $raw_data $processed_data

# Decode
local/compute-gmm-gop.sh --nj "$n_split" --cmd "$decode_cmd" "$processed_data" data/lang_librispeech exp/tri6b $gop_output
