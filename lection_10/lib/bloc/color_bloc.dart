import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lection_10/util_func.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorInitialState()) {
    on<NewColorEvent>(onNewCurrentEvent);
    on<NewRandomColorEvent>(onNewRandomColorEvent);
    on<ResetColorEvent>(onResetColorEvent);
  }

  void onNewCurrentEvent(NewColorEvent event, Emitter<ColorState> emit) {
    emit(ColorCurrentState(event.color));
  }

  void onNewRandomColorEvent(
    NewRandomColorEvent event,
    Emitter<ColorState> emit,
  ) {
    emit(ColorCurrentState(UtilFunc.rndColor()));
  }

  void onResetColorEvent(ResetColorEvent event, Emitter<ColorState> emit) {
    emit(const ColorInitialState());
  }
}
