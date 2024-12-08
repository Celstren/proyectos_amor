import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_strings.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/donate_copy_item.dart';

class BankAccountContent extends StatelessWidget {
  const BankAccountContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        DonateCopyItem(
          label: DonateMoneyStrings.bankAccountContentLabel1,
          text: '102-232-23-23-2-332',
        ),
        SizedBox(height: 16),
        DonateCopyItem(
          label: DonateMoneyStrings.bankAccountContentLabel2,
          text: '102-232-23-23-2-332',
        ),
      ],
    );
  }
}
