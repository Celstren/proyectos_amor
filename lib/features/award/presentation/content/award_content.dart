import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/award/presentation/content/award_description/award_description.dart';
import 'package:proyectos_amor/features/award/presentation/content/award_header/award_header.dart';
import 'package:proyectos_amor/features/award/presentation/content/award_list/award_list.dart';

class AwardContent extends StatefulWidget {
  const AwardContent({super.key});

  @override
  State<AwardContent> createState() => _AwardContentState();
}

class _AwardContentState extends State<AwardContent> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: ColorsConstant.background,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AwardHeader(),
              Padding(
                padding: EdgeInsets.all(SizeConstants.xl),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AwardDescription(),
                    SizedBox(height: SizeConstants.xl),
                    AwardList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

