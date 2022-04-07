import 'package:flutter/material.dart';

import 'error_dialog.dart';
import 'failure.dart';

Future<void> handleError(BuildContext context, Object e) async {
  if (e is Error) {
    _handleError(e);
  } else if (e is Exception) {
    await _handleException(context, e);
  }
}

void _handleError(Error error) {
  debugPrint(error.toString());
  debugPrint(error.stackTrace.toString());
}

Future<void> _handleException(BuildContext context, Exception eception) async {
  final failure = Failure.fromException(eception);
  return await showDialog(
    context: context,
    builder: (_) => ErrorDialog(
      failure: failure,
    ),
  );
}
