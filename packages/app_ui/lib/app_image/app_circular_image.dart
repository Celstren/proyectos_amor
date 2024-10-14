import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum ImageProviderType { network, asset, file }

class AppCircularImage extends StatelessWidget {
  final double height;
  final double width;
  final double? size;
  final String asset;
  final ImageProviderType providerType;
  final Color? background;
  final Border? border;
  final EdgeInsetsGeometry? padding;
  final BoxFit? fit;

  const AppCircularImage({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.providerType = ImageProviderType.asset,
    this.asset = '',
    this.background,
    this.border,
    this.padding,
    this.fit,
  }) : assert(asset != '', 'Asset name cannot be empty');

  const AppCircularImage.asset({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.providerType = ImageProviderType.asset,
    this.asset = '',
    this.background,
    this.border,
    this.padding,
    this.fit,
  }) : assert(asset != '', 'Asset name cannot be empty');

  const AppCircularImage.file({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.providerType = ImageProviderType.file,
    this.asset = '',
    this.background,
    this.border,
    this.padding,
    this.fit,
  }) : assert(asset != '', 'Asset name cannot be empty');

  const AppCircularImage.network({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.providerType = ImageProviderType.network,
    this.asset = '',
    this.background,
    this.border,
    this.padding,
    this.fit,
  }) : assert(asset != '', 'Asset name cannot be empty');

  @override
  Widget build(BuildContext context) {
    ImageProvider provider = AssetImage(asset);
    switch(providerType) {
      case ImageProviderType.network:
        provider = CachedNetworkImageProvider(asset);
      case ImageProviderType.asset:
        provider = AssetImage(asset);
      case ImageProviderType.file:
        provider = FileImage(File(asset));
    }
    return Container(
      width: size ?? width,
      height: size ?? height,
      padding: padding,
      decoration: BoxDecoration(
        color: background,
        border: border,
        shape: BoxShape.circle,
        image: DecorationImage(image: provider, fit: fit),
      ),
    );
  }
}
