import 'package:fakestore/features/product/domain/usecases/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductListCubit(this._getProductsUseCase) : super(ProductListInitial());

  Future<void> fetchProducts() async {
    emit(ProductListLoading());
    try {
      final products = await _getProductsUseCase.call();
      emit(ProductListLoaded(products));
    } catch (e) {
      emit(ProductListError(e.toString()));
    }
  }
}
