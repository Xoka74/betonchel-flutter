import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;
  final Widget sideBar;
  final Widget topBar;

  const HomeLayout({
    super.key,
    required this.child,
    required this.sideBar,
    required this.topBar,
  });

  @override
  Widget build(BuildContext context) {
    final screen = context.screen;

    return Row(
      children: [
        if (!screen.isMobile) sideBar,
        Expanded(
          flex: 5,
          child: Column(
            children: [
              if (!screen.isMobile) topBar,
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
