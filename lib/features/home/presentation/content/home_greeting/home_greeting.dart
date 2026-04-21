import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/fetch_profile_bloc/fetch_profile_bloc.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';

class HomeGreeting extends StatelessWidget {
  const HomeGreeting({super.key});

  String _greetingFromState(FetchProfileState state) {
    return state.maybeWhen(
      fetchProfileSuccessState: (user) {
        final firstName = user.firstName?.trim() ?? '';
        final fullName = user.fullName;
        final name = firstName.isNotEmpty ? firstName : fullName;

        if (name.isEmpty) return HomeStrings.homeGreetingTitle;
        return 'Hola, $name';
      },
      orElse: () => HomeStrings.homeGreetingTitle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProfileBloc, FetchProfileState>(
      builder: (context, state) {
        return AppText.normal(
          _greetingFromState(state),
          fontSize: 16,
          fontColor: ColorsConstant.text950,
          textAlign: TextAlign.start,
        );
      },
    );
  }
}
