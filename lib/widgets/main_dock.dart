import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/widgets/date_time_dock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainDock extends ConsumerWidget {
  const MainDock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      bottom: 5,
      left: 5,
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width - 10,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 5),
              const Card(
                color: Colors.blue,
                child: SizedBox(width: 30, height: 30),
              ),
              Expanded(child: Row()),
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
    );
  }
}
