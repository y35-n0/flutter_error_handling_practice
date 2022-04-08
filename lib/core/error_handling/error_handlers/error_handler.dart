import 'package:flutter_test_project/core/error_handling/error_entities/error_entities.dart';

abstract class ErrorHandler {
  ErrorEntity getError(Object error, StackTrace stackTrace);
}
