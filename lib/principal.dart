import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/widgets/desktop.dart';
import 'package:flutter_mdi_demo/widgets/main_dock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Principal extends ConsumerWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Desktop(),
          MainDock(),
        ],
      ),
    );
  }
}
