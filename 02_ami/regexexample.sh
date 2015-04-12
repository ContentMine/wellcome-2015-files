#!/bin/sh

# prints help
echo "==================regex================"
echo
echo help 
echo
ami2-regex
echo
rm -rf regextest/
cp -R examples/ regextest
echo
echo "running regex on regextest"
echo
ami2-regex -q regextest/ --context 25 40 --r.regex regex/consort0.xml 
echo
echo "results in QSN"
echo
ls -ltR regextest/*/results/regex/consort0/
echo
