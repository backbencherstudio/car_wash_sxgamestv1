import 'package:car_wash/src/feature/service_booking_screens/riverpod/calendar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calendarRiverpod = StateNotifierProvider<CalendarRiverpod, CalendarState>(
  (ref) => CalendarRiverpod(),
);

class CalendarRiverpod extends StateNotifier<CalendarState> {
  CalendarRiverpod() : super(CalendarState()) {
    state = state.copyWith(focusedDay: DateTime.now());
  }

  void goToPreviousMonth() {
    state = state.copyWith(
      focusedDay: state.focusedDay!.subtract(const Duration(days: 30)),
    );
  }

  void goToNextMonth() {
    state = state.copyWith(
      focusedDay: state.focusedDay!.add(const Duration(days: 30)),
    );
  }

  void selectDay({required DateTime selectedDay}) {
    state = state.copyWith(selectedDay: selectedDay);
  }

  void selectTime({required TimeOfDay selectedTime}) {
    state = state.copyWith(selectedTime: selectedTime);
  }

  void setFocusedDay({required DateTime focusedDay}) {
    state = state.copyWith(focusedDay: focusedDay);
  }
}
