import 'package:flutter/material.dart';

import '../../../../../../core/errors/error_model.dart';

@immutable
sealed class LogoutState {}
class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutSuccess extends LogoutState {
  final String message;

  LogoutSuccess({required this.message});
}

final class LogoutError extends LogoutState {
  final ErrorModel errorMessage;

  LogoutError({required this.errorMessage});
}
