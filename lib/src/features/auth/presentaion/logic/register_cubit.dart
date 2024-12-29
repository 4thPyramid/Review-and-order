import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/src/features/auth/data/model/register_request.dart';

import '../../../../../core/errors/error_model.dart';
import '../../domain/usecase/register_use_case.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;
  RegisterCubit(this._registerUseCase) : super(RegisterLoadingState());

  Future<void> register(RegisterAuthData registerAuthData) async {
    emit(RegisterLoadingState());
    try {
      final response = await _registerUseCase.call(registerAuthData);

      response.fold(
        (error) => emit(RegisterFailureState(errorMessage: error)),
        (userResponse) =>
            emit(RegisterSuccessState(userModel: userResponse.user)),
      );
    } catch (e) {
      emit(RegisterFailureState(
          errorMessage: ErrorModel(message: e.toString())));
    }
  }
}
