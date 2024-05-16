import 'package:cart_riverpod/view_models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartListPage extends ConsumerWidget {
  const CartListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(cartProvider);
    final notifier = ref.read(cartProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(8),
        height: 400,
        color: Colors.green,
        child: Column(
          children: [
            const Row(
              children: [
                SizedBox(width: 100, child: Text('商品')),
                SizedBox(width: 100, child: Text('数量')),
                SizedBox(width: 100, child: Text('a')),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: carts.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.2,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) => notifier.removeCart(carts[index]),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(carts[index].code),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () => notifier.incSuryo(carts[index]),
                          icon: const Icon(Icons.add),
                        ),
                        const SizedBox(width: 16),
                        Text(carts[index].suryo.toString()),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: carts[index].suryo > 0
                              ? () => notifier.decSuryo(carts[index])
                              : null,
                          icon: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
