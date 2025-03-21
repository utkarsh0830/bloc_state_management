import 'package:bloc_flutter/features/home/bloc/home_bloc.dart';
import 'package:bloc_flutter/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

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
                      homeBloc.add(HomeProductWishListButtonClickedEvent(
                        productDataModel
                      ));

                    },
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {

                      homeBloc.add(HomeProductCartButtonClickedEvent(
                        productDataModel
                      ));

                    },
                    icon: const Icon(
                      Icons.add_shopping_cart_outlined,
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
