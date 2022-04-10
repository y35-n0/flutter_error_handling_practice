import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/error_handling/error_handling.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    required this.error,
    required this.actions,
    Key? key,
  }) : super(key: key);

  final FailureEntity error;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('ERROR_CODE: ${error.code}'),
      content: Text(error.message),
      actions: actions,
    );
  }
}
