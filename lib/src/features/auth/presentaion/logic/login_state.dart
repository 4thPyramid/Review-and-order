import 'package:flutter/foundation.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/auth_response.dart';

@immutable
sealed class LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final User userModel;

  LoginSuccessState({required this.userModel});
}

final class LoginFailureState extends LoginState {
  final ErrorModel errorMessage;

  LoginFailureState({required this.errorMessage});
}
