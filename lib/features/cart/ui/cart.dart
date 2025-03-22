import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import 'cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
      ),
      body: BlocConsumer<CartBloc,CartState>(
        bloc: cartBloc,
        listenWhen: (previous,current) => current is CartActionState,
        buildWhen: (previous,current) => current is !CartActionState,
        listener: (context,state){

          if(state is CartRemovedActionState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Item Removed from Cart"))
            );
          }

        },
        builder: (context,state){
          switch(state.runtimeType){
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context,index){
                    return CartTileWidget(
                      cartBloc: cartBloc,
                      productDataModel: successState.cartItems[index],
                    );
                  });
          }
          return Container();
        },
      ),

    );
  }
}