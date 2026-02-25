import 'dart:convert';
import 'dart:io';
import 'package:fakestore/core/network/error/exceptions.dart';
import 'package:http/http.dart' as http;

class HttpNetwork {
  static const String baseUrl = 'https://fakestoreapi.com';

  static Future<dynamic> get(String endpoint) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ServerException('Failed: ${response.statusCode}', response.statusCode);
      }
    } on SocketException {
      throw ServerException('No Internet connection', null);
    } catch (e) {
      throw ServerException('An unexpected error occurred', null);
    }
  }
}