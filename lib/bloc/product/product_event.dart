part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FetchProductInSubCategory extends ProductEvent {
  final int categoryId;
  final int serviceId;

  const FetchProductInSubCategory({
    required this.categoryId,
    required this.serviceId,
  });

  @override
  List<Object> get props => [categoryId, serviceId];
}
