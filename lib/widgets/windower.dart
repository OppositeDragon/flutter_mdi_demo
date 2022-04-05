

import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/widgets/desktop.dart';
import 'package:flutter_mdi_demo/widgets/resizable_draggable_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Windower extends ConsumerWidget {
	 Windower({Key? key}) : super(key: key);
	final ResizableDraggableWindow _window = const ResizableDraggableWindow();
final List<ResizableDraggableWindow> windows = [];
	@override
	Widget build(BuildContext context, WidgetRef ref) {
		windows.add(_window);
		return Stack(
			children: [
				Desktop(),
			...windows
			],
		);
	}
}