import 'package:betonchel_manager/domain/models/application/application_status.dart';
import 'package:betonchel_manager/utils/serialize_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_filters.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class ApplicationFilters {
  @JsonKey(toJson: SerializeUtils.formatToDate)
  final DateTime? date;
  final ApplicationStatus? status;

  ApplicationFilters({
    this.date,
    this.status,
  });

  Map<String, dynamic> toJson() => _$ApplicationFiltersToJson(this);
}
