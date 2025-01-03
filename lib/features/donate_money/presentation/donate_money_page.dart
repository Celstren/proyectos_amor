import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/donate_money_content.dart';

@RoutePage(name: 'DonateMoneyPageRoute')
class DonateMoneyPage extends StatelessWidget {
  const DonateMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DonateMoneyContent();
  }
}
