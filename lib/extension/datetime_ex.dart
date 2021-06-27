import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String convertToTweetDateFormat() {
    return DateFormat('yyyy/MM/dd HH:mm').format(toLocal());
  }

  String convertToEventDateFormat() {
    return DateFormat('M/d').format(toLocal());
  }
}
