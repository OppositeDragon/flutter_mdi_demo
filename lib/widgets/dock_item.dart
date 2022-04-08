import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/models/dock_icons.dart';

class DockItem extends StatelessWidget {
  const DockItem(this.dockIcon, {Key? key}) : super(key: key);
  final DockIcon dockIcon;
  @override
  Widget build(BuildContext context) {
    int numDots = dockIcon.numInstancias >= 3 ? 3 : dockIcon.numInstancias;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          constraints: const BoxConstraints(maxHeight: 33, minHeight: 33, maxWidth: 100, minWidth: 30),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.white30, width: 0.4), color: Colors.black26, borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                dockIcon.icon.iconPath,
                fit: BoxFit.contain,
                width: 30,
                height: 30,
              ),
              Flexible(
                child: Text(
                  dockIcon.icon.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 8,
                  ),
                ),
              )
            ],
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 7, minHeight: 7, maxWidth: 100, minWidth: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < numDots; i++)
                const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.white,
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: SizedBox(width: 7, height: 7),
                )
            ],
          ),
        )
      ],
    );
  }
}
