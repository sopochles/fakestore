import 'package:fakestore/features/product/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

abstract class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object?> get props => [];
}

class ProductListInitial extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  final List<Product> products;

  const ProductListLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductListError extends ProductListState {
  final String message;

  const ProductListError(this.message);

  @override
  List<Object?> get props => [message];
}
