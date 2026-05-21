import 'package:flutter/material.dart';

import '../../features/sales/domain/models/marketplace.dart';

class MarketplaceBadge extends StatelessWidget {
  const MarketplaceBadge({required this.marketplace, super.key});

  final Marketplace? marketplace;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (marketplace) {
      Marketplace.wildberries => ('wb', const Color(0xFFCB11AB)),
      Marketplace.ozon => ('ozon', const Color(0xFF005BFF)),
      null => ('—', Colors.grey),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
