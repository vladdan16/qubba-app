import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({required this.rating, this.size = 16, super.key});

  final int? rating;
  final double size;

  @override
  Widget build(BuildContext context) {
    final value = (rating ?? 0).clamp(0, 5);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (i) => Icon(
          i < value ? Icons.star : Icons.star_border,
          size: size,
          color: Colors.amber.shade700,
        ),
      ),
    );
  }
}
