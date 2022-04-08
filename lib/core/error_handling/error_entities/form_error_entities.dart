import 'error_entity.dart';

class InvalidValueErrorEntity implements ErrorEntity {
  InvalidValueErrorEntity(this.error, this.stackTrace);

  @override
  String get code => 'INVALID_VALUE';
  @override
  String get message => '유효하지 않은 값입니다. 입력 형식을 확인해주세요.';

  @override
  Object error;
  @override
  StackTrace stackTrace;
}
