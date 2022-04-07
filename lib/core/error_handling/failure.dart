import 'dart:io';

import 'error_action.dart';
import 'exceptions.dart';

// Error 안내
class Failure {
  Failure({
    required this.errorCode,
    required this.errorMessage,
    required this.errerAction,
  });

  String errorCode;
  String errorMessage;
  ErrorAction errerAction;

  factory Failure.fromException(Exception exception) {
    switch (exception.runtimeType) {
      case SocketException:
        return Failure(
          errorCode: 'NO_CONNECTIVITY',
          errorMessage: '인터넷 연결 상태를 확인해 주세요.',
          errerAction: ErrorAction.systemPop,
        );
      case BadRequestException:
        return Failure(
          errorCode: 'NETWORK_BAD_REQUEST',
          errorMessage: '관리자에게 문의해 주시길 바랍니다.',
          errerAction: ErrorAction.pop,
        );
      case ForbiddenException:
        return Failure(
          errorCode: 'FORBIDDEN',
          errorMessage: '접근 권한이 없습니다.',
          errerAction: ErrorAction.pop,
        );
      case UnauthorisedException:
        return Failure(
          errorCode: 'UNAUTHORIZED',
          errorMessage: '로그인이 필요합니다.',
          errerAction: ErrorAction.pop,
        );
      case FetchDataException:
        return Failure(
          errorCode: 'FAILED_FETCH_DATA',
          errorMessage: '관리자에게 문의해 주시길 바랍니다.',
          errerAction: ErrorAction.pop,
        );
      default:
        return Failure(
          errorCode: 'UNKNOWN_ERROR',
          errorMessage: '관리자에게 문의해 주시길 바랍니다.',
          errerAction: ErrorAction.pop,
        );
    }
  }
}
