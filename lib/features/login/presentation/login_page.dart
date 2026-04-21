import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/login/logic/bloc/login_bloc/login_bloc.dart';
import 'package:proyectos_amor/features/login/presentation/content/login_content.dart';
import 'package:proyectos_amor/injection.dart';

@RoutePage(name: 'LoginPageRoute')
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: <BlocProvider>[
          BlocProvider<LoginBloc>(create: (context) => getIt<LoginBloc>()),
        ],
        child: const LoginContent(),
      );
}
