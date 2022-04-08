import 'package:flutter_test_project/core/error_handling/error_entities/error_entity.dart';

abstract class Result<T> {}

class Failure<T> implements Result<T> {
  Failure(this.error);
  ErrorEntity error;
}

class Success<T> implements Result<T> {
  Success(this.data);
  T data;
}
