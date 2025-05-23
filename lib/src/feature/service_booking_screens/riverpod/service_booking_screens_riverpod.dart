import 'package:car_wash/src/feature/service_booking_screens/riverpod/service_booking_screens_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_name.dart';
import '../view/widgets/extra_payment_bottom_sheet.dart';

final serviceBookingRiverpod = StateNotifierProvider<ServiceBookingRiverpod, ServiceBookingState>(
(ref)=>ServiceBookingRiverpod()
);



class ServiceBookingRiverpod extends StateNotifier<ServiceBookingState>{
  ServiceBookingRiverpod() : super(ServiceBookingState());


  void onSelectServiceTimeType({required ServiceTime selectedService}){
    if(selectedService == state.selectedServiceTimeType) return;
    state = state.copyWith(selectedServiceTimeType : selectedService);
  }

  void onSelectServiceType({required ServiceType selectedServiceType}){
    if(selectedServiceType == state.selectedServiceType) return;
    state = state.copyWith(selectedServiceType : selectedServiceType);
  }

  void onSelectLocationDetectType({required LocationDetectType locationDetectType}) {
    if(locationDetectType == state.locationDetectType) return;
    state = state.copyWith(locationDetectType : locationDetectType);
  }


  void onPickedDate({required DateTime pickedDate,}){
    state = state.copyWith(
      pickedDate: pickedDate,
    );
  }

  void onPickedTime({  required TimeOfDay pickedTime}){
    state = state.copyWith(
      pickedTime: pickedTime,
    );
  }


  void onContinueToBooking({required BuildContext context, required TabController tabController, required VoidCallback onAutoDetectLocation}) async {
    DateTime? pickedDate;
    TimeOfDay? picked;
    // if(tabController.index==1){
    //   tabController.animateTo(2);
    // }
    /// If user select "Schedule Service then show date picker and time picker
    /// Default picked date is today
    /// after picked date and time, store it in service booking state's variable
    if (tabController.index == 0 && state.selectedServiceTimeType == ServiceTime.scheduledService)
    {
      /// Date picker
      pickedDate = await showDatePicker(
        initialDate: DateTime.now(),
        context: context,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 11),
      );
      debugPrint("\npicked date : $pickedDate\n");

      /// Time picker
      picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (_, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              textTheme: Theme.of(
                context,
              ).textTheme.copyWith(
                bodySmall: TextStyle(
                  color: Colors.transparent,
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      debugPrint("\npicked time : $picked\n");
      /// Storing picked date and time
      if (pickedDate != null && picked != null) {
        onPickedDate(
          pickedDate: pickedDate,
        );
        onPickedTime(
          pickedTime: picked,
        );
      }
    }
    else if(tabController.index == 0 && state.selectedServiceTimeType == ServiceTime.instantService){
      await showPaymentBottomSheet(context: context);
    }

    if(tabController.index == 0 && state.selectedServiceTimeType == ServiceTime.instantService){
      tabController.animateTo(1);
      return;
    }

    /// If Tab index is the last one, and location detection type is selected to auto
    /// then just call the google Map Notifier auto detect location method
    /// Else navigate to the google map screen
    if (tabController.index + 1 == tabController.length) {
      /// Automatically detecting location
      if (state.locationDetectType ==
          LocationDetectType.auto) {
        onAutoDetectLocation();
      } else {
        /// Navigate to the google map screen
        context.push(RouteName.googleMapScreen);
      }
    }
    /// Checking and assuring if the service time is selected to schedule service
    /// the picked date and time is not  null
    else if ((state
        .selectedServiceTimeType ==
        ServiceTime.scheduledService) &&
        (pickedDate != null || picked != null)) {
      tabController.animateTo(tabController.index + 1);
      return;
    }

  }

}