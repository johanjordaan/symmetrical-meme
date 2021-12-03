VERSION=0.11

# Don't run this if the repos is dirty
#

# Update all the relevant versions
#
sed  -i "s/VERSION=[0-9]\+\.[0-9]\+/VERSION="$VERSION"/g" ./deb/agent/build.sh
sed  -i "s/VERSION=[0-9]\+\.[0-9]\+/VERSION="$VERSION"/g" ./deb/director/build.sh
sed -i "s/Version[ ]*:[ ]*[0-9]\+\.[0-9]\+/Version: "$VERSION"/g" ./deb/agent/control
sed -i "s/Version[ ]*:[ ]*[0-9]\+\.[0-9]\+/Version: "$VERSION"/g" ./deb/director/control
sed  -i "s/VERSION=[0-9]\+\.[0-9]\+/VERSION="$VERSION"/g" ./scripts/install_agent.sh
sed  -i "s/VERSION=[0-9]\+\.[0-9]\+/VERSION="$VERSION"/g" ./scripts/install_director.sh

sed -i "s/symmetrical-meme\/raw\/[0-9]\+\.[0-9]\+\/scripts/symmetrical-meme\/raw\/"$VERSION"\/scripts/g" README.md

sed -i "s/symmetrical-meme\/releases\/download\/[0-9]\+\.[0-9]\+\//symmetrical-meme\/releases\/download\/"$VERSION"\//g" ./scripts/install_agent.sh
sed -i "s/\.[0-9]\+\.[0-9]\+\.deb/\."$VERSION"\.deb/g" ./scripts/install_agent.sh

sed -i "s/symmetrical-meme\/releases\/download\/[0-9]\+\.[0-9]\+\//symmetrical-meme\/releases\/download\/"$VERSION"\//g" ./scripts/install_director.sh
sed -i "s/\.[0-9]\+\.[0-9]\+\.deb/\."$VERSION"\.deb/g" ./scripts/install_director.sh


# Build
#
rm -Rf ./build
source ./deb/agent/build.sh
source ./deb/director/build.sh

# Tag git and push
#
git add -u
git commit -m "Version update [$VERSION]"
git tag $VERSION
git push
git push --tags
