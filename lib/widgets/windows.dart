import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/widgets/desktop.dart';

class Windows extends StatelessWidget {
	 const Windows({ Key? key }) : super(key: key);
  
	@override
	Widget build(BuildContext context) {
		final List<Widget> desktopWindows = [Desktop()];
		return Stack(children: desktopWindows);
	}
}