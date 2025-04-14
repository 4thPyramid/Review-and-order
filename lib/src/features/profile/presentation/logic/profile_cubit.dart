// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:review_app/core/data/cached/cache_helper.dart';

import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/profile/data/model/profile_model.dart';
import 'package:review_app/src/features/profile/domain/usecase/get_profile_photo_uc.dart';
import 'package:review_app/src/features/profile/domain/usecase/update_profile_uc.dart';

import '../../domain/usecase/update_profile_photo.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileDataUC _getProfleDataUC;
  final UpdateProfileUc _updateProfileUc;
  final UpdateProfilePhoto _updateProfilePhotoUc;
  ProfileCubit(
    this._getProfleDataUC,
    this._updateProfileUc,
    this._updateProfilePhotoUc,
  ) : super(const ProfileState.initial());

  Future<void> getProfile() async {
    emit(const ProfileState.loading());

    final result = await _getProfleDataUC.call();
    result.fold(
      (l) => emit(ProfileState.error(l)),
      (r) => emit(ProfileState.success(r)),
    );
  }

  Future<void> updateProfile({
    String? name,
    String? phone,
    String? email,
  }) async {
    final fallbackName = CacheHelper().getDataString(key: 'name') ?? '';
    final fallbackPhone = CacheHelper().getDataString(key: 'phone') ?? '';
    final fallbackEmail = CacheHelper().getDataString(key: 'email') ?? '';
    print('=====================');
    print(fallbackName);
    print(fallbackPhone);
    print(fallbackEmail);
    final result = await _updateProfileUc.call(
      name ?? fallbackName,
      phone ?? fallbackPhone,
      email ?? fallbackEmail,
    );

    result.fold(
      (l) => emit(ProfileState.error(l)),
      (r) => emit(ProfileState.success(r)),
    );
  }

  Future<void> updateProfilePhoto(File? file) async {
    emit(const ProfileState.loading());
    final result = await _updateProfilePhotoUc.call(
      file,
    );

    result.fold(
      (l) => emit(ProfileState.error(l)),
      (r) => emit(ProfileState.success(r)),
    );
  }
}
