import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';

class PopularRestaurant extends StatelessWidget {
  final List<Map<String, dynamic>> popular_restaurant;
  final VoidCallback ontap;
  const PopularRestaurant({
    super.key,
    required this.popular_restaurant,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: popular_restaurant.length,
        itemBuilder: (context, index) {
          var popular_resturant = popular_restaurant[index];
          return InkWell(
            onTap: ontap,
            child: Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    popular_resturant["image"]!,
                    width: double.maxFinite,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      popular_resturant["name"]!,
                      style: TextStyle(
                          color: Tcolor.primaryText,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Tcolor.primary,
                          size: 20,
                        ),
                        Text(
                          popular_resturant["rate"]!,
                          style: TextStyle(
                              color: Tcolor.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "${popular_resturant["rating"]} Ratings",
                          style: TextStyle(
                              color: Tcolor.secondaryText,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 10),
                        Text(
                          popular_resturant["type"]!,
                          style: TextStyle(
                              color: Tcolor.secondaryText,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.circle, size: 5, color: Tcolor.primary),
                        SizedBox(width: 10),
                        Text(
                          popular_resturant["food_type"]!,
                          style: TextStyle(
                              color: Tcolor.secondaryText,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
