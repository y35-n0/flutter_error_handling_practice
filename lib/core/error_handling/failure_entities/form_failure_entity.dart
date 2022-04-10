import 'failure_entity.dart';

class FormFailureEntity extends FailureEntity {
  const FormFailureEntity({
    required String code,
    required String message,
  }) : super(code: code, message: message);

  factory FormFailureEntity.fromError(Object error) {
    switch (error.runtimeType) {
      case FormatException:
        return const FormFailureEntity(
          code: 'INVALID_VALUE',
          message: '유효하지 않은 값을 입력하였습니다. 다시 입력해 주세요.',
        );
      default:
        return const FormFailureEntity(
          code: 'UNEXTECTED_ERROR',
          message: '알 수 없는 문제가 발생하였습니다. 개발자에게 문의해 주세요.',
        );
    }
  }
}
