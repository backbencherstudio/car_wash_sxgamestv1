import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/src/feature/order_history/feedback%20screen/riverpod/parameter_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedbackProvider = FutureProviderFamily<String, FeedbackParams>(
  (ref, perams )async{
    try {
      final payload = {
         "rating": perams.ratings,
          "description": perams.description
      };
      final response = await ApiServices.instance.postData(
        endPoint:"order-history/${perams.id}/review",
        body: payload,
        headers: {'Content-Type': 'application/json'},
        );
        return response["success"];
    } catch (e) {
      throw Exception("Failed to send feedback: $e");
    }
  } 

);