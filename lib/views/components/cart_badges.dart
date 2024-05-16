import 'package:badges/badges.dart' as badges;
import 'package:cart_riverpod/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartBadges extends StatelessWidget {
  const CartBadges({
    super.key,
    required this.amount,
  });

  final int amount;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      badgeAnimation: const badges.BadgeAnimation.scale(),
      showBadge: amount > 0,
      badgeStyle: const badges.BadgeStyle(
        badgeColor: Colors.red,
        shape: badges.BadgeShape.circle,
      ),
      badgeContent: Text(
        amount.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      child: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
          size: 36,
        ),
        onPressed: () => context.goNamed(RouterPath.list),
      ),
    );
  }
}
