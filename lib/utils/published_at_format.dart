import 'package:date_format/date_format.dart';

final refDate = DateTime(2019).toUtc();

String dateToHuman(DateTime time) {
  time = time.toLocal();
  return formatDate(time, [yyyy, '-', mm, '-', dd, '_', hh, ':', nn, ':', ss]);
}

String publishedAtSecondsToHuman(int seconds) => seconds.toRadixString(26);

String publishedAtDateToHuman(DateTime time) =>
    time.toUtc().difference(refDate).inSeconds.toRadixString(26);

DateTime publishedAtHumanToDate(String human) {
  int seconds = int.tryParse(human, radix: 26);
  if (seconds == null) return null;
  return refDate.toUtc().add(Duration(seconds: seconds));
}

String publishedAtHumanToString(String human) {
  final time = publishedAtHumanToDate(human);
  if (time == null) return null;
  return dateToHuman(time);
}

String versionToHuman(String str) {
  if (str == null) return "None";
  if (str == null) return "None";

  final parts = str.split(":");

  final second = publishedAtHumanToString(parts.last);

  return "${parts.first}:$second";
}
