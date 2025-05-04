import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/src/feature/service_details_screen/Riverpod/calender_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CustomCalendarWidget extends StatelessWidget {
  final List<String> timeSlots = ['11:00am', '12:00pm', '12:00pm'];

   CustomCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final focusedDay = ref.watch(focusedDayProvider);
            final selectedDay = ref.watch(selectedDayProvider);

            return Container(
              width: 400,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: focusedDay,
                    selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                    onDaySelected: (selected, focused) {
                      ref.read(selectedDayProvider.notifier).state = selected;
                      ref.read(focusedDayProvider.notifier).state = focused;
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.blue[200],
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      leftChevronIcon:
                          Icon(Icons.arrow_back_ios_new, size: 16),
                      rightChevronIcon:
                          Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      selectedDay != null
                          ? DateFormat('EEEE, MMMM').format(selectedDay)
                          : 'Select a day',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...timeSlots.map(
                    (slot) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                        width: 350.w,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Text(slot)),
                      ),
                    ),
                  ),
                  Container(
                    width: 350.w,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Set Time",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.primary),
                          ),
                          SizedBox(width: 5.w),
                          SvgPicture.asset(AppIcons.tab),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
