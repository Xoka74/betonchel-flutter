import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';
import 'package:betonchel_manager/domain/models/concrete/concrete_grade_type.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ConcreteGradeExtension on ConcreteGrade {
  String shortTitle(AppLocalizations strings) {
    final nameTitle = switch (name) {
      ConcreteGradeType.common => '',
      ConcreteGradeType.fine => '   ${strings.fine}',
    };

    return mark + nameTitle;
  }
}
