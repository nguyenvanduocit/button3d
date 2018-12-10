# button3d

This package provide an simple 3D button.

<img src="https://cdn-images-1.medium.com/max/1600/1*cm7XzQ3Hc3eNJ8Eae7V4bQ.png" width="300">

## Getting Started

Import the file.

```
import 'package:button3d/button3d.dart';
```

### Use with default style:

```
Button3d(
  style: Button3dStyle.BLUE, // Button3dStyle.RED, Button3dStyle.WHITE
  onPressed: () {},
  child: Text("Add"),
);
```

### Use with custom style:

```
Button3d(
  style: Button3dStyle(
      topColor: Colors.lightGreen,
      backColor: Colors.deepOrange,
      borderRadius: BorderRadius.zero
  ),
  onPressed: () {},
  child: Text("Add"),
);
```