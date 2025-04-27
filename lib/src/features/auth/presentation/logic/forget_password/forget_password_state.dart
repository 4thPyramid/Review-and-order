import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/errors/error_model.dart';
part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = _Initial;
  const factory ForgetPasswordState.loading() = _Loading;
  const factory ForgetPasswordState.loaded(String message) = _Loaded;
  const factory ForgetPasswordState.error(ErrorModel message) = _Error;

  const factory ForgetPasswordState.verifyCodeLoading() = _VerifyCodeLoading;
  const factory ForgetPasswordState.verifyCodeLoaded(String message) =
      _VerifyCodeLoaded;
  const factory ForgetPasswordState.verifyCodeerror(ErrorModel message) =
      _VerifyCodeError;

  const factory ForgetPasswordState.resetPasswordLoading() =
      _ResetPasswordLoading;
  const factory ForgetPasswordState.resetPasswordLoaded(String message) =
      _ResetPasswordLoaded;
  const factory ForgetPasswordState.resetPasswordError(ErrorModel message) =
      _ResetPasswordError;
}
