import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static late String baseUrl;
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  final SharedPreferences _prefs;

  ApiService(this._prefs) {
    baseUrl = dotenv.env['API_BASE_URL'] ?? 'http://localhost:8080';
  }

  Future<String?> get accessToken async => _prefs.getString(_accessTokenKey);
  Future<String?> get refreshToken async => _prefs.getString(_refreshTokenKey);

  Future<void> setTokens(String accessToken, String refreshToken) async {
    await _prefs.setString(_accessTokenKey, accessToken);
    await _prefs.setString(_refreshTokenKey, refreshToken);
  }

  Future<void> clearTokens() async {
    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_refreshTokenKey);
  }

  Future<Map<String, String>> _getHeaders({bool requiresAuth = true}) async {
    final headers = {'Content-Type': 'application/json'};
    if (requiresAuth) {
      final token = await accessToken;
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  // Các phương thức cần accessToken
  Future<dynamic> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, dynamic body) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: await _getHeaders(),
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  Future<dynamic> put(String endpoint, dynamic body) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: await _getHeaders(),
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  Future<dynamic> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  // Các phương thức không cần accessToken
  Future<dynamic> getPublic(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: await _getHeaders(requiresAuth: false),
    );
    return _handleResponse(response);
  }

  Future<dynamic> postPublic(String endpoint, dynamic body) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: await _getHeaders(requiresAuth: false),
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  Future<dynamic> putPublic(String endpoint, dynamic body) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: await _getHeaders(requiresAuth: false),
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  Future<dynamic> deletePublic(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: await _getHeaders(requiresAuth: false),
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      // Token hết hạn, cần refresh token hoặc đăng nhập lại
      throw Exception('Unauthorized');
    } else {
      throw Exception('HTTP error ${response.statusCode}: ${response.body}');
    }
  }
}
