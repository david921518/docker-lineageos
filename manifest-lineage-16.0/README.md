# HOW-TO Build

1) Initialize the repository

- repo init -u ssh://git@github.com/LineageOS/android.git -b lineage-16.0

2) Add my manifest to the .repo folder (don't worry about the alert you will get about being DEPRECATED)

- mkdir -p .repo/local_manifests
- cp local_manifest.xml .repo/local_manifests/

2) Sync latest LineageOS 16.0 sources

- repo sync -j20 --force-sync

3) Apply all Patches

- cd bootable/
- ln -s recovery-twrp recovery
- cd ..

4) You are good to go, proceed with the compiling process

- OPTIONAL (if you want built-in root support): export WITH_SU=true
- export WITH_TWRP=true

5) FOR GT-I9500 (ja3gxx) only. OTHERWISE, REPLACE THE CODENAME WITH OTHERS SUPPORTED (check the manifest).

- . build/envsetup.sh && lunch lineage_ja3gxx-userdebug
- brunch lineage_ja3gxx-userdebug
