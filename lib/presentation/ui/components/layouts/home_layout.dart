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
    return Row(
      children: [
        sideBar,
        Expanded(
          flex: 5,
          child: Column(
            children: [
              topBar,
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
