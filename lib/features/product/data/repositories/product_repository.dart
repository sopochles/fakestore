import 'package:fakestore/core/network/http_network.dart';
import 'package:fakestore/features/product/data/models/product.dart';
import 'package:fakestore/features/product/domain/entities/product.dart';
import 'package:fakestore/features/product/domain/repositories/i_product_repository.dart';

class ProductRepository implements IProductRepository {


  @override
  Future<List<Product>> getProducts() async {
    final data = await HttpNetwork.get('/products');
    return (data as List)
        .map((json) => (ProductModel.fromJson(json).toEntity()))
        .toList();
  }

  @override
  Future<Product> getProductById(int id) async {
    final data = await HttpNetwork.get('/products/$id');
    if (data == null) throw Exception('Product not found');
    return ProductModel.fromJson(data).toEntity();
  }
}