set -x
set -e

BASE_BRANCH=$1
NEW_BRANCH=$2

git checkout $BASE_BRANCH
git pull
git checkout -b $NEW_BRANCH

if [[ $NEW_BRANCH = I* ]]
then
    echo $NEW_BRACH > martini/upgrade_build_info.txt
    echo $NEW_BRACH > soar-server/upgrade_build_info.txt
    git add martini/upgrade_build_info.txt
    git add soar-server/upgrade_build_info.txt
elif [[ $NEW_BRANCH = PLT* ]]
then
    echo $NEW_BRACH > web-common/upgrade_build_info.txt
    git add web-common/upgrade_build_info.txt
fi

git commit -m "BLD-711 create $NEW_BRANCH from $BASE_BRANCH" .
git push --set-upstream origin $NEW_BRANCH


