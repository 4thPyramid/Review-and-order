import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/error_model.dart';

part  'delete_account_state.freezed.dart';


@freezed
class DeleteAccountState<T> with _$DeleteAccountState {
  const factory DeleteAccountState.initial() = _Initial;
  const factory DeleteAccountState.loading() = _LoadLoading;
  const factory DeleteAccountState.success(String message) = _Success;
  const factory DeleteAccountState.error(ErrorModel error) = _Error;
}
