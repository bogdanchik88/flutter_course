import 'package:flutter_eleventh_clean_architicture/core/failure/failure.dart';

class ColorFailure extends Failure {
  ColorFailure({super.message, required super.code});

  @override
  String getLocalMessage() {
    return "Ошибка";
  }
}
