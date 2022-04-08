import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ErrorDialogAction {
  back,
  pop,
  systemPop,
}

class ErrorDialogActionButton extends TextButton {
  const ErrorDialogActionButton({
    required void Function()? onPressed,
    required Widget child,
    Key? key,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
        );

  factory ErrorDialogActionButton.back(BuildContext context) {
    return ErrorDialogActionButton(
      onPressed: () {
        int count = 0;
        Navigator.popUntil(context, (route) => count++ == 2);
      },
      child: const Text('돌아가기'),
    );
  }

  factory ErrorDialogActionButton.pop(BuildContext context) {
    return ErrorDialogActionButton(
      onPressed: () => Navigator.pop(context),
      child: const Text('확인'),
    );
  }
  factory ErrorDialogActionButton.systemPop(BuildContext context) {
    return ErrorDialogActionButton(
      onPressed: () => SystemNavigator.pop(),
      child: const Text('종료'),
    );
  }
}
