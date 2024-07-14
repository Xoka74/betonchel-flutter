import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/presentation/res/assets/assets.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:betonchel_manager/utils/extensions/user_role_extension.dart';
import 'package:flutter/material.dart';

class EmployeesListContent extends StatelessWidget {
  final List<User> employees;
  final Function(User)? onEmployeeClicked;

  const EmployeesListContent({
    super.key,
    required this.employees,
    this.onEmployeeClicked,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    final columns = [
      strings.fullName,
      strings.email,
      strings.role,
    ];

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryButton(
              onPressed: () => context.navigateTo(const EmployeeCreatePage()),
              iconStart: Assets.iconsAddCircle,
              child: Text(strings.newEmployee),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: DataTable(
              showCheckboxColumn: false,
              columns: columns.map((e) => DataColumn(label: SelectableText(e))).toList(),
              rows: employees
                  .map(
                    (app) => DataRow(
                      onSelectChanged: (selected) {
                        if (selected ?? false) {
                          onEmployeeClicked?.call(app);
                        }
                      },
                      cells: [
                        ..._cellsBuilder(app, context).map(
                          (e) => DataCell(Text(e)),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  List<String> _cellsBuilder(User user, BuildContext context) => [
        user.username,
        user.email,
        user.role.title(context.strings),
      ];
}
