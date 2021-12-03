VERSION=0.3
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
git push --tags