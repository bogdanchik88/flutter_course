import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lection_14/feature/color/domain/entity/color_entity.dart';
import 'package:lection_14/feature/color/domain/usecase/get_color_use_case.dart';
import 'package:lection_14/feature/color/domain/usecase/select_color_use_case.dart';
part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit(this._selectColorUseCase, this._getColorUseCase)
    : super(ColorCurrentState(color: Colors.transparent, isLoading: true)) {
    getColor(); // вызываем сразу при создании
  }

  final SelectColorUseCase _selectColorUseCase;
  final GetColorUseCase _getColorUseCase;

  Future<void> getColor() async {
    final result = await _getColorUseCase();

    result.fold(
      (failure) => emit(
        ColorCurrentState(
          color: state.color,
          isLoading: false,
          error: failure.getLocalMessage(),
        ),
      ),
      (entity) => emit(
        ColorCurrentState(
          isLoading: false,
          color: Color(int.tryParse(entity.color) ?? 0xFFFFFFF),
        ),
      ),
    );
  }

  Future<void> setColor(Color color) async {
    final result = await _selectColorUseCase(
      ColorEntity(color: color.value.toString()),
    );

    result.fold(
      (failure) => emit(
        ColorCurrentState(
          color: state.color,
          isLoading: false,
          error: failure.getLocalMessage(),
        ),
      ),
      (entity) => emit(
        ColorCurrentState(
          isLoading: false,
          color: Color(int.tryParse(entity.color) ?? 0xFFFFFFF),
        ),
      ),
    );
  }
}
