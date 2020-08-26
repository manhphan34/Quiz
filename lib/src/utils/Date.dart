import 'package:intl/intl.dart';

class DateTimeFormat{
   static String getDate(DateTime date) {
    final f = DateFormat("dd-MM-yyyy");
    return f.format(DateTime.fromMicrosecondsSinceEpoch(
        date.millisecondsSinceEpoch * 1000));
  }
}