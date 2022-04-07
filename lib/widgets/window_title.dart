import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/widgets/resizable_draggable_window.dart';
import 'package:flutter_mdi_demo/widgets/windower.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WindowTitle extends ConsumerWidget {
  const WindowTitle(this.parentWindow, {Key? key}) : super(key: key);

  final ResizableDraggableWindow parentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 25,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
                // onPanUpdate: (movement) => widget.onWindowDragged(movement.delta.dx, movement.delta.dy),
								onPanUpdate: (details) => ref.read(windowsProvider).dragWindow(parentWindow, details.delta),
                child: MouseRegion(cursor: SystemMouseCursors.move, child: Text(parentWindow.title))),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              width: 30,
              color: Colors.blueGrey.shade100,
              child: const Icon(Icons.minimize_sharp),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              height: 25,
              width: 30,
              color: Colors.blueGrey.shade100,
              child: const Icon(
                Icons.square_sharp,
                size: 20,
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                ref.read(windowsProvider).removeWindow(parentWindow);
              }, //=> widget.onCloseButtonClicked(),
              child: Container(
                width: 50,
                color: Colors.red,
                child: const Icon(Icons.close_sharp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
