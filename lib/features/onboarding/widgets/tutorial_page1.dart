import 'package:flutter/material.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class TutorialPage1 extends StatelessWidget {
  const TutorialPage1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Gaps.v80,
          Text(
            'Watch cool videos!',
            style: TextStyle(
              fontSize: Sizes.size40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gaps.v16,
          Text(
            "Videos are presonalized for you based on what you watch, like, and share.",
            style: TextStyle(
              fontSize: Sizes.size20,
            ),
          ),
        ]);
  }
}
