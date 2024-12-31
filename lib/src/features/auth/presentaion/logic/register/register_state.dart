import 'package:flutter/foundation.dart';

import '../../../../../../core/errors/error_model.dart';
import '../../../data/model/auth_response.dart';

@immutable
sealed class RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final User userModel;

  RegisterSuccessState({required this.userModel});
}

final class RegisterFailureState extends RegisterState {
  final ErrorModel errorMessage;

  RegisterFailureState({required this.errorMessage});
}
