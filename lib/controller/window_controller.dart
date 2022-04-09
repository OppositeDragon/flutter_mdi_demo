import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/models/desktop_icons.dart';
import 'package:flutter_mdi_demo/widgets/resizable_draggable_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final windowsProvider = ChangeNotifierProvider((ref) => WindowsController());
enum WindowState { MAXIMIZED, MINIMIZED, NORMAL }

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
    if (resizableDraggableWindow.windowState == WindowState.MAXIMIZED) {
      maximizeWindow(resizableDraggableWindow);
    }
    resizableDraggableWindow.posX += delta.dx;
    resizableDraggableWindow.posY += delta.dy;
    _windowPosition = Offset(resizableDraggableWindow.posX, resizableDraggableWindow.posY);
    notifyListeners();
  }

  void maximizeWindow(ResizableDraggableWindow resizableDraggableWindow) {
    if (resizableDraggableWindow.windowState == WindowState.MAXIMIZED) {
      print(resizableDraggableWindow.savedHeight);
      resizableDraggableWindow.currentHeight = resizableDraggableWindow.savedHeight;
      resizableDraggableWindow.currentWidth = resizableDraggableWindow.savedWidth;
      resizableDraggableWindow.windowState = WindowState.NORMAL;
      dragWindow(resizableDraggableWindow, const Offset(100, 100));
    } else {
      Size size = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size;
      dragWindow(resizableDraggableWindow, Offset(-resizableDraggableWindow.posX, -resizableDraggableWindow.posY));

      resizableDraggableWindow.savedHeight = resizableDraggableWindow.currentHeight;
      resizableDraggableWindow.savedWidth = resizableDraggableWindow.currentWidth;
      resizableDraggableWindow.currentHeight = size.height - 60;
      resizableDraggableWindow.currentWidth = size.width;
      resizableDraggableWindow.windowState = WindowState.MAXIMIZED;
    }

    print(resizableDraggableWindow.windowState);
    notifyListeners();
  }

  void onHorizontalDragRight(ResizableDraggableWindow resizableDraggableWindow, Offset delta) {
    resizableDraggableWindow.currentWidth += delta.dx;
    if (resizableDraggableWindow.currentWidth <= 250) {
      resizableDraggableWindow.currentWidth = 250;
    } else {
      notifyListeners();
    }
  }

  void onVerticalDragBottom(ResizableDraggableWindow resizableDraggableWindow, Offset delta) {
    resizableDraggableWindow.currentHeight += delta.dy;
    if (resizableDraggableWindow.currentHeight <= 250) {
      resizableDraggableWindow.currentHeight = 250;
    } else {
      notifyListeners();
    }
  }

  void onHorizontalDragLeft(ResizableDraggableWindow resizableDraggableWindow, Offset delta) {
    resizableDraggableWindow.currentWidth -= delta.dx;
    if (resizableDraggableWindow.currentWidth > 250) {
      dragWindow(resizableDraggableWindow, delta);
    } else {
      resizableDraggableWindow.currentWidth = 250;
    }
  }

  void onVerticalDragTop(ResizableDraggableWindow resizableDraggableWindow, Offset delta) {
    resizableDraggableWindow.currentHeight -= delta.dy;
    if (resizableDraggableWindow.currentHeight > 250) {
      dragWindow(resizableDraggableWindow, delta);
    } else {
      resizableDraggableWindow.currentHeight = 250;
    }
  }

  void onDragTopLeft(ResizableDraggableWindow resizableDraggableWindow, Offset delta) {
    onHorizontalDragLeft(resizableDraggableWindow, Offset(delta.dx, 0));
    onVerticalDragTop(resizableDraggableWindow, Offset(0, delta.dy));
  }

  void onDragBottomRight(ResizableDraggableWindow resizableDraggableWindow, Offset delta) {
    onHorizontalDragRight(resizableDraggableWindow, Offset(delta.dx, 0));
    onVerticalDragBottom(resizableDraggableWindow, Offset(0, delta.dy));
  }

  void onDragTopRight(ResizableDraggableWindow resizableDraggableWindow, Offset delta) {
    onHorizontalDragRight(resizableDraggableWindow, Offset(delta.dx, 0));
    onVerticalDragTop(resizableDraggableWindow, Offset(0, delta.dy));
  }

  void onDragBottomLeft(ResizableDraggableWindow resizableDraggableWindow, Offset delta) {
    onHorizontalDragLeft(resizableDraggableWindow, Offset(delta.dx, 0));
    onVerticalDragBottom(resizableDraggableWindow, Offset(0, delta.dy));
  }

  List<ResizableDraggableWindow> get windows => _windows;
  Offset get windowPosition => _windowPosition;
}
