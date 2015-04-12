#!/bin/sh

# example 1
# prints help (no arguments)
echo "==================words================"
echo
echo help 
echo
ami2-words
echo

# example 1
# runs ami-words on a small number of files 
# for tutorials we copy the files to a temporary directory so as not to overwrite them by mistake
# this calculates the frequencies of words
rm -rf wordstest/
cp -R examples/ wordstest
echo
echo "==========running ami2-words to get frequencies"
echo
ami2-words -q wordstest/ --w.words wordFrequencies  
echo
echo "results in QSN"
echo
# the results are written into the directories
# thus wordstest/http_www.trialsjournal.com_content_16_1_19/ should have a new directory
# http_www.trialsjournal.com_content_16_1_19/results/word/frequencies which will contain
#   results.xml (machine-readable)
#   results.html (human-readable)
# inspect http_www.trialsjournal.com_content_16_1_19/results/word/frequencies/results.html for a word cloud
# and list all the files we have produced
ls -ltR wordstest/*/results/word/frequencies
echo
rm -rf wordstest/
cp -R examples/ wordstest
echo
echo "==========running ami2-words to get summary frequencies"
echo
echo "there are a number of options here..."
echo "--w.stopwords applies lists of words to be omitted from the analysis"
echo "    stopwords.txt is a list of 335 common english words"
echo "    clinicaltrials200.txt is a list of the 200 next commonest words we found in trialsjournal.com"
echo "--w.case ignore  will ignore case"
echo "--w.summary denotes the concept to summarise on (boolean Frequency = 1 if word is in a document, else 0)"
echo "--summaryfile the directory to summarize in"
echo "--w.mincount frequencies below this will be ignored (not sure it's working yet)"
echo
ami2-words \
-q wordstest/ --w.words wordFrequencies  \
--w.stopwords \
  /org/xmlcml/ami2/plugins/word/stopwords.txt \
  /org/xmlcml/ami2/plugins/word/clinicaltrials200.txt \
--w.case ignore \
--w.summary booleanFrequency \
--summaryfile wordstest/summary \
--w.mincount 3
echo
echo "results are written to each results/words/frequencies/ directory and to the summaryfile"
echo
# the results are written into the directories
# thus target/wordstest/http_www.trialsjournal.com_content_16_1_19/ should have a new directory
# http_www.trialsjournal.com_content_16_1_19/results/word/frequencies which will contain
#   results.xml (machine-readable)
#   results.html (human-readable)
# inspect http_www.trialsjournal.com_content_16_1_19/results/word/frequencies/results.html for a word cloud
# and list all the files we have produced
ls -ltR wordstest/*/results/word/frequencies
echo
