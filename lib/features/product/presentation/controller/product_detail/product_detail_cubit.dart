import 'package:fakestore/features/product/domain/usecases/get_product_by_id_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final GetProductByIdUseCase _getProductByIdUseCase;

  ProductDetailCubit(this._getProductByIdUseCase)
    : super(ProductDetailInitial());

  Future<void> fetchProduct(int id) async {
    emit(ProductDetailLoading());
    try {
      final product = await _getProductByIdUseCase.call(id);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }
}
