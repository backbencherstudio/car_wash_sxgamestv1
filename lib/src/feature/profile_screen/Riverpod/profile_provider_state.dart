import 'dart:io';

class ProfileImagePickerState {
  final File? profileImage;
  final bool isLoading;

  ProfileImagePickerState({this.profileImage, this.isLoading = false});

  ProfileImagePickerState copyWith({File? profileImage, bool? isLoading}) {
    return ProfileImagePickerState(
      profileImage: profileImage ?? this.profileImage,
      isLoading:  isLoading ?? this.isLoading
    );
  }

  ProfileImagePickerState clear() {
    return ProfileImagePickerState(profileImage: null,isLoading: false);
  }
}
