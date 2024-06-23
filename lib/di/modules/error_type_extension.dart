import 'package:betonchel_manager/domain/models/error/error_type.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ErrorTypeExtension on ErrorType {
  String title(AppLocalizations strings) => switch (this) {
        ErrorType.concreteGradeNotExist => strings.concreteGradeNotExist,
        ErrorType.unexpectedError => strings.unexpectedError,
        ErrorType.applicationHasConcreteGrade => throw UnimplementedError(),
      };
}
