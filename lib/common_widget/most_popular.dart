import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';

class MostPopular extends StatelessWidget {
  final List<Map<String, dynamic>> most_popular;
  final VoidCallback onpressed;
  const MostPopular({
    super.key,
    required this.most_popular,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: most_popular.length,
          itemBuilder: (context, index) {
            var mostpopular = most_popular[index];
            return InkWell(
              onTap: onpressed,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          mostpopular["image"],
                          height: 150,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      mostpopular["name"],
                      style: TextStyle(
                          color: Tcolor.primaryText,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          mostpopular["type"]!,
                          style: TextStyle(
                              color: Tcolor.secondaryText,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 10),
                        Text(
                          ".",
                          style: TextStyle(
                              color: Tcolor.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(width: 10),
                        Text(
                          mostpopular["food_type"]!,
                          style: TextStyle(
                              color: Tcolor.secondaryText,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.star,
                          color: Tcolor.primary,
                          size: 20,
                        ),
                        Text(
                          mostpopular["rate"]!,
                          style: TextStyle(
                              color: Tcolor.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
