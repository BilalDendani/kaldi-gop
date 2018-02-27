

# kaldi-gop
This project computes GOP (Goodness of Pronunciation) bases on Kaldi.

## How to build
1. Download and complile [Kaldi](http://www.kaldi-asr.org). Note that you need to check out the branch 5.1 instead of master, and do not use the "--shared" option.
1. Edit src/CMakeLists.txt to set the variable $KALDI_ROOT.
1. Compile the binary:
```
cd src/
mkdir build && cd build
cmake .. && make
```
## Run the example
```
cd egs/gop-compute
./run.sh
```

## Results
You can find the GOP raw scores in `eval_gop/gop.1` and the corresponding phoneme sequence (in numbers) in `eval_gop/phonemes.1`

## Use Librispeech tri6b acoustic and language model
1. Download the [sample data](https://drive.google.com/file/d/1XtDkqFQYXr29W0Ai_DPb5AO5RaLxy6nC/view?usp=sharing) and extract all files under `egs/gop-compute`. This package provides a toy speech dataset as well as a pretrained acousitc model
1. Run `./run_tri6b.sh data/sample_raw_data/` for a demo
1. Run `./run_tri6b.sh` for usage information
1. If you want to use your own data, you can organize your files similar to `data/sample_raw_data/` in the sample data package
1. The code assumes that the name of the root dir of your own data is the same as the speaker's ID, see `data/sample_raw_data/spk2gender`
1. This script also outputs the symbolic phoneme sequence in `eval_gop_tri6b/phonemes_sym.*`

Huge thanks to Junbo Zhang for his initial kaldi-gop [repository](https://github.com/jimbozhang/kaldi-gop). I added the phoneme output and added an example on how to use another acoustic model for the computation.
