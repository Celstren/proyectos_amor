import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/code_verification/presentation/content/code_verification_content.dart';

@RoutePage(name: 'CodeVerificationPageRoute')
class CodeVerificationPage extends StatelessWidget {
  const CodeVerificationPage({super.key});

  @override
  Widget build(BuildContext context) => const CodeVerificationContent();
}
