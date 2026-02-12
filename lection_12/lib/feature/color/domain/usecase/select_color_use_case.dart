import 'package:dartz/dartz.dart';
import 'package:flutter_eleventh_clean_architicture/core/use_case/use_case.dart';
import 'package:flutter_eleventh_clean_architicture/feature/color/domain/entity/color_entity.dart';
import 'package:flutter_eleventh_clean_architicture/feature/color/domain/entity/color_failure.dart';
import 'package:flutter_eleventh_clean_architicture/feature/color/domain/repository/color_repository.dart';

class SelectColorUseCase extends UseCase<ColorEntity, ColorEntity> {
  final ColorRepository colorRepository;

  SelectColorUseCase({required this.colorRepository});

  @override
  Future<Either<ColorFailure, ColorEntity>> call(ColorEntity params) {
    return colorRepository.writeColor(params);
  }
}
