import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';

class ViewAllTile extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  const ViewAllTile({super.key, required this.title, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Tcolor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: onpressed,
            child: Text(
              "View all",
              style: TextStyle(
                color: Tcolor.primary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
