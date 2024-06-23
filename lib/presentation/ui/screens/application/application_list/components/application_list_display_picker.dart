import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_list/models/application_list_display_type.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ApplicationListDisplayPicker extends StatelessWidget {
  const ApplicationListDisplayPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ApplicationListDisplayType>(
      items: [
        ...ApplicationListDisplayType.values.map(
              (e) => DropdownMenuItem(
            value: e,
            child: Text(e.name),
          ),
        ),
      ],
      // value: form.status.value,
      onChanged: (value) {
        if (value == null) {
          return;
        }

        // form.status.value = value;
      },
    );
  }
}
