import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/widgets/window_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResizableDraggableWindow extends ConsumerStatefulWidget {
  const ResizableDraggableWindow({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResizableDraggableWindowState();
}

class _ResizableDraggableWindowState extends ConsumerState<ResizableDraggableWindow> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      left: 200,
      child: GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            color: Colors.amber.withOpacity(0.75),
            child: SizedBox(
              height: 300,
              width: 200,
              child: Stack(
                children: [
                  Column(
                    children: [
                      WindowTitle(widget),
                      Expanded(
                          child: Center(
                        child: Text("data of window"),
                      ) //widget.body
                          ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
