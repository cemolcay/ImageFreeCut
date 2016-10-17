ImageFreeCut
===

A UIView subclass lets you draw a path over a image and crops thats part.

Demo
----

![alt tag](https://github.com/cemolcay/ImageFreeCut/raw/master/Demo.gif)

Requirements
----

* Xcode 8+
* Swift 3+
* iOS 10+

Install
----

``` ruby
use_frameworks!
pod 'ImageFreeCut'
```

Usage
----

``` swift
import ImageFreeCut
```

You can either use storyboard or create it programmatically like any UIView.  
Notice that view's class name is `ImageFreeCutView`.  

Sets the image of `ImageFreeCutView`. You are going to crop that one.
```
open var imageToCut: UIImage?
```

You can set the imageView's properties like `contentMode` directly from your `ImageFreeCutView` instance.
```
open var imageView: UIImageView!
```

You can set cut layer's properties like `strokeColor`, `fillColor`, `dashPattern` directly from your `ImageFreeCutView` instance.
```
open var imageCutShapeLayer: CAShapeLayer!
```

ImageFreeCutViewDelegate
----
Set your instance delegate and implement

```
func imageFreeCutView(_ imageFreeCutView: ImageFreeCutView, didCut image: UIImage?)
```

delegate method to retrive cropped image.
