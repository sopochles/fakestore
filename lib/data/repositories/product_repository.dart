import 'dart:convert';
import 'dart:io';
import 'package:fakestore/data/models/product.dart' as model;
import 'package:fakestore/domain/entities/product.dart';
import 'package:fakestore/domain/repositories/i_product_repository.dart';
import 'package:http/http.dart' as http;

class ProductRepository implements IProductRepository {
  final String _baseUrl = "https://fakestoreapi.com";

  Product _toEntity(model.Product m) => Product(
        id: m.id,
        title: m.title,
        price: m.price,
        description: m.description,
        category: m.category,
        image: m.image,
      );

  @override
  Future<List<Product>> getProducts() async {
    final uri = Uri.parse('$_baseUrl/products');
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => _toEntity(model.Product.fromJson(json))).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    final uri = Uri.parse('$_baseUrl/products/$id');
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        if (response.body == 'null') {
          throw Exception('Product not found');
        }
        return _toEntity(model.Product.fromJson(jsonDecode(response.body)));
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