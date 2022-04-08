import 'error_entity.dart';

class UnknownErrorEntity implements ErrorEntity {
  UnknownErrorEntity(this.error, this.stackTrace);

  @override
  String get code => 'UNKNOWN_ERROR';
  @override
  String get message => '관리자에게 문의해 주시길 바랍니다.';

  @override
  Object error;
  @override
  StackTrace stackTrace;
}
