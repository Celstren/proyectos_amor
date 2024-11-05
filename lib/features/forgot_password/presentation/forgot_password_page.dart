import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/forgot_password/presentation/content/forgot_password_content.dart';

@RoutePage(name: 'ForgotPasswordPageRoute')
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) => const ForgotPasswordContent();
}
