import 'package:bloc_flutter/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_flutter/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      productDataModel.imageUrl,
                    ),
                    fit: BoxFit.cover
                )
            ),
          ),
          const SizedBox(height: 10,),
          Text(productDataModel.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),),
          Text(productDataModel.description),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text('\$${productDataModel.price}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Row(

                children: [
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(HomeProductWishListButtonClickedEvent(
                      //     productDataModel
                      // ));

                    },
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {

                      cartBloc.add(CartRemoveFromCartEvent(
                        productDataModel: productDataModel
                      ));

                    },
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}
