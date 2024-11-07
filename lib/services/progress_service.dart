import 'dart:developer';
import 'package:workout_ai/services/api_service.dart';
import 'package:workout_ai/models/progress_data.dart';

class ProgressService {
  final APIService _api = APIService();

  Future<ProgressResponse> getProgress() async {
    try {
      final response = await _api.get('progress');
      log('Progress response: $response');

      if (response['statusCode'] != 200) {
        throw Exception(response['error'] ??
            response['message'] ??
            'Failed to fetch progress data');
      }

      return ProgressResponse.fromJson(response);
    } catch (e) {
      log('Error in getProgress: $e');
      rethrow;
    }
  }
}