import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/error_handling/error_handling.dart';

void main() {
  runApp(const MyApp());
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('에러 발생'),
          onPressed: () => _occurError(context),
        ),
      ),
    );
  }
}

void _occurError(BuildContext context) async {
  try {
    throw NetworkException();
  } catch (e) {
    debugPrint(e.toString());
    await handleError(context, e);
  }
}
