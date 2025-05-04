import 'package:flutter_riverpod/flutter_riverpod.dart';

final focusedDayProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final selectedDayProvider = StateProvider<DateTime?>((ref) {
  return null;
});
