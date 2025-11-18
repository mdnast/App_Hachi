import 'package:intl/intl.dart';

String formatMonthDay(DateTime date) => DateFormat('d MMMM').format(date);

String formatWeekdayShort(DateTime date) => DateFormat('EEE').format(date);

String formatMonthYear(DateTime date) => DateFormat('MMMM yyyy').format(date);

String formatFullDate(DateTime date) => DateFormat('EEEE, d MMMM yyyy').format(date);

String formatTimeRange(DateTime start, DateTime end) {
  final timeFormat = DateFormat('hh:mm a');
  return '${timeFormat.format(start)} - ${timeFormat.format(end)}';
}

String formatTime(DateTime time) => DateFormat('hh:mm a').format(time);
