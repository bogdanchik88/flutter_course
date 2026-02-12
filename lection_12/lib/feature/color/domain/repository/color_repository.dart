import 'package:dartz/dartz.dart';
import 'package:flutter_eleventh_clean_architicture/feature/color/domain/entity/color_entity.dart';
import 'package:flutter_eleventh_clean_architicture/feature/color/domain/entity/color_failure.dart';

abstract class ColorRepository {
  Future<Either<ColorFailure, ColorEntity>> writeColor(ColorEntity color);

  Future<Either<ColorFailure, ColorEntity>> readColor();
}
