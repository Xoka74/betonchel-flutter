import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  bool isTheSameDateWith(DateTime other) => day == other.day && month == other.month && year == other.year;

  String toLocaleDateFormat(AppLocalizations strings) => DateFormat.MMMMd(strings.localeName).format(this);
}
