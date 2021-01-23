sed -i "s/BRANCH_NAME=.*/BRANCH_NAME=$(date +%F_%H-%M-%S)/" README.md
git add . && git commit --amend --no-edit && git push -f
