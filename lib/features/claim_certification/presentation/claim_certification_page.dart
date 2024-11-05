import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/claim_certification/presentation/content/claim_certification_content.dart';

@RoutePage(name: 'ClaimCertificationPageRoute')
class ClaimCertificationPage extends StatelessWidget {
  const ClaimCertificationPage({super.key});

  @override
  Widget build(BuildContext context) => const ClaimCertificationContent();
}
