import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/widgets/resizable_draggable_window.dart';

class WindowTitle extends StatelessWidget {
  const WindowTitle(this.widget, {Key? key}) : super(key: key);

  final ResizableDraggableWindow widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
               // onPanUpdate: (movement) => widget.onWindowDragged(movement.delta.dx, movement.delta.dy),
                child: MouseRegion(cursor: SystemMouseCursors.move, child: Text("window title"))),
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
              onTap: () {},//=> widget.onCloseButtonClicked(),
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
