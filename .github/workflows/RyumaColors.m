name: Build Ryuma Colors

on:
  workflow_dispatch:

jobs:
  build:
    runs-on: macos-latest

    steps:
      - uses: actions/checkout@v4

      - name: Build
        run: |
          xcrun --sdk iphoneos clang \
            -arch arm64 \
            -dynamiclib \
            -fobjc-arc \
            -miphoneos-version-min=14.0 \
            -framework UIKit \
            -framework Foundation \
            -install_name @rpath/RyumaColors.dylib \
            RyumaColors.m \
            -o RyumaColors.dylib

      - uses: actions/upload-artifact@v4
        with:
          name: RyumaColors-dylib
          path: RyumaColors.dylib
