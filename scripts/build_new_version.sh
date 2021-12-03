VERSION=v0.1
rm -Rf ./build

# Don't run t his if the rep[os is dirty

# Update all the relevant versions
#
sed  -i "s/v[0-9]\+\.[0-9]\+/"$VERSION"/g" ./deb/agent/build.sh
sed  -i "s/v[0-9]\+\.[0-9]\+/"$VERSION"/g" ./deb/director/build.sh
sed  -i "s/v[0-9]\+\.[0-9]\+/"$VERSION"/g" ./deb/agent/control
sed  -i "s/v[0-9]\+\.[0-9]\+/"$VERSION"/g" ./deb/director/control
sed  -i "s/v[0-9]\+\.[0-9]\+/"$VERSION"/g" ./scripts/install_agent.sh
sed  -i "s/v[0-9]\+\.[0-9]\+/"$VERSION"/g" ./scripts/install_director.sh

# Tag git and push
#
git add -u
git commit -m "Version update [$VERSION]"
git tag $VERSION
git pusg --tags