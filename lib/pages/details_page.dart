import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/cart/cart_bloc.dart';
import '../models/product.dart';
import '../routes/app_router.dart';
import '../service_locator.dart';
import '../mocks/product_repo_mock.dart';

class DetailsPage extends StatefulWidget {
  final Product? product;
  final String? productId;
  DetailsPage({
    this.product,
    this.productId,
    Key? key,
  })  : assert(product == null || productId == null),
        super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Product? _product;

  @override
  void initState() {
    super.initState();

    // get product by id
    if (widget.productId != null) {
      _getProduct(widget.productId!).then((value) {
        setState(() {
          _product = value;
        });
      });
    } else {
      _product = widget.product;
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>().router;

    return Scaffold(
      appBar: AppBar(
        title: Text('Details, ${router.location}'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${_product?.name}'),
            Text('${_product?.desc}'),
            Text('${(_product?.price ?? 0) * 1000} đ'),
            ElevatedButton(
                onPressed: () {
                  if (_product != null) {
                    context.read<CartBloc>().add(AddItemEvent(_product!));
                    GoRouter.of(context).pop();
                  }
                },
                child: Text('Add to cart')),
          ],
        ),
      ),
    );
  }

  Future<Product> _getProduct(String id) async {
    await Future.delayed(Duration(milliseconds: 500));
    return getIt<ProductRepoMock>()
        .listProducts
        .firstWhere((element) => element.id == id);
  }
}
