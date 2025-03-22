import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/data/wishlist_items.dart';
import 'package:flutter/foundation.dart';

import '../../home/models/home_product_data_model.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {

  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEventHandler);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEventHandler);
  }

  FutureOr<void> wishlistInitialEventHandler(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {

    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveFromWishlistEventHandler(
      WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {

      wishlistItems.remove(event.productDataModel);
      emit(WishlistRemovedActionState());
      emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
