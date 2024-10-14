import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType { svg, image }

enum ImageProviderType { network, asset }

class AppImage extends StatelessWidget {
  final double height;
  final double width;
  final double? size;
  final String asset;
  final ImageType type;
  final ImageProviderType providerType;
  final Color? color;
  final BoxFit? fit;
  final ColorFilter? colorFilter;
  final String? errorAsset;

  const AppImage({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.type = ImageType.image,
    this.providerType = ImageProviderType.asset,
    this.asset = '',
    this.color,
    this.fit,
    this.colorFilter,
    this.errorAsset,
  });

  const AppImage.assetImage({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.type = ImageType.image,
    this.providerType = ImageProviderType.asset,
    this.asset = '',
    this.color,
    this.fit,
    this.colorFilter,
    this.errorAsset,
  });

  const AppImage.assetSvg({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.type = ImageType.svg,
    this.providerType = ImageProviderType.asset,
    this.asset = '',
    this.color,
    this.fit,
    this.colorFilter,
    this.errorAsset,
  });

  const AppImage.network({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.type = ImageType.image,
    this.providerType = ImageProviderType.network,
    this.asset = '',
    this.color,
    this.fit,
    this.colorFilter,
    this.errorAsset = 'packages/app_ui/assets/images/avatar_placeholder.png',
  });

  @override
  Widget build(BuildContext context) {
    if (asset.isEmpty) {
      return Image.asset(
        'packages/app_ui/assets/images/image_placeholder.png',
        width: size ?? width,
        height: size ?? height,
        color: color,
        fit: fit,
      );
    }
    return providerType == ImageProviderType.asset
        ? (type == ImageType.svg
            ? SvgPicture.asset(
                asset,
                width: size ?? width,
                height: size ?? height,
                fit: fit ?? BoxFit.contain,
                colorFilter: colorFilter ??
                    (color != null
                        ? ColorFilter.mode(color!, BlendMode.srcIn)
                        : null),
              )
            : Image.asset(
                asset,
                width: size ?? width,
                height: size ?? height,
                color: color,
                fit: fit,
              ))
        : (colorFilter != null
            ? ColorFiltered(
                colorFilter: colorFilter!,
                child: FadeInImage(
                  width: size ?? width,
                  height: size ?? height,
                  fit: fit,
                  placeholder: const AssetImage(
                      'packages/app_ui/assets/images/image_placeholder.png'),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                  image: CachedNetworkImageProvider(asset),
                  color: color,
                ),
              )
            : FadeInImage(
                width: size ?? width,
                height: size ?? height,
                fit: fit,
                placeholder: const AssetImage(
                  'packages/app_ui/assets/images/image_placeholder.png',
                ),
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.asset(
                      errorAsset ?? 'packages/app_ui/assets/images/image_placeholder.png',
                      width: size ?? width,
                      height: size ?? height,
                      color: color,
                      fit: fit,
                    ),
                image: CachedNetworkImageProvider(asset),
                color: color,
              ));
  }
}
