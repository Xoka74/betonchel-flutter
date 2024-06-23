import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:flutter/cupertino.dart';

class ApplicationTableItem extends StatelessWidget {
  final Application application;

  const ApplicationTableItem({
    super.key,
    required this.application,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Item');
  }
}
