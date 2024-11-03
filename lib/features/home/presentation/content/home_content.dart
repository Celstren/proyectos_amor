import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_activity/home_activity.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_certification/home_certification.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_donation/home_donation.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_greeting/home_greeting.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_header/home_header.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_how_help/home_how_help.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_statistics/home_statistics.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: ColorsConstant.background,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(SizeConstants.xl),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              HomeHeader(),
              SizedBox(height: SizeConstants.xl),
              HomeGreeting(),
              SizedBox(height: SizeConstants.xl),
              HomeHowHelp(),
              SizedBox(height: SizeConstants.xl),
              HomeActivity(),
              SizedBox(height: SizeConstants.xl),
              HomeCertification(),
              SizedBox(height: SizeConstants.xl),
              HomeStatistics(),
              SizedBox(height: SizeConstants.xl),
              HomeDonation(),
            ],
          ),
        ),
      ),
    );
  }
}
