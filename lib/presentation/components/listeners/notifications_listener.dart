import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsListener extends StatelessWidget {
  final Widget child;

  const NotificationsListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {

      },
      child: child,
    );
  }
}
