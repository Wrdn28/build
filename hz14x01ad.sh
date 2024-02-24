rm -rf .repo/local_manifests
# Clone local_manifests repository
repo init --depth=1 -u https://github.com/HorizonDroidLab/manifest.git -b 14 --git-lfs
git clone https://github.com/Wrdn28/local_manifest --depth 1 -b HZ-14 .repo/local_manifests
# Sync the repositories
repo sync -c -j$(nproc --all) --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync 
# Set up build environment
export BUILD_HOSTNAME=crave
export BUILD_USERNAME=Hirokixd
export BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES=true
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE=true
export BUILD_BROKEN_CLANG_PROPERTY=true
export BUILD_BROKEN_CLANG_ASFLAGS=true
export BUILD_BROKEN_CLANG_CFLAGS=true
export BUILD_BROKEN_PYTHON_IS_PYTHON2=true
export BUILD_BROKEN_USES_SOONG_PYTHON2_MODULES=true
export TZ=Asia/Jakarta
source build/envsetup.sh
# Lunch configuration
lunch aosp_ginkgo-userdebug
# Build the ROM
make clean
mka bacon
