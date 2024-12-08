import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_images.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_strings.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/donate_money_step_cubit/donate_money_step_cubit.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/enable_donation_certification_cubit/enable_donation_certification_cubit.dart';

class UploadVoucher extends StatelessWidget {
  final DonateMoneyStepCubit donateMoneyStepCubit;
  final EnableDonationCertificationCubit enableDonationCertificationCubit;
  const UploadVoucher({super.key, required this.donateMoneyStepCubit, required this.enableDonationCertificationCubit});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        donateMoneyStepCubit.change(DonateMoneyStep.howToDonate);
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const AppText.normal(
              DonateMoneyStrings.uploadVoucherTitle,
              fontColor: ColorsConstant.splashPrimaryFontColor,
              fontSize: 12,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 108,
              child: Stack(
                children: <Widget>[
                  AppImage.assetSvg(
                    asset: DonateMoneyImages.uploadVoucherBackground,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 32,
                          width: 32,
                          child: Center(
                            child: AppImage.assetSvg(
                              asset: DonateMoneyImages.uploadVoucherIcon,
                              size: 24,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        AppText.normal(
                          DonateMoneyStrings.uploadVoucherFormats,
                          fontColor: ColorsConstant.splashPrimaryFontColor,
                          fontSize: 12,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4),
                        AppText.semiBold(
                          DonateMoneyStrings.uploadVoucherUpload,
                          fontColor: ColorsConstant.textLink,
                          fontSize: 12,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const AppTextField(hint: DonateMoneyStrings.uploadVoucherHint),
            const SizedBox(height: 32),
            BlocBuilder(
              bloc: enableDonationCertificationCubit,
              builder: (context, bool enabledState) => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => enableDonationCertificationCubit.change(!enabledState),
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 24,
                          width: 24,
                          decoration: enabledState ? BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorsConstant.primaryColor
                          ) : BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: ColorsConstant.textPlaceholder,
                              width: 1.5,
                            ),
                          ),
                          child: enabledState ? const Center(
                            child: Icon(
                              Icons.check,
                              size: 14,
                              color: ColorsConstant.neutralWhite,
                            ),
                          ) : null,
                        ),
                        const SizedBox(width: 16),
                        const AppText.normal(
                          DonateMoneyStrings.uploadVoucherEnableCertification,
                          fontSize: 12,
                          fontColor: ColorsConstant.splashPrimaryFontColor,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  if (enabledState)
                    ...[
                      const SizedBox(height: 24),
                      const AppTextField(hint: DonateMoneyStrings.uploadVoucherRUCHint),
                      const SizedBox(height: 24),
                      const AppTextField(hint: DonateMoneyStrings.uploadVoucherCompanyHint),
                    ],
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
