import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/principal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MDIApp(),
  ));
}

class MDIApp extends ConsumerWidget
 {
  const MDIApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter MDI DEMO',
      theme: ThemeData(
        primarySwatch: Colors.blue,brightness: Brightness.dark
      ),
      home: const Principal(),
    );
  }
}

