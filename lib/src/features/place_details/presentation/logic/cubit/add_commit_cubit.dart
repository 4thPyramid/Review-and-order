import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/add_commit_rating_uc.dart';
import 'add_commit_state.dart';

class AddCommitCubit extends Cubit<AddCommitState> {
  final AddCommitUesCase commitUseCase;
  final AddRateUesCase rateUseCase;

  AddCommitCubit(this.commitUseCase, this.rateUseCase) : super(const AddCommitState.initial());

  void addCommit(int placeId, String content, File image) async {
    emit(const AddCommitState.loading());
    final result = await commitUseCase.call( placeId,  content,  image);
    result.fold(
      (l) => emit( AddCommitState.error((l))),
      (r) => emit( AddCommitState.success((r)),
      )
    );
  }

  void addRate(int placeId, double rate) async {
    emit(const AddCommitState.loading());
    final result = await rateUseCase.call( placeId,  rate);
    result.fold(
      (l) => emit( AddCommitState.error((l))),
      (r) => emit( AddCommitState.success((r)),
      )
    );
  }
}

