import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/award/presentation/content/award_content.dart';

@RoutePage(name: 'AwardPageRoute')
class AwardPage extends StatelessWidget {
  const AwardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AwardContent();
  }
}
