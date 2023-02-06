import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:delivery_app/app/pages/home/home_state.dart';
import 'package:delivery_app/app/repositories/products/products_repository.dart';
import 'package:flutter/material.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;
  HomeController(
    this._productsRepository,
  ) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productsRepository.findAllProducts();
      await Future.delayed(const Duration(seconds: 2));
      // throw Exception();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log("Error ao buscar produtos", error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStateStatus.error, errorMessage: "Error ao buscar produtos"));
    }
  }

  void addOrUpdateBag(OrderProductDto orderProduct) {
    final shoppingBag = [...state.shoppingBag];

    final index = shoppingBag.indexWhere((element) => element.product == orderProduct.product);

    if (index > -1) {
      if (orderProduct.amount == 0) {
        shoppingBag.removeAt(index);
      } else {
        shoppingBag[index] = orderProduct;
      }
    } else {
      shoppingBag.add(orderProduct);
    }

    emit(state.copyWith(shoppingBag: shoppingBag));

    debugPrint(state.shoppingBag.toString());
  }
}
