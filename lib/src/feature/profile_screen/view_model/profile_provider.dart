import 'package:car_wash/src/feature/profile_screen/Riverpod_Model/profile_State_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepPageNotifier extends StateNotifier<StepPageState> {
  StepPageNotifier()
    : super(
        StepPageState(
          currentStep: 0,
          stepCompleted: [false, false, false, false],
          pageController: PageController(),
        ),
      );
  void markStepComplete(bool isComplete) {
    final updateList = [...state.stepCompleted];
    updateList[state.currentStep] = isComplete;
    state = state.copyWith(stepCompleted: updateList);
  }


  void nextStep() {
    if (state.currentStep < 3) {
      final newStep = state.currentStep + 1;
      state.pageController.animateToPage(
        newStep,
        duration: Duration(microseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      final newStep = state.currentStep - 1;
      state.pageController.animateToPage(
        newStep,
        duration: Duration(microseconds: 300),
        curve: Curves.easeInOut,
      );
          state = state.copyWith(currentStep: newStep); 

    }
  }

  void onPageChanged(int index) {
    state = state.copyWith(currentStep: index);
  }

  bool get isStepComplete => state.stepCompleted[state.currentStep];
 
}
 final StepControllerProvider =
      StateNotifierProvider<StepPageNotifier, StepPageState>((ref) {
        return StepPageNotifier();
      });