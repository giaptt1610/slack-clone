import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/cart/cart_bloc.dart';
import '../models/product.dart';

class ShopItem extends StatelessWidget {
  final Product product;
  const ShopItem({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
                onTap: () {
                  context
                      .pushNamed('product', params: {'productId': product.id});
                },
                child: Column(
                  children: [
                    Text('${product.name}'),
                    SizedBox(height: 6.0),
                    Text('${product.price * 1000} đ'),
                  ],
                )),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(AddItemEvent(product));
              },
              child: Text('Add to cart')),
        ],
      ),
    );
  }
}
