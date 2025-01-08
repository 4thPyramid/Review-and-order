import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/domain/repository/home_repository.dart';
import 'package:review_app/src/features/profile/data/model/profile_model.dart';

class UpdateProfileUc {
  final IHomeRepository _romeRepository;

  UpdateProfileUc(this._romeRepository);

  Future<Either<ErrorModel, ProfileModel>> call(
    String name,
    String phone,
    String email,
  ) {
    return _romeRepository.updateProfle(
      name,
      phone,
      email,
    );
  }
}
