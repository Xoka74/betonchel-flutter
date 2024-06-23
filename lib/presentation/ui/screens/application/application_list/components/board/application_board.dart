import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:betonchel_manager/domain/models/application/application_status.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_list/components/board/application_board_card.dart';
import 'package:betonchel_manager/utils/extensions/application_status_extension.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';

class ApplicationBoard extends StatelessWidget {
  final List<Application> applications;

  const ApplicationBoard({
    super.key,
    required this.applications,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Column(
      children: [
        ...ApplicationStatus.values.map(
          (e) => Expanded(
            child: Column(
              children: [
                Text(e.title(strings)),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ApplicationBoardCard(
                      application: applications.where((element) => element.status == e).toList()[index],
                      onClicked: (application) => context.router.navigate(
                        ApplicationDetailsPage(
                          id: application.id,
                          key: ValueKey(application.id),
                        ),
                      ),
                    ),
                    itemCount: applications.where((element) => element.status == e).length,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
