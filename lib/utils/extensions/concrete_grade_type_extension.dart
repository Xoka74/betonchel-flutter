import 'package:betonchel_manager/domain/models/concrete/concrete_grade_type.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ConcreteGradeTypeExtension on ConcreteGradeType {
  String title(AppLocalizations strings) => switch (this) {
        ConcreteGradeType.common => strings.common,
        ConcreteGradeType.fine => strings.fine,
      };
}
