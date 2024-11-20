import 'package:betonchel_manager/domain/models/order/order_status.dart';
import 'package:betonchel_manager/utils/serialize_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_filters.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class OrderFilters {
  @JsonKey(
    name: 'delivery_date',
    toJson: SerializeUtils.formatToDate,
  )
  final DateTime? deliveryDate;
  final OrderStatus? status;

  OrderFilters({
    this.deliveryDate,
    this.status,
  });

  Map<String, dynamic> toJson() => _$OrderFiltersToJson(this);
}
