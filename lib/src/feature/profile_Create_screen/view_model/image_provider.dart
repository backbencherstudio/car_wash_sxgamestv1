import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerProvider = StateNotifierProvider<ImagePickerNotifier, ImagePickerState>(
  (ref) => ImagePickerNotifier(),
);

class ImagePickerState {
  final File? profile;
  final File? licenseFront;
  final File? licenseBack;

  ImagePickerState({
    this.profile,
    this.licenseFront,
    this.licenseBack,
  });

  ImagePickerState copyWith({
    File? profile,
    File? licenseFront,
    File? licenseBack,
  }) {
    return ImagePickerState(
      profile: profile ?? this.profile,
      licenseFront: licenseFront ?? this.licenseFront,
      licenseBack: licenseBack ?? this.licenseBack,
    );
  }

  ImagePickerState clear(String id) {
    if (id == 'profile') {
      return copyWith(profile: null);
    } else if (id == 'licenseFront') {
      return copyWith(licenseFront: null);
    } else if (id == 'licenseBack') {
      return copyWith(licenseBack: null);
    }
    return this;
  }
}

class ImagePickerNotifier extends StateNotifier<ImagePickerState> {
  ImagePickerNotifier() : super(ImagePickerState());

  final ImagePicker _picker = ImagePicker();

  Future<void> pickFromGallery(String id) async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _setFile(id, File(picked.path));
    }
  }

  Future<void> pickFromCamera(String id) async {
    final picked = await _picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      _setFile(id, File(picked.path));
    }
  }

  void clearImage(String id) {
    state = state.clear(id);
  }

  void _setFile(String id, File file) {
    if (id == 'profile') {
      state = state.copyWith(profile: file);
    } else if (id == 'licenseFront') {
      state = state.copyWith(licenseFront: file);
    } else if (id == 'licenseBack') {
      state = state.copyWith(licenseBack: file);
    }
  }
}
