//function returning ebanutuyu stroky django from datetime object
String djangoS(DateTime date) {
  return date.year.toString() +
      "-" +
      date.month.toString() +
      "-" +
      date.day.toString() +
      "T" +
      date.hour.toString() +
      ":" +
      date.minute.toString() +
      ":" +
      date.second.toString() +
      "Z";
}

String normalS(DateTime date) {
  String hour = date.hour.toString();
  String minute = date.minute.toString();
  if (hour.length < 2) {
    hour = "0" + hour;
  }
  if (minute.length < 2) {
    minute = "0" + minute;
  }
  return hour + ":" + minute;
}

String dmy(DateTime date) {
  return date.day.toString() +
      "." +
      date.month.toString() +
      "." +
      date.year.toString().substring(2);
}
