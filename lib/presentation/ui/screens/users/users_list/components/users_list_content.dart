import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:betonchel_manager/navigation/web_router.gr.dart';
import 'package:betonchel_manager/presentation/res/assets/assets.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class UsersListContent extends StatelessWidget {
  final List<User> users;
  final Function(User)? onUserClicked;

  const UsersListContent({
    super.key,
    required this.users,
    this.onUserClicked,
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
              iconStart: Assets.addCircle,
              child: Text(strings.newEmployee),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: DataTable(
              showCheckboxColumn: false,
              columns: columns.map((e) => const DataColumn(label: Text(''))).toList(),
              rows: users
                  .map(
                    (app) => DataRow(
                      onSelectChanged: (selected) {
                        if (selected ?? false) {
                          onUserClicked?.call(app);
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
        // user.role.title(context.strings),
      ];
}
