import 'package:app_ui/app_image/app_icon_path.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double height;
  final double width;
  final double? size;
  final String asset;
  final Color? color;

  const AppIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = '',
    this.color,
  });

  const AppIcon.annotationIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.annotationIcon,
    this.color,
  });

  const AppIcon.announcementIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.announcementIcon,
    this.color,
  });

  const AppIcon.arrowLeftIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.arrowLeftIcon,
    this.color,
  });

  const AppIcon.awardIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.awardIcon,
    this.color,
  });

  const AppIcon.barChartIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.barChartIcon,
    this.color,
  });

  const AppIcon.bellIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.bellIcon,
    this.color,
  });

  const AppIcon.bellPlusIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.bellPlusIcon,
    this.color,
  });

  const AppIcon.calendarIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.calendarIcon,
    this.color,
  });

  const AppIcon.cameraPlusIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.cameraPlusIcon,
    this.color,
  });

  const AppIcon.checkIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.checkIcon,
    this.color,
  });

  const AppIcon.chevronDownIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.chevronDownIcon,
    this.color,
  });

  const AppIcon.chevronLeftIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.chevronLeftIcon,
    this.color,
  });

  const AppIcon.chevronSelectorVerticalIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.chevronSelectorVerticalIcon,
    this.color,
  });

  const AppIcon.clapsIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.clapsIcon,
    this.color,
  });

  const AppIcon.clock({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.clockIcon,
    this.color,
  });

  const AppIcon.clockFastForwardIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.clockFastForwardIcon,
    this.color,
  });

  const AppIcon.closeIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.closeIcon,
    this.color,
  });

  const AppIcon.coinsHandIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.coinsHandIcon,
    this.color,
  });

  const AppIcon.coinsIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.coinsIcon,
    this.color,
  });

  const AppIcon.coinsStackedIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.coinsStackedIcon,
    this.color,
  });

  const AppIcon.commandIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.commandIcon,
    this.color,
  });

  const AppIcon.copyIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.copyIcon,
    this.color,
  });

  const AppIcon.dotsVerticalIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.dotsVerticalIcon,
    this.color,
  });

  const AppIcon.editIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.editIcon,
    this.color,
  });

  const AppIcon.faceIdIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.faceIdIcon,
    this.color,
  });

  const AppIcon.filterIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.filterIcon,
    this.color,
  });

  const AppIcon.fingerprintIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.fingerprintIcon,
    this.color,
  });

  const AppIcon.flipBackwardIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.flipBackwardIcon,
    this.color,
  });

  const AppIcon.globeIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.globeIcon,
    this.color,
  });

  const AppIcon.hearthIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.hearthIcon,
    this.color,
  });

  const AppIcon.helpIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.helpIcon,
    this.color,
  });

  const AppIcon.homeIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.homeIcon,
    this.color,
  });

  const AppIcon.imageCircularIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.imageCircularIcon,
    this.color,
  });

  const AppIcon.imageIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.imageIcon,
    this.color,
  });

  const AppIcon.infoIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.infoIcon,
    this.color,
  });

  const AppIcon.layoutIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.layoutIcon,
    this.color,
  });

  const AppIcon.lifeBuoyIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.lifeBuoyIcon,
    this.color,
  });
  const AppIcon.linkIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.linkIcon,
    this.color,
  });

  const AppIcon.lockCircleIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.lockCircleIcon,
    this.color,
  });

  const AppIcon.lockIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.lockIcon,
    this.color,
  });

  const AppIcon.logoutIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.logoutIcon,
    this.color,
  });

  const AppIcon.mailIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.mailIcon,
    this.color,
  });

  const AppIcon.messageCircleIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.messageCircleIcon,
    this.color,
  });

  const AppIcon.playIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.playIcon,
    this.color,
  });

  const AppIcon.plusIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.plusIcon,
    this.color,
  });

  const AppIcon.protectedIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.protectedIcon,
    this.color,
  });

  const AppIcon.scanIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.scanIcon,
    this.color,
  });

  const AppIcon.searchIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.searchIcon,
    this.color,
  });

  const AppIcon.sendIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.sendIcon,
    this.color,
  });

  const AppIcon.settingsIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.settingsIcon,
    this.color,
  });

  const AppIcon.sharedCurvedIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.sharedCurvedIcon,
    this.color,
  });

  const AppIcon.sharedIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.sharedIcon,
    this.color,
  });

  const AppIcon.shoppingIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.shoppingIcon,
    this.color,
  });

  const AppIcon.shoppingLiftedIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.shoppingLiftedIcon,
    this.color,
  });

  const AppIcon.swimmingIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.swimmingIcon,
    this.color,
  });

  const AppIcon.thumbsUpIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.thumbsUpIcon,
    this.color,
  });

  const AppIcon.ticketIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.ticketIcon,
    this.color,
  });

  const AppIcon.userIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.userIcon,
    this.color,
  });

  const AppIcon.videoIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.videoIcon,
    this.color,
  });

  const AppIcon.visibilityOffIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.visibilityOffIcon,
    this.color,
  });

  const AppIcon.visibilityOnIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.visibilityOnIcon,
    this.color,
  });

  const AppIcon.waterpoloIcon({
    super.key,
    this.height = 24,
    this.width = 24,
    this.size,
    this.asset = AppIconPath.waterpoloIcon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AppImage.assetSvg(
      height: height,
      width: width,
      size: size,
      asset: asset,
      color: color,
      fit: BoxFit.contain,
    );
  }
}
