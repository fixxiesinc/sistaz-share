import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return menuProvider.menuOpen.value
            ? const Menu()
            : Column(
                children: [
                  const Header(),
                  Expanded(child: child),
                ],
              );
      }),
    );
  }
}
