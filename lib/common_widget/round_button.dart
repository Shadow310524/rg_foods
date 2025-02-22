import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';

enum RoundButtonType { bgPrimary, textPrimary }

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final RoundButtonType type;
  const RoundButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.type = RoundButtonType.bgPrimary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: type == RoundButtonType.bgPrimary
                ? null
                : Border.all(color: Tcolor.primary, width: 1),
            color: type == RoundButtonType.bgPrimary
                ? Tcolor.primary
                : Tcolor.white),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: type == RoundButtonType.bgPrimary
                  ? Tcolor.white
                  : Tcolor.primary,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
