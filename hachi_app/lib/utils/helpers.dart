import 'package:intl/intl.dart';

String formatMonthDay(DateTime date) => DateFormat('d MMMM', 'vi').format(date);

String formatWeekdayShort(DateTime date) =>
    DateFormat('EEE', 'vi').format(date);

String formatMonthYear(DateTime date) =>
    DateFormat('MMMM yyyy', 'vi').format(date);

String formatFullDate(DateTime date) =>
    DateFormat('EEEE, d MMMM, yyyy', 'vi').format(date);

String formatTimeRange(DateTime start, DateTime end) {
  final timeFormat = DateFormat('HH:mm', 'vi');
  return '${timeFormat.format(start)} - ${timeFormat.format(end)}';
}

String formatTime(DateTime time) => DateFormat('HH:mm', 'vi').format(time);
