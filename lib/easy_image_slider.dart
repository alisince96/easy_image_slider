library easy_image_slider;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// EASY IMAGE SLIDER
class EasyImageSlider extends StatefulWidget {
  final double? height;
  final double? width;
  final List<String> images;
  final Duration? imageChangeDuration;

  /// Enter 'asset' for AssetImage 'network' for using NetworkImage,by default it is 'asset'
  final String isAssetOrNetworkImages;
  // ignore: use_key_in_widget_constructors
  const EasyImageSlider(
      {required this.images,
      this.imageChangeDuration,
      this.height,
      this.width,
      this.isAssetOrNetworkImages = 'asset'});

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
          image: widget.isAssetOrNetworkImages == 'network'
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
