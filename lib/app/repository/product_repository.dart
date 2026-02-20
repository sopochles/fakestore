import 'package:fakestore/app/models/product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductRepository {
  final String _baseUrl = "https://fakestoreapi.com";

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> getProductById(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product detail');
    }
  }
}
