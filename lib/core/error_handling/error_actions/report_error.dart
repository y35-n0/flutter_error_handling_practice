import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> reportError(
  Object error,
  StackTrace stackTrace,
) async {
  if (kDebugMode) {
    print('Caught Error : $error');
    print(stackTrace);
  } else {
    await Sentry.captureException(error, stackTrace: stackTrace);
  }
}
