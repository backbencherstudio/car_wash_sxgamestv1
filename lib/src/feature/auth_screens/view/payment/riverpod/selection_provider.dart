import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectionProvider = StateNotifierProvider<SelectionNotifier, int>(
  (ref) => SelectionNotifier(),
);

class SelectionNotifier extends StateNotifier<int> {
  SelectionNotifier() : super(-1); // -1 means no selection

  void toggle(int index) {
    if (state == index) {
      state = -1; 
    } else {
      state = index;
    }
  }
}
final isCheckedProvider = StateNotifierProvider<CheckNotifier,bool>((ref){
  return CheckNotifier();
});

class CheckNotifier extends StateNotifier<bool>{
  CheckNotifier():super(false);
void isChecked(){
  state =!state;
}
}