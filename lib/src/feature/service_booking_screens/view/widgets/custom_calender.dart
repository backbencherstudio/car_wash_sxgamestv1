import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/service_booking_screens/riverpod/calendar_riverpod.dart';
import 'package:car_wash/src/feature/service_booking_screens/riverpod/service_booking_screens_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CustomCalendarWidget extends StatelessWidget {
  final List<String> timeSlots = ['11:00am', '12:00pm', '12:00pm'];

   CustomCalendarWidget({super.key});

   Widget circleIconButton({required String iconPath, required VoidCallback onTap, required bool isActive}){
     return GestureDetector(
       onTap: onTap,
       child: Container(
         padding: EdgeInsets.all(10.r),
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           border: Border.all(color: isActive ?  AppColors.primary : Colors.grey, width: 1.5)
         ),
         child:SvgPicture.asset(
           iconPath,
           colorFilter: ColorFilter.mode( isActive ? AppColors.primary : Colors.grey, BlendMode.srcIn),
        width: 12.w,
        height: 12.w,
         fit: BoxFit.cover,
         )
       ),
     );
   }

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 400.w,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Consumer(
              builder: (_, ref, _) {
                final calendarNotifier = ref.read(calendarRiverpod.notifier);
                final calendarState = ref.watch(calendarRiverpod);
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Row(
                      spacing: 15.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        circleIconButton(
                          iconPath: AppIcons.angleLeft,
                          isActive: !calendarState.focusedDay!.isBefore(DateTime.now()),
                          onTap:(){


                          if(calendarState.focusedDay!.isBefore(DateTime.now())) return;
                          calendarNotifier.goToPreviousMonth();

                        } ,),

                        Text("${Utils.monthToString(calendarState.focusedDay!.month)} ${calendarState.focusedDay!.year}",
                        style: Theme.of(context).textTheme.bodyMedium,
                        ),

                        circleIconButton(iconPath: AppIcons.angleRight,
                          onTap: calendarState.focusedDay!.isAfter(DateTime(DateTime.now().year+1)) ? (){}: calendarNotifier.goToNextMonth,
                          isActive: !calendarState.focusedDay!.isAfter(DateTime(DateTime.now().year+1))
                        ),
                      ],
                    ),

                    SizedBox(height: 8.h,),

                    Divider(color: Colors.grey.withValues(alpha: 0.1),),

                    SizedBox(height: 16.h,),

                    TableCalendar(
                      firstDay: DateTime.now(),
                      lastDay: DateTime(DateTime.now().year+2),
                      focusedDay: calendarState.focusedDay!,
                     selectedDayPredicate: (day) => isSameDay(calendarState.selectedDay, day),
                      onDaySelected: (selected, focused) {
                     //   if(selected.day < DateTime.now().day) return;
                        calendarNotifier.selectDay(selectedDay: selected);
                        ref.read(serviceBookingRiverpod.notifier).pickedDate(pickedDate: selected);
                        debugPrint("\nIn Calendar, selected day : ${calendarState.selectedDay}\n");
                      },
                      headerVisible: false,
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: Theme.of(context).textTheme.bodyLarge!,
                        todayTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.textColor),
                        todayDecoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary),
                        //  color: AppColors.primary,
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),

                      ),
                      // headerStyle: HeaderStyle(
                      //   formatButtonVisible: false,
                      //   titleCentered: true,
                      //   leftChevronIcon:
                      //       Icon(Icons.arrow_back_ios_new, size: 16),
                      //   rightChevronIcon:
                      //       Icon(Icons.arrow_forward_ios, size: 16),
                      // ),
                    ),

                    SizedBox(height: 20.h),

                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Text(
                    //     "${ Utils.weekdayToString(DateTime.now().weekday)}, ${  Utils.monthToString(DateTime.now().month)}",
                    //     style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)
                    //   ),
                    // ),
                    //
                    // SizedBox(height: 14.h,),
                    
                   Utils.primaryButton(
                       onPressed: () async {
                         // if(calendarState.selectedDay != null){
                         //   debugPrint("\n\nEntered in if condition\n\n");
                         //   ref.read(serviceBookingRiverpod.notifier).pickedDate(
                         //     pickedDate: calendarState.selectedDay!,
                         //   );
                         //
                         // }
                         //
                         // if(calendarState.selectedDay==null) return;
                         // final TimeOfDay? picked = await showTimePicker(
                         //   context: context,
                         //   initialTime: TimeOfDay.now(),
                         //   builder: (_, child){
                         //     return Theme(
                         //       data: Theme.of(context).copyWith(
                         //         textTheme: Theme.of(context).textTheme.copyWith(bodySmall : TextStyle(color: Colors.transparent))
                         //       ),
                         //       child: child!,
                         //     );
                         //   }
                         // );
                         // if(picked != null){
                         //   calendarNotifier.selectTime(selectedTime: picked);
                         //   ref.read(serviceBookingRiverpod.notifier).pickedTime(
                         //     pickedTime: picked,
                         //   );
                         // }
                         Navigator.pop(context);
                         },
                       text: "Continue"
                   )
                    
                    // Container(
                    //   width: 350.w,
                    //   padding: EdgeInsets.all(8),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey),
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(4),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Text(
                    //           "Set Time",
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .bodyMedium!
                    //               .copyWith(color: AppColors.primary),
                    //         ),
                    //         SizedBox(width: 5.w),
                    //         SvgPicture.asset(AppIcons.tab),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                );
              }
            ),
          );


  }
}
