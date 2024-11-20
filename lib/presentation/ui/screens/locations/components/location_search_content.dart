import 'package:betonchel_manager/domain/models/location/location.dart';
import 'package:flutter/material.dart';

class LocationSearchContent extends StatelessWidget {
  final List<Location> locations;
  final void Function(Location) onClick;

  const LocationSearchContent({
    super.key,
    required this.locations,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final location = locations[index];

        return InkWell(
          onTap: () => onClick(location),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(location.name),
          ),
        );
      },
    );
  }
}
