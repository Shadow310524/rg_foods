import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';

class FirstTile extends StatelessWidget {
  final List<Map<String, String>> restuarants;
  final VoidCallback onpressed;
  const FirstTile(
      {super.key, required this.restuarants, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: restuarants.length,
          itemBuilder: (context, index) {
            var resturant = restuarants[index];
            return InkWell(
              onTap: onpressed,
              child: Container(
                margin: EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        resturant["image"]!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      resturant["name"]!,
                      style: TextStyle(
                          color: Tcolor.primaryText,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
