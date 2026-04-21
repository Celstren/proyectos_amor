import 'dart:io';

import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/config/file_extension.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_images.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_strings.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/donate_money_step_cubit/donate_money_step_cubit.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/enable_donation_certification_cubit/enable_donation_certification_cubit.dart';

class UploadVoucher extends StatelessWidget {
  final TextEditingController amountController;
  final TextEditingController certificationRucController;
  final TextEditingController certificationCompanyController;
  final List<File> selectedFiles;
  final VoidCallback onPickFiles;
  final ValueChanged<File> onRemoveFile;

  const UploadVoucher({
    super.key,
    required this.amountController,
    required this.certificationRucController,
    required this.certificationCompanyController,
    required this.selectedFiles,
    required this.onPickFiles,
    required this.onRemoveFile,
  });

  IconData _iconFor(File file) {
    if (file.isImage) {
      return Icons.image_outlined;
    }
    if (file.isVideo) {
      return Icons.perm_media_outlined;
    }
    return Icons.description_outlined;
  }

  String _fileName(File file) => file.path.split('/').last;

  String _fileType(File file) {
    final fileName = _fileName(file);
    final hasExtension = fileName.contains('.') && !fileName.endsWith('.');
    final extension =
        hasExtension ? file.normalizedExtension.toUpperCase() : '';
    return extension.isNotEmpty ? 'Tipo: $extension' : 'Tipo: DOCUMENTO';
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context
            .read<DonateMoneyStepCubit>()
            .change(DonateMoneyStep.howToDonate);
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
            GestureDetector(
              onTap: onPickFiles,
              behavior: HitTestBehavior.opaque,
              child: const SizedBox(
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
            ),
            if (selectedFiles.isNotEmpty) ...[
              const SizedBox(height: 16),
              ...selectedFiles.map(
                (file) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: ColorsConstant.neutralWhite,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: ColorsConstant.textPlaceholder.withValues(
                          alpha: .35,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: ColorsConstant.primaryColor.withValues(
                              alpha: .08,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            _iconFor(file),
                            color: ColorsConstant.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              AppText.semiBold(
                                _fileName(file),
                                fontColor:
                                    ColorsConstant.splashPrimaryFontColor,
                                fontSize: 12,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 4),
                              AppText.normal(
                                _fileType(file),
                                fontColor: ColorsConstant.textPlaceholder,
                                fontSize: 11,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => onRemoveFile(file),
                          icon: const Icon(
                            Icons.close,
                            color: ColorsConstant.text400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 32),
            AppTextField(
              controller: amountController,
              hint: DonateMoneyStrings.uploadVoucherHint,
              textInputType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            const SizedBox(height: 32),
            BlocBuilder<EnableDonationCertificationCubit, bool>(
              builder: (context, bool enabledState) => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => context
                        .read<EnableDonationCertificationCubit>()
                        .change(!enabledState),
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 24,
                          width: 24,
                          decoration: enabledState
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: ColorsConstant.primaryColor)
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: ColorsConstant.textPlaceholder,
                                    width: 1.5,
                                  ),
                                ),
                          child: enabledState
                              ? const Center(
                                  child: Icon(
                                    Icons.check,
                                    size: 14,
                                    color: ColorsConstant.neutralWhite,
                                  ),
                                )
                              : null,
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
                  if (enabledState) ...[
                    const SizedBox(height: 24),
                    AppTextField(
                      controller: certificationRucController,
                      hint: DonateMoneyStrings.uploadVoucherRUCHint,
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      controller: certificationCompanyController,
                      hint: DonateMoneyStrings.uploadVoucherCompanyHint,
                    ),
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
