import 'dart:io';

import 'package:flutter_test_project/core/error_handling/error_handling.dart';

class NetworkFailureEntity extends FailureEntity {
  const NetworkFailureEntity({
    required String code,
    required String message,
  }) : super(code: code, message: message);

  factory NetworkFailureEntity.fromError(Object error) {
    switch (error.runtimeType) {
      case SocketException:
        return const NetworkFailureEntity(
          code: 'NO_INTERNET',
          message: '네트워크 연결 상태를 확인해 주세요.',
        );
      case ReponseTimeoutException:
        return const NetworkFailureEntity(
          code: 'RESPONSE_TIMEOUT',
          message: '서버 응답 시간이 초과되었습니다. 개발자에게 문의해 주세요.',
        );
      case RequestCanceledException:
        return const NetworkFailureEntity(
          code: 'REQUEST_CANCELED',
          message: '요청 작업이 취소되었습니다.',
        );
      case BadRequestException:
        return const NetworkFailureEntity(
          code: 'BAD_REQUEST',
          message: '서버 연결에 실패하였습니다. 개발자에게 문의해 주세요.',
        );
      case UnauthorizedException:
        return const NetworkFailureEntity(
          code: 'UNAUTHORIZED',
          message: '로그인이 필요합니다. 문제가 있으면 개발자에게 문의해 주세요.',
        );
      case ForbiddenException:
        return const NetworkFailureEntity(
          code: 'FORBIDDEN',
          message: '접근 권한이 없습니다. 문제가 있으면 개발자에게 문의해 주세요.',
        );
      case NotFoundException:
        return const NetworkFailureEntity(
          code: 'NOT_FOUND',
          message: '유효하지 않은 요청입니다.',
        );
      case MethodNotAllowedException:
        return const NetworkFailureEntity(
          code: 'METHOD_NOT_ALLOWED',
          message: '개발자에게 문의해 주세요.',
        );
      case RequestTimeoutException:
        return const NetworkFailureEntity(
          code: 'REQUEST_TIMEOUT',
          message: '요청 시간이 초과되었습니다. 다시 시도해 주세요.',
        );
      case TooManyRequestsException:
        return const NetworkFailureEntity(
          code: 'TOO_MANY_REQUEST',
          message: '서버 연결에 실패하였습니다. 잠시 후 다시 시도해 주세요.',
        );
      case InternalServerErrorException:
        return const NetworkFailureEntity(
          code: 'INTERNAL_SERVER_ERROR',
          message: '서버 연결에 실패하였습니다. 개발자에게 문의해 주세요.',
        );
      case ServiceUnavailableException:
        return const NetworkFailureEntity(
          code: 'SERVICE_UNVAILABLE',
          message: '서버 연결에 실패하였습니다. 개발자에게 문의해 주세요.',
        );
      case FormatException:
        return const NetworkFailureEntity(
          code: 'BAD_RESPONSE',
          message: '서버 연결에 실패하였습니다. 개발자에게 문의해 주세요',
        );
      default:
        return const NetworkFailureEntity(
          code: 'UNEXPECTED_ERROR',
          message: '알 수 없는 문제가 발생하였습니다. 개발자에게 문의해 주세요.',
        );
    }
  }
}
