class Dates {
  static bool areEquals(DateTime d1, DateTime d2) {
    final bool sameDay = d1.day == d2.day;
    final bool sameMonth = d1.month == d2.month;
    final bool sameYear = d1.year == d2.year;

    return sameDay && sameMonth && sameYear;
  }

  static bool rencents(DateTime date, int days) =>
      date.isAfter(DateTime.now().subtract(Duration(days: days)));

  static bool isToday(DateTime date) => areEquals(DateTime.now(), date);
}
