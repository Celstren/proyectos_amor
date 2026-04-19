import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/fetch_profile_bloc/fetch_profile_bloc.dart';
import 'package:proyectos_amor/features/profile/logic/bloc/logout_bloc/logout_bloc.dart';
import 'package:proyectos_amor/features/profile/presentation/content/profile_content.dart';
import 'package:proyectos_amor/injection.dart';

@RoutePage(name: 'ProfilePageRoute')
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<FetchProfileBloc>(create: (_) => getIt<FetchProfileBloc>()),
        BlocProvider<LogoutBloc>(create: (_) => getIt<LogoutBloc>()),
      ],
      child: const ProfileContent(),
    );
  }
}
