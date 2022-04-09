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
  final List<Key> _windowsKeys = [];
  List<DockIcon> getDockIcons() {
    print("getdockitems");
    _dockIcons.clear();
    for (var openWindow in _listOfOpenWindows) {
      //agregar DockIcon a _dockIcons, solo si todavia no ha sido agregado
      if (!_dockIcons.any((element) => element.icon.fileType == openWindow.icon.fileType)) {
        //iterar sobre la lista de ventanas abiertas, y agregar a la lista de llaves,
				// unicamente de las ventanas que coinciden con el tipo de archivo.
        for (var oW in _listOfOpenWindows) {
          if (oW.icon.fileType == openWindow.icon.fileType) {
            _windowsKeys.add(oW.key!);
          }
        }
        _dockIcons.add(DockIcon(openWindow.icon, [..._windowsKeys]));
      }
      _windowsKeys.clear();
    }
    return _dockIcons;
  }

  List<DockIcon> get dockIcons => _dockIcons;
}
