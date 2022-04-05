import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/models/desktop_icons.dart';

class Desktop extends StatelessWidget {
  Desktop({
    Key? key,
  }) : super(key: key);

	
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "img/background.jpg",
          fit: BoxFit.cover,
        ),
        Wrap(
          key: UniqueKey(),
          crossAxisAlignment: WrapCrossAlignment.start,
          alignment: WrapAlignment.start,
          direction: Axis.vertical,
          runAlignment: WrapAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: 
					iconsDesk
              .map((e) => SizedBox(
                    width: 80,
                    height: 100,
                    child: Card(
                      color: Colors.black54,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onDoubleTap: () {
                              print("double tap");
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Image.asset(
                                e.icon,
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
                            style: TextStyle(fontSize: 10,color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
							
        ),
      ],
    );
  }
}