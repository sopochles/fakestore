import 'package:fakestore/domain/repositories/i_product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final IProductRepository _repository;

  ProductListCubit(this._repository) : super(ProductListInitial());

  Future<void> fetchProducts() async {
    emit(ProductListLoading());
    try {
      final products = await _repository.getProducts();
      emit(ProductListLoaded(products));
    } catch (e) {
      emit(ProductListError(e.toString()));
    }
  }
}