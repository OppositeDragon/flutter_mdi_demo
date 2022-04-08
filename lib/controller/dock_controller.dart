import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/controller/window_controller.dart';
import 'package:flutter_mdi_demo/models/dock_icons.dart';
import 'package:flutter_mdi_demo/widgets/resizable_draggable_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dockProvider = ChangeNotifierProvider((ref) {
  final windows = ref.watch(windowsProvider).windows;
  return DockController(windows);
});

class DockController with ChangeNotifier {
  DockController(this._listOfOpenWindows);
  final List<ResizableDraggableWindow> _listOfOpenWindows;
  final List<DockIcon> _dockIcons = [];

  List<DockIcon> getDockIcons() {
    print("getdockitems");
    _dockIcons.clear();
    int ni = 0;
    for (var openWindow in _listOfOpenWindows) {
      for (var oW in _listOfOpenWindows) {
        if (oW.icon.fileType == openWindow.icon.fileType) {
          ni++;
        }
      }
      if (_dockIcons.any((element) => element.icon.fileType == openWindow.icon.fileType)) {
        _dockIcons.firstWhere((element) => element.icon.fileType == openWindow.icon.fileType).numInstancias = ni;
      } else {
        _dockIcons.add(DockIcon(openWindow.icon, ni));
      }
      ni = 0;
    }
    return _dockIcons;
  }

  List<DockIcon> get dockIcons => _dockIcons;
}
