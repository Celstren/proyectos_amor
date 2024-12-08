import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_strings.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/donate_copy_item.dart';

class PhoneNumberContent extends StatelessWidget {
  const PhoneNumberContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const DonateCopyItem(
      label: DonateMoneyStrings.phoneNumberContentLabel,
      text: '965 432 124',
    );
  }
}
