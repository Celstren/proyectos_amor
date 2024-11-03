import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/award/award_images.dart';
import 'package:proyectos_amor/features/award/presentation/content/award_list/award_list_item.dart';

class AwardList extends StatelessWidget {
  const AwardList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      runSpacing: 10,
      spacing: 10,
      alignment: WrapAlignment.center,
      children: <Widget>[
        AwardListItem(
          asset: AwardImages.awardOne,
          assetEarned: AwardImages.awardOneEarned,
          name: 'Regalo flash',
          earned: true,
        ),
        AwardListItem(
          asset: AwardImages.awardTwo,
          assetEarned: AwardImages.awardTwoEarned,
          name: 'Nombre de insignia',
        ),
        AwardListItem(
          asset: AwardImages.awardThree,
          assetEarned: AwardImages.awardThreeEarned,
          name: 'Nombre de insignia',
        ),
        AwardListItem(
          asset: AwardImages.awardFour,
          assetEarned: AwardImages.awardFourEarned,
          name: 'Nombre de insignia',
        ),
        AwardListItem(
          asset: AwardImages.awardFive,
          assetEarned: AwardImages.awardFiveEarned,
          name: 'Nombre de insignia',
        ),
        AwardListItem(
          asset: AwardImages.awardSix,
          assetEarned: AwardImages.awardSixEarned,
          name: 'Nombre de insignia',
          earned: true,
        ),
        AwardListItem(
          asset: AwardImages.awardSeven,
          assetEarned: AwardImages.awardSevenEarned,
          name: 'Nombre de insignia',
          earned: true,
        ),
        AwardListItem(
          asset: AwardImages.awardEight,
          assetEarned: AwardImages.awardEightEarned,
          name: 'Nombre de insignia',
          earned: true,
        ),
        AwardListItem(
          asset: AwardImages.awardNine,
          assetEarned: AwardImages.awardNineEarned,
          name: 'Nombre de insignia',
        ),
        AwardListItem(
          asset: AwardImages.awardTen,
          assetEarned: AwardImages.awardTenEarned,
          name: 'Nombre de insignia',
          earned: true,
        ),
        AwardListItem(
          asset: AwardImages.awardEleven,
          assetEarned: AwardImages.awardElevenEarned,
          name: 'Nombre de insignia',
        ),
        AwardListItem(
          asset: AwardImages.awardTwelve,
          assetEarned: AwardImages.awardTwelveEarned,
          name: 'Nombre de insignia',
        ),
        AwardListItem(
          asset: AwardImages.awardThirteen,
          assetEarned: AwardImages.awardThirteenEarned,
          name: 'Nombre de insignia',
        ),
      ],
    );
  }
}
