import 'package:flutter/material.dart';

class DefaultScreenLayout extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? drawer;

  const DefaultScreenLayout({
    super.key,
    required this.child,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      appBar: appBar,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
    );
  }
}
