// logout cubit 

import 'package:bloc/bloc.dart';
import 'package:review_app/src/features/auth/presentation/logic/logout/logout_state.dart';

import '../../../domain/usecase/logout_use_case.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;

  LogoutCubit(this.logoutUseCase) : super(LogoutInitial());

  void logout() async {
    emit(LogoutLoading());
    final result = await logoutUseCase.call();
    result.fold(
      (error) => emit(LogoutError( errorMessage: error)),
      (response) => emit(LogoutSuccess(message: response)),
    );
  }
}