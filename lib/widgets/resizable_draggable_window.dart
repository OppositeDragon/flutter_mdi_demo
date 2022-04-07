import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/controller/window_controller.dart';
import 'package:flutter_mdi_demo/widgets/window_title.dart';
import 'package:flutter_mdi_demo/widgets/windower.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResizableDraggableWindow extends ConsumerWidget {
  ResizableDraggableWindow(this.title, this.body, {this.iconPath = '', Key? key}) : super(key: UniqueKey());
  final String title;
  final Widget body;
  final String iconPath;
  final double currentHeight = 450;
  final double currentWidth = 350;
  double posX = 50;
  double posY = 40;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(windowsProvider);
    return Positioned(
      top: posY,
      left: posX,
      child: GestureDetector(
        onTap: () => ref.read(windowsProvider).toFront(this),
        child: Card(
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          color: Colors.amber.withOpacity(0.75),
          child: SizedBox(
            height: currentHeight,
            width: currentWidth,
            child: Stack(
              children: [
                Column(
                  children: [
                    WindowTitle(this),
                    Expanded(child: body),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
