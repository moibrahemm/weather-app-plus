import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedLoadingText extends StatelessWidget {
  const AnimatedLoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        ColorizeAnimatedText(
          'Getting your current location...',
          textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          colors: [Colors.white, Colors.grey.shade400, Colors.white],
        ),
      ],
      isRepeatingAnimation: true,
    );
  }
}
