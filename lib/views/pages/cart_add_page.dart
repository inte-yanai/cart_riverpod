import 'package:cart_riverpod/models/product.dart';
import 'package:cart_riverpod/view_models/cart.dart';
import 'package:cart_riverpod/view_models/provider.dart';
import 'package:cart_riverpod/views/components/cart_badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartAddPage extends ConsumerWidget {
  const CartAddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(cartProvider);
    final notifier = ref.read(cartProvider.notifier);

    final controller = ref.read(katabanProvider);
    final controller2 = ref.read(suryoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('cart'),
        actions: [
          CartBadges(amount: carts.length),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt),
                ),
              ),
            ),
            TextField(
              controller: controller2,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.end,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = carts.isEmpty ? 1 : carts.last.id + 1;
          final product = Product(
            id: id,
            code: 'A-$id',
            suryo: 1,
          );
          notifier.addCart(product);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
