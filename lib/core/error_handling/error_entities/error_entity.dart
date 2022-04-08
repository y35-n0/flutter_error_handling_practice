abstract class ErrorEntity {
  ErrorEntity(this.error, this.stackTrace);

  String get code;
  String get message;

  Object error;
  StackTrace stackTrace;
}
