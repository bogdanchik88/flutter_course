import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lection_10/util_func.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(const ColorInitialState());

  void newColor(Color c) {
    emit(ColorCurrentState(c));
  }

  void newRandomColor() {
    emit(ColorCurrentState(UtilFunc.rndColor()));
  }

  void resetColor() {
    emit(ColorInitialState());
  }
}
