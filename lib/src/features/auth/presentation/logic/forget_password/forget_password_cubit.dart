//create forget password cubit

import 'package:bloc/bloc.dart';

import '../../../domain/usecase/forget_password_use_case.dart';
import 'forget_password_state.dart';


class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
 final VerifyCodeUseCase verifyCodeUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  ForgetPasswordCubit(this.forgetPasswordUseCase, this.verifyCodeUseCase, this.resetPasswordUseCase, )
      : super(const ForgetPasswordState.initial());

  Future<void> forgetPassword(String email) async {
    if (isClosed) return;

    emit(const ForgetPasswordState.loading());
    final result = await forgetPasswordUseCase.call(email);
    result.fold(
      (error) => emit(ForgetPasswordState.error(error)),
      (message) => emit(ForgetPasswordState.loaded(message)),
    );
  }

  Future<void> verifyCode(String email, String code) async {
    if (isClosed) return;

    emit(const ForgetPasswordState.loading());
    final result = await verifyCodeUseCase.call(email, code);
    result.fold(
      (error) => emit(ForgetPasswordState.error(error)),
      (message) => emit(ForgetPasswordState.loaded(message)),
    );
  }

  Future<void> resetPassword(String email, String code, String password) async {
    if (isClosed) return;

    emit(const ForgetPasswordState.loading());
    final result = await resetPasswordUseCase.call(email, code, password);
    result.fold(
      (error) => emit(ForgetPasswordState.error(error)),
      (message) => emit(ForgetPasswordState.loaded(message)),
    );
  }
}