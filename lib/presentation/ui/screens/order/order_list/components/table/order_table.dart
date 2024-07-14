import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:betonchel_manager/utils/extensions/order_status_extension.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class OrderTable extends StatelessWidget {
  final List<Order> orders;
  final Function(Order)? onClicked;

  const OrderTable({
    super.key,
    required this.orders,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    final sortedApplications =
        orders.sortedBy<num>((element) => element.status.index).sortedBy((element) => element.deliveryDateTime);

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
                      onClicked?.call(app);
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

  List<String> _cellsBuilder(Order app, BuildContext context) => [
        app.concreteGrade.mark.toString(),
        context.strings.nCubicMeters(app.volume),
        app.deliveryAddress ?? '-',
        app.contactData,
        context.strings.nRoubles(app.totalPrice),
        app.status.title(context.strings),
        app.description,
      ];
}
