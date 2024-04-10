import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:flutter/material.dart';

class ApplicationItem extends StatelessWidget {
  final Application application;
  final Function(Application)? onClicked;

  const ApplicationItem({
    super.key,
    required this.application,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClicked?.call(application),
      child: Card(
        child: Text('${application.id} ${application.status.name}'),
      ),
    );
  }
}
