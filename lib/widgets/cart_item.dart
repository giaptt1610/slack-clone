import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/cart/cart_bloc.dart';
import '/models/product.dart';

class CartItem extends StatelessWidget {
  final Product product;
  const CartItem({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  '${product.name}',
                ),
                SizedBox(height: 6.0),
                Text(
                  '${product.desc}',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey[300]),
                ),
              ],
            ),
          ),
          Text('${product.price * 1000} đ x '),
          SizedBox(
            child: Column(
              children: [
                BlocBuilder<CartBloc, CartState>(
                  buildWhen: (previous, current) {
                    return previous.items[product] != current.items[product];
                  },
                  builder: (context, state) {
                    return Text('${state.items[product]}');
                  },
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(RemoveItemEvent(product));
                        },
                        icon: Icon(Icons.remove)),
                    SizedBox(width: 12.0),
                    IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(AddItemEvent(product));
                        },
                        icon: Icon(Icons.add)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
