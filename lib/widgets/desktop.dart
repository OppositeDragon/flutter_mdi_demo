import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/controller/default_application_controller.dart';
import 'package:flutter_mdi_demo/controller/window_controller.dart';
import 'package:flutter_mdi_demo/models/desktop_icons.dart';
import 'package:flutter_mdi_demo/widgets/apps/pdfx_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Desktop extends ConsumerWidget {
  const Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/img/background.jpg",
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 0,
          bottom: 60,
          child: Wrap(
            key: UniqueKey(),
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            direction: Axis.vertical,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: iconsDesk
                .map((e) {
                  return SizedBox(
                      width: 80,
                      height: 100,
                      child: Card(
                        color: Colors.black54,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onDoubleTap: () => ref.read(windowsProvider).createNewWindow(
                                  e.name.toString(),
                                 ref.read(defaultAppProvider).defaulApp(e.fileType),
                                  e),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Image.asset(
                                  e.iconPath,
                                  fit: BoxFit.contain,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                            Text(
                              e.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 10, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                })
                .toList(),
          ),
        ),
      ],
    );
  }
}
