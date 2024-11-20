import 'package:betonchel_manager/di/constants/injection_keys.dart';
import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OrdersMapContent extends StatefulWidget {
  final List<Order> orders;
  final DateTime date;
  final Function(Order) onOrderClick;

  const OrdersMapContent({
    super.key,
    required this.orders,
    required this.date,
    required this.onOrderClick,
  });

  @override
  State<OrdersMapContent> createState() => _OrdersMapContentState();
}

class _OrdersMapContentState extends State<OrdersMapContent> with SingleTickerProviderStateMixin {
  late final MapController _mapController;

  @override
  void initState() {
    _mapController = MapController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: locator<LatLng>(instanceName: InjectionKeys.defaultLocation),
        initialZoom: 9.2,
      ),
      children: [
        TileLayer(
          urlTemplate: locator<String>(instanceName: InjectionKeys.tileMapProvider),
        ),
        MarkerLayer(
          markers: [
            for (final order in widget.orders)
              Marker(
                point: LatLng(
                  order.location.latitude,
                  order.location.longitude,
                ),
                width: 40,
                height: 40,
                child: GestureDetector(
                  onTap: () => widget.onOrderClick(order),
                  child: Column(
                    children: [
                      Image.asset('assets/images/place.png'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _mapController.dispose();

    super.dispose();
  }
}
