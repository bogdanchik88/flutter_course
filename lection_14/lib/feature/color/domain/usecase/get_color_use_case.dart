import 'package:dartz/dartz.dart';
import 'package:lection_14/core/failure/failure.dart';
import 'package:lection_14/core/use_case/use_case.dart';
import 'package:lection_14/feature/color/domain/entity/color_entity.dart';
import 'package:lection_14/feature/color/domain/repository/color_repository.dart';

class GetColorUseCase implements UseCaseNoParams<ColorEntity> {
  final ColorRepository colorRepository;

  GetColorUseCase({required this.colorRepository});

  @override
  Future<Either<Failure, ColorEntity>> call() {
    return colorRepository.readColor();
  }
}
