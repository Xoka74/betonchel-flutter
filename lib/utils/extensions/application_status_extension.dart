import 'package:betonchel_manager/domain/models/application/application_status.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ApplicationStatusExtension on ApplicationStatus {
  String title(AppLocalizations strings) => switch (this) {
        ApplicationStatus.created => strings.created,
        ApplicationStatus.pending => strings.pending,
        ApplicationStatus.finished => strings.finished,
        ApplicationStatus.unknown => strings.unknown,
        ApplicationStatus.cancelled => strings.cancelled,
      };
}
