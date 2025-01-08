part of 'profile_cubit.dart';

@freezed
class ProfileState<T> with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _LoadLoading;
  const factory ProfileState.success(T data) = _Success;
  const factory ProfileState.error(ErrorModel error) = _Error;
}
