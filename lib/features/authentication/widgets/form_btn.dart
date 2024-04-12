import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

// ignore: must_be_immutable
class FormButton extends StatelessWidget {
  FormButton({
    super.key,
    required this.disabled,
    required this.text,
  });
  final bool disabled;
  String text;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        duration: const Duration(milliseconds: 400),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 400),
          style: TextStyle(
            color: disabled ? Colors.grey.shade500 : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
