import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum ImageProviderType { network, asset }

class AppFadeCircularImage extends StatelessWidget {
  final double height;
  final double width;
  final double? size;
  final String asset;
  final ImageProviderType providerType;
  final Color? background;
  final BoxFit? fit;
  final String? errorAsset;
  final Border? border;

  const AppFadeCircularImage({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.providerType = ImageProviderType.asset,
    this.asset = '',
    this.background,
    this.fit,
    this.errorAsset,
    this.border,
  });

  const AppFadeCircularImage.asset({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.providerType = ImageProviderType.asset,
    this.asset = '',
    this.background,
    this.fit,
    this.errorAsset,
    this.border,
  });

  const AppFadeCircularImage.network({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.providerType = ImageProviderType.network,
    this.asset = '',
    this.background,
    this.fit,
    this.errorAsset = 'packages/app_ui/assets/images/image_placeholder.png',
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? width,
      height: size ?? height,
      decoration: BoxDecoration(
        color: background,
        border: border,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: FadeInImage(
          width: size ?? width,
          height: size ?? height,
          fit: fit,
          placeholder: const AssetImage('packages/app_ui/assets/images/image_placeholder.png'),
          imageErrorBuilder: (context, error, stackTrace) =>
              Image.asset(
                errorAsset ?? 'packages/app_ui/assets/images/image_placeholder.png',
                width: size ?? width,
                height: size ?? height,
                fit: fit,
              ),
          image: providerType == ImageProviderType.asset
              ? AssetImage(asset)
              : CachedNetworkImageProvider(asset),
        ),
      ),
    );
  }
}
