import 'package:cart_riverpod/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  List<Product> build() => [];

  //カート追加
  addCart(Product product) {
    state = [...state, product];
  }

  //カート削除
  removeCart(Product product) {
    state = state.where((prod) => prod != product).toList();
  }

  //数量加算
  incSuryo(Product product) {
    state = state
        .map((prod) =>
            prod != product ? prod : prod.copyWith(suryo: prod.suryo + 1))
        .toList();
  }

  //数量減算
  decSuryo(Product product) {
    state = state
        .map((prod) =>
            prod != product ? prod : prod.copyWith(suryo: prod.suryo - 1))
        .toList();
  }
}
