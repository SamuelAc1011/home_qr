// Packages
import 'package:dio/dio.dart';

// Imports
import 'package:home_qr/home/domain/entities/time.dart';

class TimeService {
  // Variables
  final dio = Dio();
  static const String _baseUrl = 'https://timeapi.io/api/Time/current/coordinate?';

  // Method: Get the current time by coordinates
  Future<Time> getTimeZone( latitude, longitude) async {
    try {
      final response = await dio.get('${_baseUrl}latitude=$latitude&longitude=$longitude');

      return Time.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load time: $e');
    }
  }
}