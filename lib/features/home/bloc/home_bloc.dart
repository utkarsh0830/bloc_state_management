import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/data/cart_items.dart';
import 'package:bloc_flutter/data/grocery_data.dart';
import 'package:bloc_flutter/data/wishlist_items.dart';
import 'package:flutter/foundation.dart';

import '../models/home_product_data_model.dart'; // For @immutable

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {

    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishListButtonClickedEvent>(homeProductWishlistButtonClicked);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{

    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductDataModel(
        id: e['id'],
        name: e['name'],
        description: e['description'],
        price: e['price'],
        imageUrl: e['imageUrl']
      )).toList()
    ));
  }

  FutureOr<void> homeProductWishlistButtonClicked
      (HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print("clicked1");
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("clicked2");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());

  }

  FutureOr<void> homeWishListButtonNavigateEvent(HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("clicked3");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("clicked4");
    emit(HomeNavigateToCartPageActionState());
  }


}
