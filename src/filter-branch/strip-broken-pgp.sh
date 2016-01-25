#!/bin/bash

git filter-branch --msg-filter '
sed "/iQ.*/,/.*END PGP SIGNATURE.*/d"
' -- --all

rm -rf ./refs/original


