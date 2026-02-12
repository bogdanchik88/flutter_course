import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:lection_14/feature/color/domain/entity/color_entity.dart';
import 'package:lection_14/feature/color/domain/entity/color_failure.dart';
import 'package:lection_14/feature/color/domain/repository/color_repository.dart';
import 'package:lection_14/feature/color/domain/usecase/get_color_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockColorRepository extends Mock implements ColorRepository {}

void main() {
  setUpAll(() => print("setup all"));

  group("GetColorUseCase tests:", () {
    ColorRepository colorRepository = MockColorRepository();

    setUp(() => print("setup"));

    test("При успешном получении цвета должен возвращать цвет", () async {
      final ColorEntity colorEntity = ColorEntity(
        color: Colors.black.value.toString(),
      );

      when(() => colorRepository.readColor()).thenAnswer(
        (invocation) async => Right<ColorFailure, ColorEntity>(colorEntity),
      );

      GetColorUseCase getColorUseCase = GetColorUseCase(
        colorRepository: colorRepository,
      );

      final result = await getColorUseCase.call();

      verify(() => colorRepository.readColor()).called(1);

      expect(result, equals(Right<ColorFailure, ColorEntity>(colorEntity)));
    });

    test("При ошибке получении цвета должен возвращать failure", () async {
      final ColorEntity colorEntity = ColorEntity(
        color: Colors.black.value.toString(),
      );

      final ColorFailure colorFailure = ColorFailure(code: 1);

      when(() => colorRepository.readColor()).thenAnswer(
        (invocation) async => Left<ColorFailure, ColorEntity>(colorFailure),
      );

      GetColorUseCase getColorUseCase = GetColorUseCase(
        colorRepository: colorRepository,
      );

      final result = await getColorUseCase.call();

      verify(() => colorRepository.readColor()).called(1);

      expect(result, equals(Left<ColorFailure, ColorEntity>(colorFailure)));
    });
  });
}
