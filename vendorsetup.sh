# Create ld symlink to avoid linking error(s)
ln -s $(pwd)/prebuilts/clang/host/linux-x86/clang-r450784d/bin/lld \
    $(pwd)/prebuilts/clang/host/linux-x86/clang-r450784d/bin/ld &> /dev/null
