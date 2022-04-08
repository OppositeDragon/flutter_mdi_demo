import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/controller/dock_controller.dart';
import 'package:flutter_mdi_demo/controller/window_controller.dart';
import 'package:flutter_mdi_demo/widgets/date_time_dock.dart';
import 'package:flutter_mdi_demo/widgets/dock_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainDock extends ConsumerStatefulWidget {
  const MainDock({
    Key? key,
  }) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainDockState();
}

class _MainDockState extends ConsumerState<MainDock> {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainDockState();

  @override
  void initState() {
    super.initState();
  //ref.read(dockProvider).getDockIcons();
	}

  @override
  Widget build(BuildContext context) {
    final a = ref.watch(dockProvider).getDockIcons();
		
    // print("asize ${a.length}");
    return Positioned(
      bottom: 5,
      left: 5,
      right: 5,
      child: SizedBox(
        height: 50,
        //width: MediaQuery.of(context).size.width - 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 7,
              sigmaY: 7,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.75),
                  border: Border.all(color: Colors.white60, width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 5),
                  const Card(
                    color: Colors.blue,
                    child: SizedBox(width: 30, height: 30),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: a.map((e) => DockItem(e)).toList(),
                    ),
                  ),
                  const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: DockDateTime(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
