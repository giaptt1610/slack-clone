import 'package:bloc/bloc.dart';
import '/models/product.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddItemEvent>((event, emit) {
      emit(state.addItem(event.product));
    });

    on<RemoveItemEvent>((event, emit) {
      emit(state.removeItem(event.product));
    });
  }
}
