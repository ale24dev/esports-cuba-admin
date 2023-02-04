import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.mobileLayout,
    required this.webLayout,
  }) : super(key: key);

  final Widget mobileLayout;
  final Widget webLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        child: constraints.maxWidth > 1000 ? webLayout : mobileLayout,
      );
    });
  }
}