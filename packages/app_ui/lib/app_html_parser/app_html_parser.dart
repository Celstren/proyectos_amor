import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/fonts_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html_unescape/html_unescape_small.dart';

class AppHtmlParser extends StatelessWidget {
  final String htmlString;
  const AppHtmlParser({super.key, this.htmlString = ''});

  @override
  Widget build(BuildContext context) {
    var text = HtmlUnescape().convert(htmlString);
    return HtmlWidget(
      text,
      textStyle:const TextStyle(
        fontSize: 14,
        color: ColorsConstant.text600,
        fontWeight: FontWeight.normal,
        fontFamily: FontsConstant.montserrat,
        package: 'app_ui',
      ),
    );
  }
}
