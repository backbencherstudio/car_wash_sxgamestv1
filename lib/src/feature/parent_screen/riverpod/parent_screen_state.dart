class ParentScreenState {
  final int selectedIndex;
  final bool isDrawerOpened;

  ParentScreenState({this.selectedIndex = 0, this.isDrawerOpened = false});
  ParentScreenState copyWith({int? selectedIndex, bool? isDrawerOpened}) {
    return ParentScreenState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isDrawerOpened: isDrawerOpened ?? this.isDrawerOpened,
    );
  }
}
