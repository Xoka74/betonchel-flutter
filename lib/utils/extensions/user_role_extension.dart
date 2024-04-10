import 'package:betonchel_manager/domain/models/user/user_role.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension UserRoleExtension on UserRole {
  String title(AppLocalizations strings) => switch (this) {
        UserRole.admin => strings.admin,
        UserRole.manager => strings.manager,
      };
}
