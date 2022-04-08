import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/controller/window_controller.dart';
import 'package:flutter_mdi_demo/models/desktop_icons.dart';
import 'package:flutter_mdi_demo/widgets/window_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResizableDraggableWindow extends ConsumerWidget {
  ResizableDraggableWindow(this.title, this.body, this.icon, {Key? key}) : super(key: UniqueKey());
  final String title;
  final Widget body;
  final DesktopIcon icon;
  double currentHeight = 450;
  double currentWidth = 500;
  double posX = 50;
  double posY = 40;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(windowsProvider.select((value) => value.windowPosition));
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
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) => ref.watch(windowsProvider).onHorizontalDragRight(this, details.delta),
                    child: const MouseRegion(
                      cursor: SystemMouseCursors.resizeLeftRight,
                      opaque: true,
                      child: SizedBox(
                        width: 4,
                        child: DecoratedBox(decoration: BoxDecoration(color: Colors.lightBlue)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) => ref.watch(windowsProvider).onHorizontalDragLeft(this, details.delta),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.resizeLeftRight,
                      opaque: true,
                      child: SizedBox(
                        width: 4,
                        child: DecoratedBox(decoration: BoxDecoration(color: Colors.lightGreen)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) => ref.watch(windowsProvider).onVerticalDragTop(this, details.delta),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.resizeUpDown,
                      opaque: true,
                      child: SizedBox(
                        height: 4,
                        child: DecoratedBox(decoration: BoxDecoration(color: Colors.orange)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) => ref.watch(windowsProvider).onVerticalDragBottom(this, details.delta),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.resizeUpDown,
                      opaque: true,
                      child: SizedBox(
                        height: 4,
                        child: DecoratedBox(decoration: BoxDecoration(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: GestureDetector(
                    onPanUpdate: (details) => ref.watch(windowsProvider).onDragTopLeft(this, details.delta),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.resizeUpLeftDownRight,
                      opaque: true,
                      child: SizedBox(
                        height: 6,
                        width: 6,
                        child: DecoratedBox(decoration: BoxDecoration(color: Colors.yellow)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onPanUpdate: (details) => ref.watch(windowsProvider).onDragBottomRight(this, details.delta),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.resizeUpLeftDownRight,
                      opaque: true,
                      child: SizedBox(
                        height: 6,
                        width: 6,
                        child: DecoratedBox(decoration: BoxDecoration(color: Colors.yellow)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onPanUpdate: (details) => ref.watch(windowsProvider).onDragTopRight(this, details.delta),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.resizeUpRightDownLeft,
                      opaque: true,
                      child: SizedBox(
                        height: 6,
                        width: 6,
                        child: DecoratedBox(decoration: BoxDecoration(color: Colors.cyanAccent)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onPanUpdate: (details) => ref.watch(windowsProvider).onDragBottomLeft(this, details.delta),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.resizeUpRightDownLeft,
                      opaque: true,
                      child: SizedBox(
                        height: 6,
                        width: 6,
                        child: DecoratedBox(decoration: BoxDecoration(color: Colors.cyanAccent)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
