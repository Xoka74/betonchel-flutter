import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable(createToJson: false)
class Customer extends Equatable {
  final int id;
  final String name;
  @JsonKey(name: 'contact_data')
  final String contactData;

  const Customer({
    required this.id,
    required this.name,
    required this.contactData,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        contactData,
      ];
}
