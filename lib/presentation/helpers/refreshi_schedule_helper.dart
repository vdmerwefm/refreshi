class RefreshiScheduleHelper {
  static const _hours = [9, 11, 14, 16];

  //next 3 days at fixed times
  static List<DateTime> slots(DateTime now) => [
    for (var day = 1; day <= 3; day++)
      for (final hour in _hours)
        DateTime(now.year, now.month, now.day + day, hour),
  ];

  //a restored time can expire overnight, the bloc drops it when this is false
  static bool isBookable(String? scheduledTime, List<DateTime> slots) =>
      scheduledTime != null &&
      slots.any((slot) => slot.toIso8601String() == scheduledTime);

  static Map<DateTime, List<DateTime>> slotsByDay(List<DateTime> slots) {
    final days = <DateTime, List<DateTime>>{};
    for (final slot in slots) {
      days
          .putIfAbsent(DateTime(slot.year, slot.month, slot.day), () => [])
          .add(slot);
    }
    return days;
  }
}
