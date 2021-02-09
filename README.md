# XCFramework Container Transformer

[![ci][1]][2]

This iOS only transformer will build the container and package it as an [XCFramework](3) for distribution.\
It can be used in conjunction with the [cocoapod git publisher](4) to publish it as a CocoaPod to a git repository, so that any client mobile application can add the container as a pod dependency in their Podfile.

The script executed to build the container and generate the xcframework is not customizable.\
Based on needs, future updates of this transformer might introduce additional customization.

## Inputs

- `containerPath` : Path to the Container to transform
## Usage

### With `ern transform-container` CLI command

```sh
ern transform-container --containerPath [pathToContainer] -t xcframework
```
### With Cauldron

To automatically transform the Cauldron generated Containers of a target native application and platform, you can add a transformer entry in the Cauldron in the Container generator configuration object as follow :

#### Electrode Native <= 0.31

```json
"transformers": [
  {
    "name": "xcframework"
  }
]
```

#### Electrode Native >= 0.32

```json
"pipeline": [
  {
    "name": "xcframework"
  }
]
```

### Programmatically

```typescript
import ScriptTransformer from 'ern-container-transformer-xcframework'
const transformer = new XCFrameworkTransformer()
transformer.transform(
  {
    /* Local file system path to the Container */
    containerPath: string
  }
})
```

[1]: https://github.com/electrode-io/ern-container-transformer-xcframework/workflows/ci/badge.svg
[2]: https://github.com/electrode-io/ern-container-transformer-xcframework/actions
[3]: https://developer.apple.com/videos/play/wwdc2019/416/
[4]: https://github.com/electrode-io/ern-container-publisher-cocoapod-git/actions
