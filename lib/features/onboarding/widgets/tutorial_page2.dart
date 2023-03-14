import 'package:flutter/material.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class TutorialPage2 extends StatelessWidget {
  const TutorialPage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Gaps.v80,
          Text(
            'Follow the rules!',
            style: TextStyle(
              fontSize: Sizes.size40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gaps.v16,
          Text(
            "Take care of one another! plis!",
            style: TextStyle(
              fontSize: Sizes.size20,
            ),
          ),
        ]);
  }
}
