import 'dart:async';

import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

mixin CancelableRunner on Closable {
  final operations = <CancelableOperation>[];

  @protected
  void runScoped(Future operation) {
    final cancelable = CancelableOperation.fromFuture(operation);
    return operations.add(cancelable);
  }

  @override
  Future<void> close() async {
    await Future.wait(operations.map((op) => op.cancel()));

    return super.close();
  }
}
