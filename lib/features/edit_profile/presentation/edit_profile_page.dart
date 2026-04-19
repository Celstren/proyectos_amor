import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/fetch_profile_bloc/fetch_profile_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/profile_picture_bloc/profile_picture_bloc.dart';
import 'package:proyectos_amor/features/edit_profile/logic/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:proyectos_amor/features/edit_profile/presentation/content/edit_profile_content.dart';
import 'package:proyectos_amor/injection.dart';

@RoutePage(name: 'EditProfilePageRoute')
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<FetchProfileBloc>(
            create: (_) => getIt<FetchProfileBloc>()),
        BlocProvider<EditProfileBloc>(
            create: (_) => getIt<EditProfileBloc>()),
        BlocProvider<ProfilePictureBloc>(
            create: (_) => ProfilePictureBloc()),
      ],
      child: const EditProfileContent(),
    );
  }
}
