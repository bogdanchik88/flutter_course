import 'package:dartz/dartz.dart';
import 'package:lection_14/feature/color/data/datasource/local_color_data_source.dart';
import 'package:lection_14/feature/color/domain/entity/color_entity.dart';
import 'package:lection_14/feature/color/domain/entity/color_failure.dart';
import 'package:lection_14/feature/color/domain/repository/color_repository.dart';

class ColorRepositoryImpl implements ColorRepository {
  final LocalColorDataSource _localColorDataSource;

  ColorRepositoryImpl({required LocalColorDataSource localColorDataSource})
    : _localColorDataSource = localColorDataSource;

  @override
  Future<Either<ColorFailure, ColorEntity>> readColor() async {
    final result = await _localColorDataSource.read();

    return result.fold(
      (failure) => Left(failure),
      (color) => Right(ColorEntity(color: color)),
    );
  }

  @override
  Future<Either<ColorFailure, ColorEntity>> writeColor(
    ColorEntity color,
  ) async {
    final result = await _localColorDataSource.write(color.color);

    return result.fold(
      (failure) => Left(failure),
      (color) => Right(ColorEntity(color: color)),
    );
  }
}
