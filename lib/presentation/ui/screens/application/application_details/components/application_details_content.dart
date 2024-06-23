import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ApplicationDetailsContent extends StatelessWidget {
  final Application application;

  const ApplicationDetailsContent({
    super.key,
    required this.application,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Title(
      color: Colors.white,
      title: 'Заявка № ${application.id}',
      child: Center(
          child: PrimaryButton(
        onPressed: () {
          context.navigateTo(EditApplicationPage(id: application.id));
        },
        child: const Text('Edit'),
      )),
    );
  }
}
