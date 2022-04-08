import 'error_entity.dart';

class SocketErrorEntity implements ErrorEntity {
  SocketErrorEntity(this.error, this.stackTrace);
  @override
  String get code => 'NO_CONNECTION';
  @override
  String get message => '인터넷 연결 상태를 확인해 주세요.';

  @override
  Object error;
  @override
  StackTrace stackTrace;
}

class BadRequestErrorEntity implements ErrorEntity {
  BadRequestErrorEntity(this.error, this.stackTrace);
  @override
  String get code => 'BAD_REQUEST';
  @override
  String get message => '관리자에게 문의해 주시길 바랍니다.';

  @override
  Object error;
  @override
  StackTrace stackTrace;
}

class ForbiddenErrorEntity implements ErrorEntity {
  ForbiddenErrorEntity(this.error, this.stackTrace);
  @override
  String get code => 'FORBIDDEN';
  @override
  String get message => '접근 권한이 없습니다.';

  @override
  Object error;
  @override
  StackTrace stackTrace;
}

class UnauthorisedErrorEntity implements ErrorEntity {
  UnauthorisedErrorEntity(this.error, this.stackTrace);
  @override
  String get code => 'UNAUTHORIZED';
  @override
  String get message => '로그인이 필요합니다.';

  @override
  Object error;
  @override
  StackTrace stackTrace;
}

class InternalServerErrorEntity implements ErrorEntity {
  InternalServerErrorEntity(this.error, this.stackTrace);
  @override
  String get code => 'INTERNAL_SERVER_ERROR';
  @override
  String get message => '관리자에게 문의해 주시길 바랍니다.';

  @override
  Object error;
  @override
  StackTrace stackTrace;
}

class FetchDataErrorEntity implements ErrorEntity {
  FetchDataErrorEntity(this.error, this.stackTrace);
  @override
  String get code => 'FAILED_FETCH_DATA';
  @override
  String get message => '관리자에게 문의해 주시길 바랍니다.';

  @override
  Object error;
  @override
  StackTrace stackTrace;
}
