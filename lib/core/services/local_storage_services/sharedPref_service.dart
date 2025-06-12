import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceStorageService {
  /// Save any supported value
  static Future<void> saveData(String key, dynamic value) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      if (value is String) {
        await prefs.setString(key, value);
      } else if (value is int) {
        await prefs.setInt(key, value);
      } else if (value is bool) {
        await prefs.setBool(key, value);
      } else if (value is double) {
        await prefs.setDouble(key, value);
      } else if (value is List<String>) {
        await prefs.setStringList(key, value);
      } else {
        throw Exception('Unsupported value type');
      }
    } catch (e) {
      throw Exception('Failed to save data: $e');
    }
  }

  /// Get int or string (you can expand this as needed)
  static Future<dynamic> getData(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.get(key); // Returns dynamic (int, string, bool, etc.)
    } catch (e) {
      throw Exception('Failed to get data: $e');
    }
  }
}
