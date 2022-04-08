import 'package:flutter_test_project/core/error_handling/error_entities/error_entities.dart';
import 'error_handler.dart';
import 'package:flutter_test_project/core/error_handling/errors/errors.dart';

class FormErrorHandler implements ErrorHandler {
  @override
  ErrorEntity getError(Object error, StackTrace stackTrace) {
    switch (error.runtimeType) {
      case InvalidValueException:
        return InvalidValueErrorEntity(error, stackTrace);
      default:
        return UnknownErrorEntity(error, stackTrace);
    }
  }
}
