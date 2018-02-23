

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
You can find the GOP raw scores in `eval_gop/gop.1` and the corresponding phoneme sequence in `eval_gop/phonemes.1`

## Use Librispeech tri6b acousitc and language model
1. Download the related [data](https://drive.google.com/a/tamu.edu/file/d/1Zynno632MqvjUv12ZBzY3FCKiyuTscaz/view?usp=drivesdk) and put them in `data` and `eval`
1. `./run_tri6b.sh`

Huge thanks to Junbo Zhang for his initial kaldi-gop [repository](https://github.com/jimbozhang/kaldi-gop). I added the phoneme output and added an example on how to use another acoustic model for the computation.
