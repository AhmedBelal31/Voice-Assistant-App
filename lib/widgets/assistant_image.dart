import 'package:flutter/material.dart';
import '../theme/pallete.dart';

class AssistantImage extends StatelessWidget {
  const AssistantImage({super.key});

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.center,
    child: Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              margin: const EdgeInsets.only(top: 4),
              decoration: const BoxDecoration(
                color: Pallete.assistantCircleColor,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 120,
              height: 120,
              margin: const EdgeInsets.only(top: 4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/virtualAssistant.png'),
                ),
              ),
            ),
          ],
        ),
  );
}
