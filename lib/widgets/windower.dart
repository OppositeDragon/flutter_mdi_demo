import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/controller/window_controller.dart';
import 'package:flutter_mdi_demo/widgets/desktop.dart';
import 'package:flutter_mdi_demo/widgets/resizable_draggable_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final windowsProvider = ChangeNotifierProvider((ref) => WindowsController());

class Windower extends ConsumerWidget {
  Windower({Key? key}) : super(key: key);
 // final List<ResizableDraggableWindow> windowsProvider = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowsNotifier = ref.watch(windowsProvider).windows;
    return Stack(
      children: [Desktop(), ...windowsNotifier],
    );
  }
}
