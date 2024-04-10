import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable(createToJson: false)
class Notification extends Equatable {
  final String id;

  const Notification({
    required this.id,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  @override
  List<Object?> get props => [
        id,
      ];
}
