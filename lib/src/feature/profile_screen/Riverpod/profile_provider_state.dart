import 'dart:io';

class ProfileImagePickerState {
  final File? profileImage;

  ProfileImagePickerState({this.profileImage});

  ProfileImagePickerState copyWith({File? profileImage}) {
    return ProfileImagePickerState(
      profileImage: profileImage ?? this.profileImage,
    );
  }

  ProfileImagePickerState clear() {
    return ProfileImagePickerState(profileImage: null);
  }
}