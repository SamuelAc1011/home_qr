import 'package:dio/dio.dart';
import 'package:home_qr/home/domain/entities/time.dart';

class TimeService {
  // Variables
  final dio = Dio();
  static const String _baseUrl = 'https://timeapi.io/api/Time/current/coordinate?latitude=38.9&longitude=-77.03';

  // Method: Get the current time
  Future<Time> getTime() async {
    try {
      final response = await dio.get(_baseUrl);

      return Time.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load time: $e');
    }
  }

  // Method: Get the current time by coordinates
  Future<Time> getTimeZone( latitude, longitude) async {
    try {
      final response = await dio.get('https://timeapi.io/api/Time/current/coordinate?latitude=$latitude&longitude=$longitude');

      return Time.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load time: $e');
    }
  }

}