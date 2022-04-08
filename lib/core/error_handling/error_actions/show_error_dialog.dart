import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/error_handling/error_entities/error_entities.dart';
import 'package:flutter_test_project/core/error_handling/error_screens/error_screens.dart';

Future<void> showErrorDialog(
  BuildContext context,
  ErrorEntity error,
  List<Widget>? actions,
) async {
  await showDialog(
    context: context,
    builder: (_) => ErrorDialog(error: error, actions: actions),
  );
}
