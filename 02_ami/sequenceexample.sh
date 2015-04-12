#! /bin/sh

rm -rf sequencetest
cp -r examples2 sequencetest
ami2-sequence --sq.sequence --sq.length "{6,20}" --context 35 50 --sq.type dna prot -q sequencetest/plosjournal.pone.0121780_sequence -i scholarly.html
