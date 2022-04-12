import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartMenuIconWidget extends ConsumerStatefulWidget {
  const StartMenuIconWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartMenuIconWidgetState();
}

class _StartMenuIconWidgetState extends ConsumerState<StartMenuIconWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isMenu = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => toggleIcon()),
      child: Container(
        height: 36,
        width: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.90),
          borderRadius: BorderRadius.circular(5),
        ),
        child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _controller),
      ),
    );
  }

  void toggleIcon() {
    isMenu = !isMenu;
    isMenu ? _controller.forward() : _controller.reverse();
  }
}
