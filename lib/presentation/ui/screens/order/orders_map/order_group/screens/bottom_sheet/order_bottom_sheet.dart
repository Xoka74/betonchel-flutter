import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/order_group/dependencies/order_bottom_sheet_dependencies.dart';
import 'package:flutter/material.dart';

class OrderBottomSheet extends StatelessWidget {
  final Order order;
  final VoidCallback onCloseClick;

  const OrderBottomSheet({
    super.key,
    required this.order,
    required this.onCloseClick,
  });

  @override
  Widget build(BuildContext context) {
    return OrderBottomSheetDependencies(
      child: DraggableScrollableSheet(
        snap: true,
        minChildSize: 0.1,
        maxChildSize: 1,
        snapSizes: const [
          0.3,
          0.7,
        ],
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: CustomScrollViewContent(
              title: order.location.name,
              onCloseClick: onCloseClick,
            ),
          );
        },
      ),
    );
  }
}

class CustomScrollViewContent extends StatelessWidget {
  final String title;
  final VoidCallback onCloseClick;

  const CustomScrollViewContent({
    super.key,
    required this.title,
    required this.onCloseClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: CustomInnerContent(
          title: title,
          onCloseClick: onCloseClick,
        ),
      ),
    );
  }
}

class CustomInnerContent extends StatelessWidget {
  final String title;
  final VoidCallback onCloseClick;

  const CustomInnerContent({
    super.key,
    required this.title,
    required this.onCloseClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        const CustomDraggingHandle(),
        const SizedBox(height: 16),
        BottomSheetHeader(
          title: title,
          onCloseClick: onCloseClick,
        ),
        const SizedBox(height: 16),
        const CustomFeaturedListsText(),
        const SizedBox(height: 16),
        CustomFeaturedItemsList(),
        const SizedBox(height: 24),
      ],
    );
  }
}

class CustomDraggingHandle extends StatelessWidget {
  const CustomDraggingHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 30,
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
    );
  }
}

class BottomSheetHeader extends StatelessWidget {
  final String title;
  final VoidCallback onCloseClick;

  const BottomSheetHeader({
    super.key,
    required this.title,
    required this.onCloseClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(fontSize: 22, color: Colors.black45),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class CustomFeaturedListsText extends StatelessWidget {
  const CustomFeaturedListsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Text(
            'Featured Lists',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class CustomFeaturedItemsList extends StatelessWidget {
  CustomFeaturedItemsList({super.key});

  final widgets = [
    const CustomFeaturedItem(),
    const CustomFeaturedItem(),
    const CustomFeaturedItem(),
    const CustomFeaturedItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => widgets[index],
        itemCount: widgets.length,
      ),
    );
  }
}

class CustomFeaturedItem extends StatelessWidget {
  const CustomFeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
