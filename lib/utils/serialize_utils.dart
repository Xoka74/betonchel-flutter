import 'package:intl/intl.dart';

class SerializeUtils {

  static String formatToDate(DateTime? date){
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date ?? DateTime.now());
  }
}