import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';

class Logo extends StatelessWidget {
  final VoidCallback onpressed;
  final String icon;
  final String title;
  final Color color;
  const Logo(
      {super.key,
      required this.icon,
      required this.title,
      required this.onpressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28), color: color),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              fit: BoxFit.contain,
              width: 25,
              height: 15,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Tcolor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
