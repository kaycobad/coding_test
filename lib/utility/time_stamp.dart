import 'package:intl/intl.dart';

String readTimestamp(DateTime date) {
  var now = DateTime.now();
  var diff = now.difference(date);
  var time = '';

  if (diff.inSeconds > 0 && diff.inSeconds < 60) {
    time = diff.inSeconds.toString() + ' Second(s) ago';
  } else if (diff.inMinutes > 0 && diff.inMinutes < 60) {
    time = diff.inMinutes.toString() + ' Minute(s) ago';
  } else if (diff.inHours > 0 && diff.inHours < 24) {
    time = diff.inHours.toString() + ' Hour(s) ago';
  } else if (diff.inDays > 0 && diff.inDays < 30) {
    time = diff.inDays.toString() + ' Day(s) ago';
  } else if (diff.inDays > 29 && diff.inDays < 365) {
    time = (diff.inDays / 30).floor().toString() + ' Month(s) ago';
  } else {
    time = (diff.inDays / 365).floor().toString() + ' Year(s) ago';
  }

  return time;
}

String numberFormatter(int number) {
  var formatter = NumberFormat('#,##,000');
  var result = formatter.format(number);
  return result;
}
