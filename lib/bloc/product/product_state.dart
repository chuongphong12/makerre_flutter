part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Product product;

  const ProductLoaded({required this.product});

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'ProductLoaded(product: $product)';
}

class ProductFailure extends ProductState {
  final String error;
  const ProductFailure({
    required this.error,
  });

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'ProductFailure(error: $error)';
}
