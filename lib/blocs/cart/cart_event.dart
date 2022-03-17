part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddItemEvent extends CartEvent {
  final Product product;

  AddItemEvent(this.product);
}

class RemoveItemEvent extends CartEvent {
  final Product product;

  RemoveItemEvent(this.product);
}
