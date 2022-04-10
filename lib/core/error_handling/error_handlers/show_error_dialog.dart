import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/error_handling/failure_entities/failure_entities.dart';
import 'package:flutter_test_project/core/error_handling/widgets/error_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  FailureEntity failure,
  List<Widget>? actions,
) async {
  await showDialog(
    context: context,
    builder: (_) => ErrorDialog(error: failure, actions: actions),
  );
}
