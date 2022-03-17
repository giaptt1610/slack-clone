import '/models/product.dart';

class ProductRepoMock {
  final listProducts = <Product>[
    Product(id: '1', name: 'Product 1', price: 10),
    Product(id: '2', name: 'Product 2', price: 15),
    Product(id: '3', name: 'Product 3', price: 12.5),
    Product(id: '4', name: 'Product 4', price: 9.5),
    Product(id: '5', name: 'Product 5', price: 6.5),
    Product(id: '6', name: 'Product 6', price: 4.5),
  ];
}
