import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/delete_account_uc.dart';
import 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountUC _deleteAccountUC;
  DeleteAccountCubit(this._deleteAccountUC) : super(const DeleteAccountState.initial());

  Future<void> deleteAccount() async {
    emit(const DeleteAccountState.loading());
    final result = await _deleteAccountUC.call();
    result.fold(
      (l) => emit(DeleteAccountState.error(l)),
      (r) => emit(DeleteAccountState.success(r)),
    );
  }
}