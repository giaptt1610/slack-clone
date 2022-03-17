part of 'cart_bloc.dart';

class CartState {
  /// product & quatity
  final Map<Product, int> items;

  CartState({this.items = const {}});

  CartState addItem(Product product) {
    Map<Product, int> newMap = {...items};
    if (newMap.containsKey(product)) {
      int qty = newMap[product] ?? 0;
      newMap[product] = qty + 1;
    } else {
      newMap.putIfAbsent(product, () => 1);
    }

    return CartState(items: newMap);
  }

  CartState removeItem(Product product) {
    Map<Product, int> newMap = {...items};
    if (newMap.containsKey(product)) {
      int qty = newMap[product] ?? 0;
      qty -= 1;
      if (qty <= 0) {
        newMap.remove(product);
      } else {
        newMap[product] = qty;
      }
    }

    return CartState(items: newMap);
  }

  double get totalPrice {
    double total = 0.0;

    items.forEach((product, quatity) {
      total += product.price * quatity;
    });
    return total;
  }
}
