import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/view/menu/items_cart.dart';

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  List<Map<String, dynamic>> offer_arr = [
    {
      "image": "assets/images/off1.png",
      "name": "Café de Noires",
      "rate": "4.3",
      "rating": "187",
      "type": "Cafe",
      "food_type": "Western Food",
      "description":
          "A cozy café known for its artisanal coffee and freshly baked pastries."
    },
    {
      "image": "assets/images/off2.png",
      "name": "Isso",
      "rate": "4.6",
      "rating": "214",
      "type": "Seafood",
      "food_type": "Asian Fusion",
      "description": "Specializing in fresh seafood dishes with a modern twist."
    },
    {
      "image": "assets/images/off3.png",
      "name": "Cafe Beans",
      "rate": "4.2",
      "rating": "158",
      "type": "Cafe",
      "food_type": "Organic & Healthy",
      "description":
          "A trendy café offering organic meals and handpicked specialty coffee."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Latest Offers",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset("assets/images/shopping-cart.png",
                          width: 22.76, height: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Find discounts, Offers special\n meals and more!",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Tcolor.secondaryText,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IconButton.filled(
                  onPressed: () {},
                  icon: Text(
                    "Check Offers",
                    style: TextStyle(color: Tcolor.white),
                  ),
                  style: IconButton.styleFrom(backgroundColor: Tcolor.primary),
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: offer_arr.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var offer_food = offer_arr[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemsCart(
                                    imageUrl: offer_food["image"],
                                    name: offer_food["name"],
                                    star: double.parse(offer_food["rate"]),
                                    description: offer_food["description"])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              offer_food["image"],
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                offer_food["name"],
                                style: TextStyle(
                                    color: Tcolor.primaryText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Tcolor.primary,
                                    size: 15,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    offer_food["rate"],
                                    style: TextStyle(
                                        color: Tcolor.primary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "${offer_food["rating"]} ratings",
                                    style: TextStyle(
                                        color: Tcolor.secondaryText,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    offer_food["type"],
                                    style: TextStyle(
                                        color: Tcolor.secondaryText,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.circle,
                                      size: 5, color: Tcolor.primary),
                                  SizedBox(width: 10),
                                  Text(
                                    offer_food["food_type"],
                                    style: TextStyle(
                                        color: Tcolor.secondaryText,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
