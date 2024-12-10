import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'fetch_profile_bloc.freezed.dart';

@freezed
class FetchProfileEvent with _$FetchProfileEvent {
  const factory FetchProfileEvent.fetchProfile() = FetchProfile;
}

@freezed
class FetchProfileState with _$FetchProfileState {
  const factory FetchProfileState.fetchProfileUninitializedState() = FetchProfileUninitializedState;
  const factory FetchProfileState.fetchProfileLoadingState() = FetchProfileLoadingState;
  const factory FetchProfileState.fetchProfileSuccessState() = FetchProfileSuccessState;
  const factory FetchProfileState.fetchProfileErrorState({@Default('') String message}) = FetchProfileErrorState;
  const factory FetchProfileState.fetchProfileConnectionErrorState() = FetchProfileConnectionErrorState;
  const factory FetchProfileState.fetchProfileUnauthorizedState() = FetchProfileUnauthorizedState;
}

@injectable
class FetchProfileBloc extends Bloc<FetchProfileEvent, FetchProfileState> {
  FetchProfileBloc() : super(const FetchProfileUninitializedState()) {
    on<FetchProfileEvent>(_onFetchProfileEvent);
  }

  final authorized = true;

  void _onFetchProfileEvent(FetchProfileEvent event, Emitter<FetchProfileState> emitter) async {
    try {
      await event.when(
        fetchProfile: () async {
          emitter(const FetchProfileLoadingState());
          emitter(const FetchProfileSuccessState());
        },
      );
    } catch (e) {
      emitter(FetchProfileErrorState(message: e.toString()));
    }
  }
}
