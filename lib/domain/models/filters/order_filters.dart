import 'package:betonchel_manager/domain/models/order/order_status.dart';
import 'package:betonchel_manager/utils/serialize_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_filters.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class OrderFilters {
  @JsonKey(toJson: SerializeUtils.formatToDate)
  final DateTime? date;
  final OrderStatus? status;

  OrderFilters({
    this.date,
    this.status,
  });

  Map<String, dynamic> toJson() => _$OrderFiltersToJson(this);
}
