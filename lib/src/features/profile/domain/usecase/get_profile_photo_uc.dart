import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/domain/repository/home_repository.dart';
import 'package:review_app/src/features/profile/data/model/profile_model.dart';

class GetProfleDataUC {
  final IHomeRepository _homeRepository;

  GetProfleDataUC(this._homeRepository);

  Future<Either<ErrorModel, ProfileModel>> call() {
    return _homeRepository.getProfile();
  }
}
