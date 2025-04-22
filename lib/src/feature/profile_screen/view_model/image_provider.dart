import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerProvider = StateNotifierProvider<ImagePickerNotifier, File?>((ref){
    return ImagePickerNotifier();
});


final imagePickerProviderOne = StateNotifierProvider<ImagePickerNotifier, File?>(
  (ref) => ImagePickerNotifier(),
);

final imagePickerProviderTwo = StateNotifierProvider<ImagePickerNotifier, File?>(
  (ref) => ImagePickerNotifier(),
);


class ImagePickerNotifier extends StateNotifier<File?>{
  ImagePickerNotifier(): super(null);

  final ImagePicker _picker  = ImagePicker();

  Future<void> pickFromGallery()async{
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if(picked != null){
      state = File(picked.path);
    }
  }

  Future<void> pickFromCamera() async{
    final picked = await _picker.pickImage(source: ImageSource.camera);
    if(picked != null){
      state = File(picked.path);
    }
  }

  void clearImage(){
    state = null;
  }
}
