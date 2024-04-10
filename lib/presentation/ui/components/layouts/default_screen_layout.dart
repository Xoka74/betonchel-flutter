import 'package:flutter/material.dart';

class DefaultScreenLayout extends StatelessWidget {
  final Widget child;
  final AppBar? appBar;
  final Widget? floatingActionButton;

  const DefaultScreenLayout({
    super.key,
    required this.child,
    this.appBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
