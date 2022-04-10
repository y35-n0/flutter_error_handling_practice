import 'package:flutter_test_project/core/error_handling/failure_entities/failure_entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(FailureEntity failure) = Failure<T>;
}
