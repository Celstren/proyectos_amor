import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyectos_amor/config/helpers/image_helper.dart';

part 'profile_picture_bloc.freezed.dart';

@freezed
class ProfilePictureEvent with _$ProfilePictureEvent {
  const factory ProfilePictureEvent.pickImage({required ImageSource source}) = PickImage;
  const factory ProfilePictureEvent.clear() = Clear;
}

@freezed
class ProfilePictureState with _$ProfilePictureState {
  const factory ProfilePictureState.initial() = _Initial;
  const factory ProfilePictureState.loading() = _Loading;
  const factory ProfilePictureState.success(File file) = _Success;
  const factory ProfilePictureState.error(String message) = _Error;
}

/// [ProfilePictureBloc] manages the selection and optimization of the profile image.
/// It handles picking an image from the camera or gallery and applies 
/// compression logic via [ImageHelper].
class ProfilePictureBloc extends Bloc<ProfilePictureEvent, ProfilePictureState> {
  ProfilePictureBloc() : super(const ProfilePictureState.initial()) {
    on<PickImage>(_onPickImage);
    on<Clear>(_onClear);
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> _onPickImage(
    PickImage event,
    Emitter<ProfilePictureState> emitter,
  ) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: event.source,
        imageQuality: 70,
      );

      if (pickedFile == null) return;

      emitter(const ProfilePictureState.loading());

      final optimizedFile = await ImageHelper.getOptimizedImage(
        File(pickedFile.path),
      );

      if (optimizedFile != null) {
        emitter(ProfilePictureState.success(optimizedFile));
      } else {
        emitter(const ProfilePictureState.error(
          'The image is too large and could not be optimized. Please select another.',
        ));
      }
    } catch (e) {
      emitter(ProfilePictureState.error(e.toString()));
    }
  }

  void _onClear(
    Clear event,
    Emitter<ProfilePictureState> emitter,
  ) {
    emitter(const ProfilePictureState.initial());
  }
}
