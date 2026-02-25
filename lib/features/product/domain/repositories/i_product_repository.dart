import 'package:fakestore/features/product/domain/entities/product.dart'; // ✅

abstract class IProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(int id);
}