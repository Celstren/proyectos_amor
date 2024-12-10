import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic_holders/bloc/fetch_profile_bloc/fetch_profile_bloc.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile.dart';
import 'package:proyectos_amor/features/profile/presentation/content/unauthenticated_profile/unauthenticated_profile.dart';
import 'package:proyectos_amor/injection.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  final fetchProfileBloc = getIt<FetchProfileBloc>();

  @override
  void dispose() {
    fetchProfileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: fetchProfileBloc,
      builder: (context, state) {
        if (fetchProfileBloc.authorized) {
          return const AuthenticatedProfile();
        }
        return const UnauthenticatedProfile();
      },
    );
  }
}
