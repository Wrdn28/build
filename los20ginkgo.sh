rm -rf .repo/local_manifests
# Clone local_manifests repository
git clone https://github.com/HK-ginkgo/local_manifest --depth 1 -b main .repo/local_manifests
# Sync the repositories
repo sync -c -j$(nproc --all) --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync 
# Set up build environment
export BUILD_HOSTNAME=crave
export BUILD_USERNAME=Hirokixd
source build/envsetup.sh
# Lunch configuration
lunch lineage_ginkgo-userdebug
# Build the ROM
make clean
mka bacon
