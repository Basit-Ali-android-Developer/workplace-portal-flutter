import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.color = Colors.white,
  });

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return
      Card(
      elevation: 2, // Matches your exact styling
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}