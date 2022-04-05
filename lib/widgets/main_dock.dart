import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/widgets/date_time_dock.dart';

class MainDock extends StatelessWidget {
  const MainDock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      children: [],
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
