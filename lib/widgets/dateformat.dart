import 'package:intl/intl.dart';

class dateFormat {
  static String dateOnly(String date) {
    DateTime parsedDate = DateTime.parse(date);
    final DateFormat formatter = DateFormat('dd MMMM yyyy');
    final String formatted = formatter.format(parsedDate);

    return formatted;
  }

  static String timeOnly(String date) {
    DateTime parsedDate = DateTime.parse(date);
    final DateFormat formatter = DateFormat('HH:mm');
    String formatted = formatter.format(parsedDate);

    if(formatted == "00:00"){
      formatted = "-";
    }

    return formatted;
  }

  static String date(String date) {
    DateTime parsedDate = DateTime.parse(date);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(parsedDate);

    return formatted;
  }
}