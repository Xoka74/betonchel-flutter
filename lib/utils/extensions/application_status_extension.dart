import 'package:betonchel_manager/domain/models/application/application_status.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ApplicationStatusExtension on ApplicationStatus {
  String title(AppLocalizations strings) => switch (this) {
        ApplicationStatus.created => strings.created,
        ApplicationStatus.inProcess => strings.inWork,
        ApplicationStatus.successfullyFinished => strings.finished,
        ApplicationStatus.rejected => strings.cancelled,
      };
}
