import 'package:flutter/widgets.dart';

class StepPageState {
  final int currentStep;
  final List<bool> stepCompleted;
  final PageController pageController;

  StepPageState({
    required this.currentStep,
    required this.stepCompleted,
    required this.pageController,
  });
  StepPageState copyWith({int? currentStep, List<bool>? stepCompleted}) {
    return StepPageState(
      currentStep: currentStep ?? this.currentStep,
      stepCompleted: stepCompleted ?? this.stepCompleted,
      pageController: pageController,
    );
  }
}
