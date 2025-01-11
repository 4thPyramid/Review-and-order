import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../repository/place_details_repository.dart';

class AddCommitUesCase {
  final IPlaceDetailsRepository repository;

  AddCommitUesCase(this.repository);

  Future<Either<ErrorModel, String>> call(int placeId, String content, File image) async {
    return await repository.addCommit(placeId, content, image);
  }

}


class AddRateUesCase {
  final IPlaceDetailsRepository repository;

  AddRateUesCase(this.repository);

  Future<Either<ErrorModel, String>> call(int placeId, int rate) async {
    return await repository.addRate(placeId, rate);
  }

}