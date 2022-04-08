import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/controller/dock_controller.dart';
import 'package:flutter_mdi_demo/models/desktop_icons.dart';
import 'package:flutter_mdi_demo/widgets/resizable_draggable_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final windowsProvider = ChangeNotifierProvider((ref) => WindowsController());

class WindowsController with ChangeNotifier {
  final List<ResizableDraggableWindow> _windows = [];
  late Offset _windowPosition = Offset(0, 0);

  void createNewWindow(String title, Widget body, DesktopIcon icon) {
    ResizableDraggableWindow resizableDraggableWindow = ResizableDraggableWindow(title, body, icon);

    _windows.add(resizableDraggableWindow);
    notifyListeners();
  }

  void toFront(ResizableDraggableWindow resizableDraggableWindow) {
    _windows.remove(resizableDraggableWindow);
    _windows.add(resizableDraggableWindow);
    notifyListeners();
  }

  void removeWindow(ResizableDraggableWindow resizableDraggableWindow) {
    _windows.remove(resizableDraggableWindow);
    notifyListeners();
  }

  void dragWindow(ResizableDraggableWindow resizableDraggableWindow, Offset delta) {
    resizableDraggableWindow.posX += delta.dx;
    resizableDraggableWindow.posY += delta.dy;
    _windowPosition = Offset(resizableDraggableWindow.posX, resizableDraggableWindow.posY);
    notifyListeners();
  }

  List<ResizableDraggableWindow> get windows => _windows;
  Offset get windowPosition => _windowPosition;
}
