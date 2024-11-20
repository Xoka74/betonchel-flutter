import 'package:json_annotation/json_annotation.dart';

part 'user_filters.g.dart';

@JsonSerializable(createFactory: false)
class UserFilters {
  final String? searchQuery;

  UserFilters({
    this.searchQuery,
  });
}
