#!/bin/bash

# This is a very naive script, it doesn't do grouping and returns all branches
# I only really care about branches that have not seen commits in two months
#
# I am hoping to find some time to write a tool that can output these reports for me
# In the meantime, I am using this

echo "Merged branches"
for branch in `git branch -r --merged | grep -v HEAD`;do echo -e `git log --no-merges -n 1 --format="%ci, %cr, %an, %ae, "  $branch | head -n 1` \\t$branch; done | sort -r

echo ""
echo "Not merged branches"
for branch in `git branch -r --no-merged | grep -v HEAD`;do echo -e `git log --no-merges -n 1 --format="%ci, %cr, %an, %ae, " $branch | head -n 1` \\t$branch; done | sort -r
