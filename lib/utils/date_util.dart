import 'package:intl/intl.dart';


class DateUtil {
  static String format(int time) {
    return DateFormat("mm:ss")
        .format(DateTime.fromMillisecondsSinceEpoch(time));
  }

  static String getDuration(int seconds) {
    String duration = "";
    int hour, min, second;

    hour = seconds ~/ 3600;
    min = (seconds - hour * 3600) ~/ 60;
    second = seconds - hour * 3600 - min * 60;
    if (hour > 0) {
      duration += hour.toString() + ":";
    }
    if (min < 10) {
      duration += "0" + min.toString() + ":";
    } else {
      duration += min.toString() + ":";
    }
    if (second < 10) {
      duration += "0" + second.toString();
    } else {
      duration += second.toString();
    }
    return duration;
  }
}
