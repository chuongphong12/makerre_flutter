import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:makerre_flutter/models/product_model.dart';
import 'package:makerre_flutter/repositories/service_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ServiceRepository _serviceRepository;
  ProductBloc({required ServiceRepository serviceRepository})
      : _serviceRepository = serviceRepository,
        super(ProductInitial()) {
    on<FetchProductInSubCategory>(_onFetchProductSubCate);
  }

  void _onFetchProductSubCate(
      FetchProductInSubCategory event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final product = await _serviceRepository.getProduct(
        categoryId: event.categoryId,
        serviceId: event.serviceId,
      );
      emit(ProductLoaded(product: product));
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ProductFailure(error: e.toString()));
    }
  }
}
