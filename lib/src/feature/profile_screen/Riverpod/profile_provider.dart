import 'dart:io';
import 'dart:convert';

import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/Riverpod/login_provider.dart';
import 'package:car_wash/src/feature/profile_screen/Riverpod/profile_provider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart'; // For MediaType
import '../../../../core/services/api_services/api_services.dart';

final profileEditProvider =
    StateNotifierProvider<ProfileImagePicker, ProfileImagePickerState>((ref) {
      final userToken = ref.watch(loginProvider).userToken;
      final loginNotifier = ref.read(loginProvider.notifier);
      return ProfileImagePicker(
        userToken: userToken ?? "",
        loginNotifier: loginNotifier,
      );
    });

class ProfileImagePicker extends StateNotifier<ProfileImagePickerState> {
  final LoginNotifier loginNotifier;
  final String userToken;
  ProfileImagePicker({required this.userToken, required this.loginNotifier})
    : super(ProfileImagePickerState());

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

  /// ========================================= ///
  Future<void> onSubmit({
    String? name,
    String? address,
    String? phone,
    String? password,
  }) async {
    try {
    //  state = state.copyWith(isLoading: true);
    /// Define the URI
    var uri = Uri.parse('${ApiEndPoints.baseUrl}/${ApiEndPoints.editProfile}');

    /// Create a MultipartRequest
    var request = http.MultipartRequest('PATCH', uri);

    debugPrint("\ntoken in edit profile : $userToken\n");

    /// Add headers
    request.headers['Authorization'] = "Bearer $userToken";

    /// Add text fields
    if (name != null) {
      request.fields['name'] = name;
    }
    if (address != null) {
      request.fields['address'] = address;
    }
    if (phone != null) {
      request.fields['phone_number'] = phone;
    }
    if (password != null) {
      request.fields['password'] = password;
    }

    /// Add the image file if it exists
    if (state.profileImage != null) {
      XFile compressedImage = XFile(state.profileImage!.path);

      File imageFile = File(compressedImage.path);

      // Determine the MIME type of the image (you might need to adjust this)
      String mimeType = lookupMimeType(imageFile.path) ?? 'image/jpeg';
      var mimeSplit = mimeType.split('/');

      // Create a MultipartFile
      var multipartFile = await http.MultipartFile.fromPath(
        'avatar',
        imageFile.path,
        contentType: MediaType(mimeSplit[0], mimeSplit[1]),
      );

      request.files.add(multipartFile);
    }


      /// Send the request
      var streamedResponse = await request.send();

      /// Get the response
      var response = await http.Response.fromStream(streamedResponse);
      var decodedData = jsonDecode(response.body);

      debugPrint("\nRaw json data : $decodedData\n");

      if (decodedData["success"] == true) {
        await loginNotifier.updateUserModel();
       // state = state.copyWith(isLoading: false);
      } else {
       // state = state.copyWith(isLoading: false);
        throw Exception(
          "failed to edit profile. Update failed: ${decodedData["message"]}",
        );
      }

    } catch (error) {
      // state = state.clear();
      throw Exception("Error during profile update: $error");
    }
  }

  /// Utility method to determine MIME type
  String? lookupMimeType(String path) {
    final extension = path.split('.').last.toLowerCase();
    switch (extension) {
      case 'png':
        return 'image/png';
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'gif':
        return 'image/gif';
      default:
        return null;
    }
  }
}
