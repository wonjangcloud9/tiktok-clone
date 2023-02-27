import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disable,
  });

  final bool disable;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Sizes.size5,
          ),
          color:
              disable ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(
            milliseconds: 300,
          ),
          style: TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w700,
            color: disable ? Colors.grey.shade400 : Colors.white,
          ),
          child: const Text(
            "Next",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
