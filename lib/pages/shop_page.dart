import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart';

import '../blocs/cart/cart_bloc.dart';
import '../routes/app_router.dart';
import '../widgets/shop_item.dart';
import '../mocks/product_repo_mock.dart';
import '../service_locator.dart';

class ShopPage extends StatefulWidget {
  ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final listProducts = getIt<ProductRepoMock>().listProducts;

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${router.router.location}'),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            buildWhen: (previous, current) {
              return previous.items.length != current.items.length;
            },
            builder: (context, state) {
              return Badge(
                badgeContent: Text('${state.items.length}'),
                showBadge: state.items.isNotEmpty,
                position: BadgePosition(top: 0, end: 5),
                child: IconButton(
                  onPressed: () {
                    router.router.push('/cart');
                  },
                  icon: Icon(Icons.shopping_basket),
                ),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: listProducts.length,
                itemBuilder: (context, index) =>
                    ShopItem(product: listProducts[index]),
                separatorBuilder: (context, index) => Divider(),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Checkout')),
          ],
        ),
      ),
    );
  }
}
