import 'dart:io';

import 'error_handler.dart';
import 'package:flutter_test_project/core/error_handling/errors/errors.dart';
import 'package:flutter_test_project/core/error_handling/error_entities/error_entities.dart';

class NetworkErrorHandler implements ErrorHandler {
  @override
  ErrorEntity getError(Object error, StackTrace stackTrace) {
    switch (error.runtimeType) {
      case SocketException:
        return SocketErrorEntity(error, stackTrace);
      case BadRequestException:
        return BadRequestErrorEntity(error, stackTrace);
      case ForbiddenException:
        return ForbiddenErrorEntity(error, stackTrace);
      case UnauthorisedException:
        return UnauthorisedErrorEntity(error, stackTrace);
      case FetchDataException:
        return FetchDataErrorEntity(error, stackTrace);
      default:
        return UnknownErrorEntity(error, stackTrace);
    }
  }
}
