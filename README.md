<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

An easy auto images slider. 

## Features

An easy auto images slider which can start automacally changing images on your desired duration. Images can be asset images or network. You can define your desired duration for changing the images. You can also set the image height and width of the images.

## Usage

A simple example of the usage of package using netowrk images

```dart
  EasyImageSlider(
              height: 200,
              width: 400,
              imageFormat: ImageFormat.network,
              images: [
                "https://plus.unsplash.com/premium_photo-1674476933026-aa7f5652af8a?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGhvdG98ZW58MHx8MHx8fDA%3D",
                "https://images.unsplash.com/photo-1494253109108-2e30c049369b?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHJhbmRvbXxlbnwwfHwwfHx8MA%3D%3D",
                "https://i.pinimg.com/736x/29/f5/be/29f5bec2b3bb61bd4b384b1e05fbd6fd.jpg",
              ]);
```


