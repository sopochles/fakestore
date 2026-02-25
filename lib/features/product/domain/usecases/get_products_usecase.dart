import 'package:fakestore/features/product/domain/entities/product.dart';
import 'package:fakestore/features/product/domain/repositories/i_product_repository.dart';

class GetProductsUseCase {
  final IProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}