import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartMenuIconWidget extends ConsumerStatefulWidget {
  const StartMenuIconWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartMenuIconWidgetState();
}

class _StartMenuIconWidgetState extends ConsumerState<StartMenuIconWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isMenu = true;
  OverlayEntry? entry;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showOverlay() {
    final overlay = Overlay.of(context);
    // final renderBox = context.findRenderObject() as RenderBox;
    // final offset = renderBox.localToGlobal(Offset.zero);
    // final size = renderBox.size;
    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: 375,
        bottom: 60,
        left: 5,
        height: 500,
        child: Material(
          elevation: 16,
          borderRadius: BorderRadius.circular(6),
          clipBehavior: Clip.antiAlias,
          color: Colors.black.withOpacity(0.15),
          //child: ClipRRect(
          //borderRadius: BorderRadius.circular(5),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              tileMode: TileMode.mirror,
              sigmaX: 6,
              sigmaY: 6,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.white), borderRadius: BorderRadius.circular(7)),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.person, size: 30),
                            Text("Usuario"),
                          ],
                        ),
                      ),
											
                      Expanded(
												child: Row(crossAxisAlignment: CrossAxisAlignment.center,
													children: [
														Flexible(
															flex: 6,
															fit: FlexFit.tight,
															child: Column(
																children: [Text("aoeu"), Text("aoeu"), Text("aoeu"), Text("aoeu")],
															),
														),
														DecoratedBox(
															decoration: BoxDecoration(color: Colors.white),
															child: SizedBox(width: 1, height: constraints.maxHeight - 100),
														),
														Flexible(
															flex: 4,
															fit: FlexFit.tight,
															child: Column(
																children: [Text("User"), Text("User"), Text("User"), Text("User"), Spacer(),Text("User")],
															),
														)
													],
												),
											)
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        // ),
      ),
    );
    overlay!.insert(entry!);
  }

  void removeOverlay() {
    entry!.remove();
    entry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          toggleIcon();
        });
      },
      child: Container(
        height: 36,
        width: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.90),
          borderRadius: BorderRadius.circular(5),
        ),
        child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _controller),
      ),
    );
  }

  void toggleIcon() {
    isMenu ? showOverlay() : removeOverlay();
    isMenu ? _controller.forward() : _controller.reverse();
    isMenu = !isMenu;
  }
}
