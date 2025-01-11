import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/errors/error_model.dart';
part 'add_commit_state.freezed.dart';

@freezed
class AddCommitState with _$AddCommitState {
  const factory AddCommitState.initial() = _Initial;
  const factory AddCommitState.loading() = _Loading;
  const factory AddCommitState.success(String message) = _Success;
  const factory AddCommitState.error(ErrorModel message) = _Error;
}
