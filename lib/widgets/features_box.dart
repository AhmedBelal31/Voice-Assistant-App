import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../theme/pallete.dart';
import 'feature_box.dart';

class FeaturesBox extends StatelessWidget {
  const FeaturesBox({super.key});

  final int start = 200;

  final int delay = 200;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SlideInLeft(
          delay: Duration(milliseconds: start),
          child: const FeatureBox(
            title: 'ChatGPT ',
            subtitle:
                'A smarter way to stay organized and informed with ChatGPT',
            featureBoxColor: Pallete.firstSuggestionBoxColor,
          ),
        ),
        SlideInLeft(
          delay: Duration(milliseconds: start + delay),
          child: const FeatureBox(
            title: 'Dall-E ',
            subtitle:
                'Get Inspired and stay creative with your personal assistant powered by Dall-E',
            featureBoxColor: Pallete.secondSuggestionBoxColor,
          ),
        ),
        SlideInLeft(
          delay: Duration(milliseconds: start + 2 * delay),
          child: FeatureBox(
            title: 'Smart Voice Assistant ',
            subtitle:
                'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT  ',
            featureBoxColor: Pallete.thirdSuggestionBoxColor,
          ),
        ),
      ],
    );
  }
}
