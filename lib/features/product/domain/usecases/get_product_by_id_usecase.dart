import 'package:fakestore/features/product/domain/entities/product.dart';
import 'package:fakestore/features/product/domain/repositories/i_product_repository.dart';

class GetProductByIdUseCase {
  final IProductRepository repository;

  GetProductByIdUseCase(this.repository);

  Future<Product> call(int id) async {
    return await repository.getProductById(id);
  }
}