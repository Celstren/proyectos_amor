import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyectos_amor/features/create_account/create_account_images.dart';
import 'package:proyectos_amor/features/create_account/create_account_strings.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/profile_picture_bloc/profile_picture_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic/cubit/change_create_account_cubit/change_create_account_step_cubit.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_bottom/create_account_bottom.dart';

class CreateAccountPicture extends StatelessWidget {
  const CreateAccountPicture({super.key});

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (contextBottomSheet) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galería'),
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
                title: const Text('Cámara'),
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
    return BlocListener<ProfilePictureBloc, ProfilePictureState>(
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
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConstants.xl + MediaQuery.of(context).viewPadding.top,
          left: SizeConstants.xl,
          right: SizeConstants.xl,
          bottom: SizeConstants.xl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const AppRichText(
              primaryText: CreateAccountStrings.createAccountPictureTitle1,
              primaryFontColor: ColorsConstant.splashPrimaryFontColor,
              primaryFontSize: 24,
              primaryFontWeight: FontWeight.w700,
              secondaryText:
                  ' ${CreateAccountStrings.createAccountPictureTitle2}',
              secondaryFontColor: ColorsConstant.splashSecondaryFontColor,
              secondaryFontSize: 24,
              secondaryFontWeight: FontWeight.w700,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: SizeConstants.xl),
            const AppText.normal(
              CreateAccountStrings.createAccountPictureSubTitle,
              fontColor: ColorsConstant.text950,
              fontSize: 12,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 56),
            Center(
              child: GestureDetector(
                onTap: () => _showImageSourceActionSheet(context),
                behavior: HitTestBehavior.opaque,
                child: SizedBox(
                  height: 240,
                  width: 240,
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
                        orElse: () => const Stack(
                          children: <Widget>[
                            Center(
                              child: AppImage.assetSvg(
                                asset: CreateAccountImages
                                    .createAccountProfileCircle,
                                color: ColorsConstant.text400,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Center(
                              child: AppIcon.cameraPlusIcon(
                                size: 24,
                                color: ColorsConstant.text400,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewPadding.bottom,
              ),
              child: CreateAccountBottom(
                onBack: () => context
                    .read<ChangeCreateAccountStepCubit>()
                    .change(CreateAccountStep.about),
                onLater: () => context
                    .read<ChangeCreateAccountStepCubit>()
                    .change(CreateAccountStep.personal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
