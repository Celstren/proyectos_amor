import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/profile_picture_bloc/profile_picture_bloc.dart';
import 'package:proyectos_amor/features/edit_profile/edit_profile_strings.dart';
import 'package:proyectos_amor/features/edit_profile/logic/bloc/edit_profile_bloc/edit_profile_bloc.dart';

class EditProfileBottom extends StatelessWidget {
  const EditProfileBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        state.maybeWhen(
          editProfileSuccessState: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Perfil actualizado con éxito'),
                backgroundColor: Colors.green,
              ),
            );
          },
          editProfileErrorState: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state is EditProfileLoadingState;

        return Padding(
          padding: const EdgeInsets.all(18),
          child: AppButton.solid(
            text: isLoading ? 'Guardando...' : EditProfileStrings.editProfileBottomPrimaryButton,
            radius: 56,
            onTap: isLoading
                ? null
                : () {
                    final pictureState = context.read<ProfilePictureBloc>().state;
                    final newImage = pictureState.maybeWhen(
                      success: (file) => file,
                      orElse: () => null,
                    );
                    
                    context.read<EditProfileBloc>().add(
                          EditProfileEvent.updateProfile(newImage: newImage),
                        );
                  },
          ),
        );
      },
    );
  }
}
