#!/bin/bash

for i in {1..30}; do
    echo "Commit $i" > commit_$i.txt
    git add commit_$i.txt
    git commit -m "Commit $i"
done

git push origin main
