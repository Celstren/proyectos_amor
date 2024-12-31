import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/delete_account/delete_account_strings.dart';

class DeleteAccountMessage extends StatelessWidget {
  const DeleteAccountMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppRichText(
            primaryText: DeleteAccountStrings.deleteAccountTitle1,
            primaryFontColor: ColorsConstant.splashPrimaryFontColor,
            primaryFontSize: 20,
            secondaryText: DeleteAccountStrings.deleteAccountTitle2,
            secondaryFontColor: ColorsConstant.secondaryFontColor,
            secondaryFontSize: 20,
            ternaryText: DeleteAccountStrings.deleteAccountTitle3,
            ternaryFontColor: ColorsConstant.splashPrimaryFontColor,
            ternaryFontSize: 20,
          ),
          SizedBox(height: 12),
          AppText.normal(
            DeleteAccountStrings.deleteAccountSubTitle,
            fontColor: ColorsConstant.splashPrimaryFontColor,
            fontSize: 14,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 24),
          AppText.normal(
            DeleteAccountStrings.deleteAccountDescriptionTitle,
            fontColor: ColorsConstant.splashPrimaryFontColor,
            fontSize: 14,
            textAlign: TextAlign.start,
          ),
          AppText.normal(
            DeleteAccountStrings.deleteAccountDescriptionContent,
            fontColor: ColorsConstant.splashPrimaryFontColor,
            fontSize: 14,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
