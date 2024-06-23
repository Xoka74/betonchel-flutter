import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:betonchel_manager/utils/extensions/application_status_extension.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ApplicationTable extends StatelessWidget {
  final List<Application> applications;
  final Function(Application)? onApplicationClicked;

  const ApplicationTable({
    super.key,
    required this.applications,
    this.onApplicationClicked,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    final sortedApplications =
        applications.sortedBy<num>((element) => element.status.index).sortedBy((element) => element.deliveryDate);

    final columns = [
      strings.mark,
      strings.volume,
      strings.deliveryAddress,
      strings.contactData,
      strings.totalPrice,
      strings.status,
      strings.description,
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          showCheckboxColumn: false,
          columns: columns.map((e) => DataColumn(label: SelectableText(e))).toList(),
          rows: sortedApplications
              .map(
                (app) => DataRow(
                  onSelectChanged: (selected) {
                    if (selected ?? false) {
                      onApplicationClicked?.call(app);
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
    );
  }

  List<String> _cellsBuilder(Application app, BuildContext context) => [
        app.concreteGrade.mark.toString(),
        context.strings.nCubicMeters(app.volume),
        app.deliveryAddress ?? '-',
        app.contactData ?? '-',
        context.strings.nRoubles(app.totalPrice),
        app.status.title(context.strings),
        app.description,
      ];
}
