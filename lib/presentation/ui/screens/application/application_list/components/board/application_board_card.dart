import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:flutter/material.dart';

class ApplicationBoardCard extends StatelessWidget {
  final Application application;
  final Function(Application)? onClicked;

  const ApplicationBoardCard({
    super.key,
    required this.application,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: InkWell(
        onTap: () => onClicked?.call(application),
        borderRadius: BorderRadius.circular(18.0),
        child: Text('${application.id} ${application.status.name}'),
      ),
    );
  }
}
