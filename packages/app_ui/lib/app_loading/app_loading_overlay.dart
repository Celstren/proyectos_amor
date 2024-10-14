import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppLoadingOverlay extends StatelessWidget {
  final String message;
  const AppLoadingOverlay({super.key, this.message = ''});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorsConstant.neutralWhite,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
            const SizedBox(height: 12),
            AppText.normal(
              message,
              fontSize: 18,
              fontColor: ColorsConstant.skyBlue950,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class DialogLoading {
  bool _dialogOpen = false;
  String message;

  DialogLoading({this.message = ''});

  Future<void> show(BuildContext context, { bool dismissible = true, String? message}) async {
    if (!_dialogOpen) {
      _dialogOpen = true;
      await showDialog(
        context: context,
        barrierDismissible: dismissible,
        builder: (_) => AppLoadingOverlay(message: message ?? this.message),
      );
      _dialogOpen = false;
    }
  }

  Future<void> hide(BuildContext context) async {
    if (_dialogOpen) {
      Navigator.pop(context);
      _dialogOpen = false;
    }
  }
}
