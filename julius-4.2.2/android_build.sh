#!/bin/sh
#export TARGET_DIR="$HOME/Documents/workspace/JuliusForAndroid/jni"
export TARGET_DIR="$HOME/git/JuliusForAndroid/jni"
#export NDK_ROOT="$HOME/Lib/android/android-ndk-r8b"
export NDK_ROOT="$HOME/Android/android-ndk-r8e"

export SYSROOT="$NDK_ROOT/platforms/android-8/arch-arm"
export TOOL_ROOT="$NDK_ROOT/toolchains/arm-linux-androideabi-4.4.3/prebuilt/darwin-x86_64/bin"
export ARCH_ROOT="$NDK_ROOT/platforms/android-8/arch-arm"
export CC="$TOOL_ROOT/arm-linux-androideabi-gcc -mandroid --sysroot=$SYSROOT"
export AR="$TOOL_ROOT/arm-linux-androideabi-ar"
export AS="$TOOL_ROOT/arm-linux-androideabi-as"
export LD="$TOOL_ROOT/arm-linux-androideabi-ld"
export NM="$TOOL_ROOT/arm-linux-androideabi-nm"
export RANLIB="$TOOL_ROOT/arm-linux-androideabi-ranlib"
export SIZE="$TOOL_ROOT/arm-linux-androideabi-size"
export STRIP="$TOOL_ROOT/arm-linux-androideabi-strip"
export OBJDUMP="$TOOL_ROOT/arm-linux-androideabi-objdump"
export CPPFLAGS="-I$ARCH_ROOT/usr/include/"
export CFLAGS="-nostdlib -DANDROID_CUSTOM -DANDROID_DEBUG"
export LDFLAGS="-Wl,-rpath-link=$ARCH_ROOT/usr/lib/ -L$ARCH_ROOT/usr/lib/"
export LIBS="-lc -lz -lgcc -llog"
export PATH="$PATH:$NDK_ROOT/prebuild/darwin-x86_64/bin"


#make clean
echo "ac_cv_c_bigendian=\${ac_cv_c_bigendian=yes}" > config.cache
./configure --host=arm-eabi --prefix=$TARGET_DIR
make
make install
