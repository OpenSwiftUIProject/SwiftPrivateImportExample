# SwiftPrivateImportExample

Example project for how to use `@_private(sourceFile:)`.

## How it works

We need a module compiled with `-enable-private-imports` to be able to use private APIs in client side via `@_private(sourceFile:)`.

It will then store the information on a swiftmodule file.

> We can workaround the check by adding `-enable-private-imports` to the swiftinterface file. 
>
> But the compiler can't deserialize the private API - filename - private discriminator information from the swiftinterface file.

## Source available example / BKit

### Prepare

- Compile AKit with `-enable-private-imports` (For Xcode project, set it in `OTHER_SWIFT_FLAGS`)
- Import `AKit.framework` (with the swiftmodule file) in BKit
- Use `@_private(sourceFile:)` in BKit and compile it

## Non source SDK example / SwiftUIPrivateExample 🙅

Since we lack of `SwiftUICore.swiftmodule/*-apple-macos.swiftmodule` file in SDK, I have not found a way to use it yet.

> We can get such file in location like `/Applications/Xcode-16.1.0.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx/prebuilt-modules/15.1/SwiftUICore.swiftmodule`
>
> But it is not build with `-enable-private-imports` so some extra work is still needed. 

### Prepare

1. Patch the private SDK
```shell
./Scripts/patch_sdk.sh macosx SwiftUICore ./SDKPatches/patch.swiftinterface
```

2. Clean up module cache

````shell
rm -rf ~/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/SwiftUI-*.swiftmodule
rm -rf ~/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/SwiftUICore-*.swiftmodule
````

### Build

Build and run the project in Xcode.

### Clean up

1. Remove the SDK patch

```shell
./Scripts/unpatch_sdk.sh macosx SwiftUICore
```

2. Clean up module cache

````shell
rm -rf ~/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/SwiftUI-*.swiftmodule
rm -rf ~/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/SwiftUICore-*.swiftmodule
````
