import 'package:lection_12/core/failure/failure.dart';

class ColorFailure extends Failure {
  ColorFailure({super.message, required super.code});

  @override
  String getLocalMessage() {
    return "Ошибка";
  }
}
