import 'package:dartz/dartz.dart';
import 'package:flutter_eleventh_clean_architicture/feature/color/domain/entity/color_failure.dart';

abstract class LocalColorDataSource {
  Future<Either<ColorFailure, String>> write(String color);

  Future<Either<ColorFailure, String>> read();
}
