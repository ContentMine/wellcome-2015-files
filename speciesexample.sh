#!/bin/sh

rm -rf speciestest
cp -r examples2 speciestest
ami2-species --sp.species --context 35 --sp.type binomial binomialsp -q speciestest/plosjournal.pone.0121780_sequence -i scholarly.html --lookup wikipedia
