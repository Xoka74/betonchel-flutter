import 'package:betonchel_manager/domain/models/notification/notification.dart';
import 'package:betonchel_manager/presentation/res/assets/assets.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:betonchel_manager/utils/extensions/datetime_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class AppNotificationItem extends StatelessWidget {
  final AppNotification notification;
  final Function(AppNotification) onClicked;

  const AppNotificationItem({
    super.key,
    required this.notification,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    final title = 'Заявка №${notification.applicationId}';

    final description = switch (notification) {
      ApplicationCreatedNotification() => 'Добавлена новая заявка',
      ApplicationUpdatedNotification() => 'Обновлены данные заявки',
    };

    final color = switch (notification) {
      ApplicationCreatedNotification() => Colors.red,
      ApplicationUpdatedNotification() => Colors.yellow,
    };

    final asset = switch (notification) {
      ApplicationCreatedNotification() => Assets.iconsAddCircle,
      ApplicationUpdatedNotification() => Assets.iconsExclamationMark,
    };

    final borderRadius = BorderRadius.circular(24.0);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () => onClicked.call(notification),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    DateFormat('HH:mm').format(notification.time),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notification.time.toLocaleDateFormat(strings),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const VerticalDivider(
                width: 20,
                color: Colors.red,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          asset,
                          width: 16,
                          height: 16,
                          colorFilter: ColorFilter.mode(
                            color,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(description),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
