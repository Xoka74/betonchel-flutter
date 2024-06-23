import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DialogModalRoute<T> extends CustomRoute {
  DialogModalRoute({required PageInfo<T> super.page, super.path})
      : super(
          customRouteBuilder: dialogRouteBuilder,
        );

  static Route<T> dialogRouteBuilder<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return DialogRoute<T>(
      context: context,
      settings: page,
      builder: (context) => child,
    );
  }
}
