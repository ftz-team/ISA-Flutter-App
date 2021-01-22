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
  String day, month, year;
  day = date.day.toString();
  month = date.month.toString();
  year = date.year.toString();
  if (day.length < 2) {
    day = "0" + day;
  }
  if (month.length < 2) {
    month = "0" + month;
  }
  return day + "." + month + "." + year.substring(2);
}
