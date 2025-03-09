import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';

class BottomIcon extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String title;
  final bool isSelected;

  const BottomIcon({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            color: isSelected ? Tcolor.primary : Tcolor.placeholder,
            icon,
            width: 15,
            height: 15,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                color: isSelected ? Tcolor.primary : Tcolor.placeholder,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
