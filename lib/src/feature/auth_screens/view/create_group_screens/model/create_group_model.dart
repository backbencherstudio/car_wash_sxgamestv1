class CreateGroupModel{
final String selectedLabel;

  CreateGroupModel({this.selectedLabel = " "});

  CreateGroupModel copyWith({String? selectedLabel}){
    return CreateGroupModel(selectedLabel: selectedLabel ?? this.selectedLabel);
  }
}