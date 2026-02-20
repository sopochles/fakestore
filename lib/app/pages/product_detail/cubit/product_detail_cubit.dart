import 'package:fakestore/app/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductRepository _repository;

  ProductDetailCubit(this._repository) : super(ProductDetailInitial());

  Future<void> fetchProduct(int id) async {
    emit(ProductDetailLoading());
    try {
      final product = await _repository.getProductById(id);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }
}