import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/claim_certification/presentation/content/claim_certification_bottom/claim_certification_bottom.dart';
import 'package:proyectos_amor/features/claim_certification/presentation/content/claim_certification_description/claim_certification_description.dart';
import 'package:proyectos_amor/features/claim_certification/presentation/content/claim_certification_header/claim_certification_header.dart';

class ClaimCertificationContent extends StatefulWidget {
  const ClaimCertificationContent({super.key});

  @override
  State<ClaimCertificationContent> createState() => _ClaimCertificationContentState();
}

class _ClaimCertificationContentState extends State<ClaimCertificationContent> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClaimCertificationHeader(),
          Expanded(child: ClaimCertificationDescription()),
          ClaimCertificationBottom(),
        ],
      ),
    );
  }
}
