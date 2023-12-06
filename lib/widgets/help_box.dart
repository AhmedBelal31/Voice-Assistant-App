import 'package:flutter/material.dart';
import '../theme/pallete.dart';
import '../theme/styles.dart';

class HelpBox extends StatelessWidget {
  const HelpBox({super.key, this.generatedContent});

  final String? generatedContent;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Pallete.borderColor,
          ),
          borderRadius: BorderRadius.circular(20.0).copyWith(
            topLeft: Radius.zero,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
          child: Text(
            generatedContent == null
                ? 'Good Morning , What task can i do for you ?'
                : generatedContent!,
            style: generatedContent == null
                ? Styles.textStyle25
                : Styles.textStyle16,
          ),
        ),
      );
}
