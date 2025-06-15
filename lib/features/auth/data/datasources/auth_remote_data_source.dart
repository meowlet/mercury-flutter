import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/auth_models.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResultModel> signIn({
    required String identifier,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  static const String baseUrl = 'http://10.21.4.87:3000';

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<AuthResultModel> signIn({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/sign-in'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'identifier': identifier, 'password': password}),
      );

      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (jsonResponse['success'] == true) {
          return AuthResultModel.fromJson(jsonResponse['data']);
        } else {
          throw ServerFailure(
            jsonResponse['message'] ?? 'Sign in failed',
            errorType: jsonResponse['error']?['type'],
            details: jsonResponse['error']?['details'],
          );
        }
      } else {
        throw ServerFailure(
          jsonResponse['message'] ?? 'Server error',
          errorType: jsonResponse['error']?['type'],
          details: jsonResponse['error']?['details'],
        );
      }
    } on http.ClientException catch (e) {
      throw NetworkFailure('Network error: ${e.message}');
    } catch (e) {
      if (e is ServerFailure) rethrow;
      if (e is NetworkFailure) rethrow;
      throw UnknownFailure('Unexpected error: $e');
    }
  }
}
