import 'package:flutter/material.dart';
import '../theme/styles.dart';

class FeatureBox extends StatelessWidget {
  const FeatureBox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.featureBoxColor,
  });

  final String title;
  final String subtitle;
  final Color featureBoxColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: featureBoxColor, borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Styles.textStyle18),
          const SizedBox(height: 5),
          Text(subtitle, style: Styles.textStyle14),
        ],
      ),
    );
  }
}
