import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/widgets/window_title.dart';
import 'package:flutter_mdi_demo/widgets/windower.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResizableDraggableWindow extends ConsumerStatefulWidget {
  ResizableDraggableWindow(this.title, this.body, {this.iconPath = '', Key? key}) : super(key: key);
  String title;
  Widget body;
  String iconPath;
  double currentHeight = 450;
  double currentWidth = 350;
  double posX = 50;
  double posY = 50;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResizableDraggableWindowState();
}

class _ResizableDraggableWindowState extends ConsumerState<ResizableDraggableWindow> {
  @override
  Widget build(BuildContext context) {
    final Offset windowPosition = ref.watch(windowsProvider).windowPosition;
    return Positioned(
      top: windowPosition.dy,
      left: windowPosition.dx,
      child: GestureDetector(
          onTap: () {
            ref.read(windowsProvider).toFront(widget);
          },
          child: Card(
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            color: Colors.amber.withOpacity(0.75),
            child: SizedBox(
              height: widget.currentHeight,
              width: widget.currentWidth,
              child: Stack(
                children: [
                  Column(
                    children: [
                      WindowTitle(widget),
                      Expanded(child: widget.body),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
