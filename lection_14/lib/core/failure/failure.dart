abstract class Failure {
  final String message;
  final int code;

  Failure({this.message = "", required this.code});

  String getLocalMessage();
}
