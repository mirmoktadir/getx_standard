import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.prefixAction,
    required this.suffixAction,
  });
  final VoidCallback prefixAction;
  final VoidCallback suffixAction;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      title: const Text('Riverpod Modular'),
      leading: IconButton(
        onPressed: prefixAction,
        icon: Icon(Iconsax.moon5, color: isDark ? Colors.white : Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: suffixAction,
          icon: const Icon(IconlyBold.graph, color: Colors.white),
        ),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
