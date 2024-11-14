library easy_image_slider;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ImageFormat { asset, network }

/// EASY IMAGE SLIDER
class EasyImageSlider extends StatefulWidget {
  /// Set image height
  final double? height;

  /// Set image width
  final double? width;

  /// List of images
  final List<String> images;

  /// Set image change duration
  final Duration? imageChangeDuration;

  /// Use [imageFormat] as [ImageFormat.asset]for AssetImage
  ///Use [imageFormat] as [ImageFormat.network] for using NetworkImage,by default it is [ImageFormat.asset]
  final ImageFormat imageFormat;
  // ignore: use_key_in_widget_constructors
  const EasyImageSlider(
      {required this.images,
      this.imageChangeDuration,
      this.height,
      this.width,
      this.imageFormat = ImageFormat.asset});

  @override
  State<StatefulWidget> createState() {
    return EasyImageSliderState();
  }
}

class EasyImageSliderState extends State<EasyImageSlider> {
  Timer? _timer;
  int imageIndex = 0;

  @override
  void initState() {
    _timer = Timer.periodic(
        widget.imageChangeDuration ?? const Duration(seconds: 5), (Timer t) {
      setState(() {
        if (imageIndex > widget.images.length - 1) {
          imageIndex = 0;
        } else {
          imageIndex = (imageIndex + 1);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.height ?? MediaQuery.of(context).size.height * 0.2,
        width: widget.width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: widget.imageFormat == ImageFormat.asset
              ? DecorationImage(
                  image: NetworkImage(widget.images[
                      imageIndex > widget.images.length - 1 ? 0 : imageIndex]),
                  fit: BoxFit.fitHeight)
              : DecorationImage(
                  image: AssetImage(widget.images[
                      imageIndex > widget.images.length - 1 ? 0 : imageIndex]),
                  fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}
