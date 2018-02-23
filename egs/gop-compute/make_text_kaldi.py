#!/bin/bash
# Convert an input normal transcription file to kaldi's format
# Input: each line is the transcriprion of an utterance
# Ouput: a Kaldi "text" file with utterance indices
# Reads the utterance indices from the wav.scp file

import re
import sys

def toKaldiFormat(inputString):
    pattern = re.compile('[^a-zA-Z\'\-\s]')
    outputString = re.sub(pattern, '', inputString)
    return outputString.upper()

if __name__ == "__main__":
    inputFile = open(sys.argv[1], 'r')
    wavScp = open(sys.argv[2], 'r')
    outputFile = open(sys.argv[3], 'w')

    newTextLine = inputFile.readline()
    newWavLine = wavScp.readline()
    while (len(newWavLine) > 0) and (len(newTextLine) > 0):
        parseWav = newWavLine.split(' ')
        outputFile.write('%s %s' % (parseWav[0], toKaldiFormat(newTextLine)))
        newTextLine = inputFile.readline()
        newWavLine = wavScp.readline()

    inputFile.close()
    outputFile.close()
    wavScp.close()