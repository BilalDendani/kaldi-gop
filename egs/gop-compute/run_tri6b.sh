#!/bin/sh

# Copyright 2016-2017   Author: Junbo Zhang  <dr.jimbozhang@gmail.com>
# Modified 2018 Guanlong Zhao <gzhao@tamu.edu>

set -e
#set -x

if [ "$1" = "--help" ]; then
  echo "Usage: "
  echo "  $0 <model-dir>"
  echo "e.g.:"
  echo "  $0 exp/tri1"
  exit 1;
fi

# Enviroment preparation
. ./cmd.sh
. ./path.sh
[ -h steps ] || ln -s $KALDI_ROOT/egs/wsj/s5/steps
[ -h utils ] || ln -s $KALDI_ROOT/egs/wsj/s5/utils

decode_nj=3

data_dir=~/Desktop/learn_kaldi/kaldi/egs/anyone/data/aba

# Decode
local/compute-gmm-gop.sh --nj "$decode_nj" --cmd "$decode_cmd" "$data_dir" data/lang_librispeech exp/tri6b exp/eval_gop_tri6b_aba
