import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:lection_14/feature/color/domain/entity/color_entity.dart';
import 'package:lection_14/feature/color/domain/entity/color_failure.dart';
import 'package:lection_14/feature/color/domain/repository/color_repository.dart';
import 'package:lection_14/feature/color/domain/usecase/select_color_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockColorRepository extends Mock implements ColorRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(ColorEntity(color: Colors.black.value.toString()));
  });

  group("SetColorUseCase tests:", () {
    ColorRepository colorRepository = MockColorRepository();

    setUp(() => print("setup"));

    test("При успешном сохранении цвета должен его возвращать", () async {
      final ColorEntity colorEntity = ColorEntity(
        color: Colors.black.value.toString(),
      );

      when(() => colorRepository.writeColor(any())).thenAnswer(
        (invocation) async => Right<ColorFailure, ColorEntity>(colorEntity),
      );

      SelectColorUseCase selectColorUseCase = SelectColorUseCase(
        colorRepository: colorRepository,
      );

      final result = await selectColorUseCase.call(colorEntity);

      verify(() => colorRepository.writeColor(any())).called(1);

      expect(result, equals(Right<ColorFailure, ColorEntity>(colorEntity)));
    });
  });
}
