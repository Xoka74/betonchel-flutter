import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomModalBottomSheetRoute<T> extends CustomRoute {
  CustomModalBottomSheetRoute({
    required super.page,
    super.path,
    super.guards,
    super.meta,
  }) : super(
          customRouteBuilder: dismissibleDialogRouteBuilder,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        );

  CustomModalBottomSheetRoute.nonDismissible({
    required super.page,
    super.path,
    super.guards,
    super.meta,
  }) : super(
          customRouteBuilder: nonDismissibleDialogRouteBuilder,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        );

  static Route<T> dismissibleDialogRouteBuilder<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return dialogRouteBuilder(
      context,
      child,
      page,
      true,
    );
  }

  static Route<T> nonDismissibleDialogRouteBuilder<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return dialogRouteBuilder(
      context,
      child,
      page,
      false,
    );
  }

  static Route<T> dialogRouteBuilder<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
    bool isDismissible,
  ) {
    return ModalBottomSheetRoute<T>(
      settings: page,
      useSafeArea: true,
      isScrollControlled: true,
      enableDrag: isDismissible,
      isDismissible: isDismissible,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height - (20 + MediaQuery.viewPaddingOf(context).top),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (context) {
        final bottomViewInsets = MediaQuery.viewInsetsOf(context).bottom;
        final bottomViewPadding = MediaQuery.viewPaddingOf(context).bottom;

        final bottomPadding = max(bottomViewInsets, bottomViewPadding);

        return Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: child,
        );
      },
    );
  }
}
