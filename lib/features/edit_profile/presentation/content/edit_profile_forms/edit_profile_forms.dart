import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text_field/app_labeled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/fetch_profile_bloc/fetch_profile_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/profile_picture_bloc/profile_picture_bloc.dart';
import 'package:proyectos_amor/features/edit_profile/edit_profile_strings.dart';
import 'package:proyectos_amor/features/edit_profile/logic/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:proyectos_amor/features/profile/presentation/content/user_initials_avatar.dart';

class EditProfileForms extends StatefulWidget {
  const EditProfileForms({super.key});

  @override
  State<EditProfileForms> createState() => _EditProfileFormsState();
}

class _EditProfileFormsState extends State<EditProfileForms> {
  final _emailController = TextEditingController();
  String? _currentImageUrl;

  @override
  void initState() {
    super.initState();
    context.read<FetchProfileBloc>().add(const FetchLocalProfile());
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (contextBottomSheet) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text(EditProfileStrings.imageSourceGallery),
                onTap: () {
                  context.read<ProfilePictureBloc>().add(
                        const ProfilePictureEvent.pickImage(
                          source: ImageSource.gallery,
                        ),
                      );
                  Navigator.of(contextBottomSheet).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text(EditProfileStrings.imageSourceCamera),
                onTap: () {
                  context.read<ProfilePictureBloc>().add(
                        const ProfilePictureEvent.pickImage(
                          source: ImageSource.camera,
                        ),
                      );
                  Navigator.of(contextBottomSheet).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final editProfileBloc = context.read<EditProfileBloc>();

    return MultiBlocListener(
      listeners: [
        BlocListener<FetchProfileBloc, FetchProfileState>(
          listener: (context, state) {
            state.maybeWhen(
              fetchProfileSuccessState: (user) {
                editProfileBloc.firstNameController.text = user.firstName ?? '';
                editProfileBloc.lastNameController.text = user.lastName ?? '';
                editProfileBloc.bioController.text = user.bio ?? '';
                _emailController.text = user.email ?? '';
                setState(() {
                  _currentImageUrl = user.profileImageUrl;
                });
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<ProfilePictureBloc, ProfilePictureState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message, errorCode) {
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
        ),
      ],
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () => _showImageSourceActionSheet(context),
                behavior: HitTestBehavior.opaque,
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: BlocBuilder<ProfilePictureBloc, ProfilePictureState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () => const Center(
                          child: CircularProgressIndicator(
                            color: ColorsConstant.splashSecondaryFontColor,
                          ),
                        ),
                        success: (file) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: FileImage(file),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        orElse: () => UserInitialsAvatar(
                          firstName: editProfileBloc.firstName,
                          lastName: editProfileBloc.lastName,
                          imageUrl: _currentImageUrl,
                          size: 120,
                          bottomRight: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: ColorsConstant.neutralWhite,
                              shape: BoxShape.circle,
                            ),
                            child: const AppIcon.cameraPlusIcon(
                              size: 16,
                              color: ColorsConstant.text400,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            AppLabeledTextField(
              controller: editProfileBloc.firstNameController,
              label: EditProfileStrings.editProfileFormsFirstNameLabel,
              hint: EditProfileStrings.editProfileFormsFirstNameHint,
            ),
            const SizedBox(height: 18),
            AppLabeledTextField(
              controller: editProfileBloc.lastNameController,
              label: EditProfileStrings.editProfileFormsLastNameLabel,
              hint: EditProfileStrings.editProfileFormsLastNameHint,
            ),
            const SizedBox(height: 18),
            AppLabeledTextField(
              controller: _emailController,
              label: EditProfileStrings.editProfileFormsEmailLabel,
              hint: EditProfileStrings.editProfileFormsEmailHint,
              enabled: false,
            ),
            const SizedBox(height: 18),
            AppLabeledTextField(
              controller: editProfileBloc.bioController,
              label: EditProfileStrings.editProfileFormsBioLabel,
              hint: EditProfileStrings.editProfileFormsBioHint,
              height: 120,
              minLines: 4,
              maxLines: 4,
              textAlignVertical: TextAlignVertical.top,
            ),
          ],
        ),
      ),
    );
  }
}
