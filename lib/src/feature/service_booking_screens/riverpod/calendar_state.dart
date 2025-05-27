import 'package:flutter/material.dart';

class CalendarState {
  DateTime? focusedDay = DateTime.now();
  DateTime? selectedDay;
  TimeOfDay? selectedTime;

  CalendarState({this.focusedDay, this.selectedDay, this.selectedTime});

  CalendarState copyWith({
    DateTime? focusedDay,
    DateTime? selectedDay,
    TimeOfDay? selectedTime,
  }) {
    return CalendarState(
      selectedTime: selectedTime ?? this.selectedTime,
      focusedDay: focusedDay ?? this.focusedDay,
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }
}
