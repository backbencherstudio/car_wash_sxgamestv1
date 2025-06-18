import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/api_services/api_endpoints.dart';
import '../../../../core/services/api_services/api_services.dart';
import '../../auth_screens/view/signin_screens/Riverpod/login_provider.dart';
import '../model/client_review_model.dart';

final clientReviewListProvider = FutureProvider<List<ClientReviewModel>>((ref) async {
  final userToken = ref.watch(loginProvider).userToken;
  try {
    final header = {
      'Authorization':
      'bearer $userToken',
    };

    final data = await ApiServices.instance.getData(
      endPoint: ApiEndPoints.clientReview,
      headers: header,
    );

    debugPrint("\nSuccessfully fetched client review list : ${data['data']}\n");

    final List<ClientReviewModel> clientReviewList = (data['data'] as List)
        .map((item) => ClientReviewModel.fromJson(item))
        .toList();
    debugPrint("\nfirst review : ${clientReviewList[0].description}\n");

    return clientReviewList;
  } catch (e) {
    throw Exception('Error while getting client review list: $e');
  }
});
