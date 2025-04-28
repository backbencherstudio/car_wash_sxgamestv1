import 'dart:io';
import 'package:car_wash/src/feature/profile_screen/Riverpod/profile_provider_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final profileImagePickerProvider = StateNotifierProvider<ProfileImagePicker, ProfileImagePickerState>((ref) {
  return ProfileImagePicker();
});

class ProfileImagePicker extends StateNotifier<ProfileImagePickerState> {
  ProfileImagePicker() : super(ProfileImagePickerState());

  final ImagePicker _picker = ImagePicker();
  File? _profile;

  Future<void> pickFromGallery() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _profile = File(picked.path);
      state = state.copyWith(profileImage: _profile);
    }
  }

  Future<void> pickFromCamera() async {
    final picked = await _picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      _profile = File(picked.path);
      state = state.copyWith(profileImage: _profile);
    }
  }

  void clearImage() {
   state = state.clear(); 
  }
}
