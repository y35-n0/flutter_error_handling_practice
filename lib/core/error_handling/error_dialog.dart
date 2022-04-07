import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'error_action.dart';
import 'failure.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    required this.failure,
    Key? key,
  }) : super(key: key);

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('ERROR_CODE: ${failure.errorCode}'),
      content: Text(failure.errorMessage),
      actions: [
        _buildAction(context),
      ],
    );
  }

  Widget _buildAction(BuildContext context) {
    switch (failure.errerAction) {
      case ErrorAction.back:
        return TextButton(
          onPressed: () {
            int count = 0;
            Navigator.popUntil(context, (route) => count++ == 2);
          },
          child: const Text('돌아가기'),
        );
      case ErrorAction.pop:
        return TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('확인'),
        );
      case ErrorAction.systemPop:
        return TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: const Text('종료'),
        );
    }
  }
}
