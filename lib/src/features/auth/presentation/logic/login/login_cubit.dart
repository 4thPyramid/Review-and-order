import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/src/features/auth/presentation/logic/login/login_state.dart';

import '../../../../../../core/errors/error_model.dart';
import '../../../domain/usecase/login_use_case.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginCubit(this._loginUseCase) : super(InitialLoadingState());

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      final result = await _loginUseCase.call(
        email,
        password,
      );
      result.fold(
        (error) => emit(LoginFailureState(errorMessage: error)),
        (userResponse) => emit(LoginSuccessState(userModel: userResponse.user)),
      );
    } catch (e) {
      emit(LoginFailureState(errorMessage: ErrorModel(message: e.toString())));
    }
  }
}
