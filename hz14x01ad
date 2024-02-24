rm -rf .repo/local_manifests
# Clone local_manifests repository
repo init --depth=1 -u https://github.com/HorizonDroidLab/manifest.git -b 14 --git-lfs
git clone https://github.com/Wrdn28/local_manifest --depth 1 -b HZ-14 .repo/local_manifests
# Sync the repositories
repo sync -c -j$(nproc --all) --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync 
# Set up build environment
export BUILD_HOSTNAME=crave
export BUILD_USERNAME=Hirokixd
export TZ=Asia/Jakarta 
source build/envsetup.sh
# Lunch configuration
lunch aosp_ginkgo-userdebug
# Build the ROM
make clean
mka bacon
