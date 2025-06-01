import 'dart:convert';
import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  /// Helper method to handle the response
  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201){
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}, ${response.body}');
    }
  }

  /// http Post request service
  static Future<dynamic> postData({
    required String endPoint,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async
  {
    try {
      final isOnline = await Utils.isOnline();
      if(isOnline){
        final response = await http.post(
          Uri.parse('${ApiEndPoints.baseUrl}/$endPoint'),
          headers: headers,
          body: jsonEncode(body),
        );
        return _handleResponse(response);
      }
      else{
        throw Exception('Device is Offline, Please connect to internet.');
      }

    } catch (e) {
      throw Exception("Failed to send data: $e");
    }
  }

  /// http get request service
  static Future<dynamic> getData({
    required String endPoint,
    required Map<String, String> headers,
  }) async
  {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndPoints.baseUrl}/$endPoint'),
        headers: headers,
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to send data: $e");
    }
  }

  /// http Put request service
  static Future<dynamic> putData({
    required String endPoint,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async
  {
    try {
      final response = await http.put(
        Uri.parse('${ApiEndPoints.baseUrl}/$endPoint'),
        headers: headers,
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to send data: $e");
    }
  }
}
