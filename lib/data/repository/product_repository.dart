import 'dart:convert';
import 'dart:io';
import 'package:fakestore/data/models/product.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final String _baseUrl = "https://fakestoreapi.com";

  Future<List<Product>> getProducts() async {
    final uri = Uri.parse('$_baseUrl/products');
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }

  Future<Product> getProductById(int id) async {
    final uri = Uri.parse('$_baseUrl/products/$id');
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        if (response.body == 'null') {
          throw Exception('Product not found');
        }
        return Product.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load product detail');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }
}
