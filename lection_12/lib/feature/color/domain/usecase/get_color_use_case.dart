import 'package:dartz/dartz.dart';
import 'package:flutter_eleventh_clean_architicture/core/failure/failure.dart';
import 'package:flutter_eleventh_clean_architicture/core/use_case/use_case.dart';
import 'package:flutter_eleventh_clean_architicture/feature/color/domain/entity/color_entity.dart';
import 'package:flutter_eleventh_clean_architicture/feature/color/domain/repository/color_repository.dart';

class GetColorUseCase implements UseCaseNoParams<ColorEntity> {
  final ColorRepository colorRepository;

  GetColorUseCase({required this.colorRepository});

  @override
  Future<Either<Failure, ColorEntity>> call() {
    return colorRepository.readColor();
  }
}
