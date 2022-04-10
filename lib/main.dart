import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/env.dart';
import 'package:flutter_test_project/core/error_handling/error_handling.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() {
  runZoned<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SentryFlutter.init(
      (options) {
        options.dsn = kSentryDsn;
        options.tracesSampleRate = 1.0;
      },
    );

    FlutterError.onError = (FlutterErrorDetails details) {
      if (kDebugMode) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        if (details.stack != null) {
          Zone.current.handleUncaughtError(details.exception, details.stack!);
        }
      }
    };

    runApp(const MyApp());
  }).onError((error, stackTrace) async {
    if (error != null) {
      await reportError(error, stackTrace);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 30.0,
            ),
            // throw error buttons
            ElevatedButton(
              child: const Text('No Exception'),
              onPressed: () => callMayCrashyFunction(
                context,
                'Hello',
              ),
            ),
            ElevatedButton(
              child: const Text('BadRequestException'),
              onPressed: () => callMayCrashyFunction(
                context,
                BadRequestException(),
              ),
            ),
            ElevatedButton(
              child: const Text('ForbiddenException'),
              onPressed: () => callMayCrashyFunction(
                context,
                ForbiddenException(),
              ),
            ),
            ElevatedButton(
              child: const Text('UnauthorizedException'),
              onPressed: () => callMayCrashyFunction(
                context,
                UnauthorizedException(),
              ),
            ),
            ElevatedButton(
              child: const Text('InternalServerErrorException'),
              onPressed: () => callMayCrashyFunction(
                context,
                InternalServerErrorException(),
              ),
            ),
            ElevatedButton(
              child: const Text('FormatException'),
              onPressed: () => callMayCrashyFunction(
                context,
                const FormatException(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // call function. if failure, handle error
  void callMayCrashyFunction(BuildContext context, Object value) async {
    final result = await mayCrashyFunction(context, value);
    if (result is Success<String>) {
      setState(() {
        text = result.data;
      });
    } else {
      result as Failure<String>;

      setState(() {
        text = 'ERROR CODE: ${result.failure.code}';
      });

      await showErrorDialog(
        context,
        result.failure,
        [ErrorDialogActionButton.pop(context)],
      );
    }
  }

  // return result by success or failure
  Future<Result<String>> mayCrashyFunction(
    BuildContext context,
    Object value,
  ) async {
    try {
      // crashy or not
      if (value is String) {
        // if done, return Success
        return Success<String>(value);
      } else {
        throw value;
      }
    } catch (error, stackTrace) {
      // if crashy, return Failure
      reportError(error, stackTrace);
      final failureEntity = NetworkFailureEntity.fromError(error);
      return Failure(failureEntity);
    }
  }
}
